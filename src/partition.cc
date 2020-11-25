#include <dmlc/io.h>
#include <mpi.h>
#include <parmetis.h>
#include <partition.h>

#include <memory>

void MetisAssignment(int64_t num_partition, std::string input_filename,
                     std::string output_filename, size_t mpi_com_handle) {
  auto fs = std::unique_ptr<dmlc::SeekStream>(
    dmlc::SeekStream::CreateForRead(input_filename.c_str()));
  static_assert(std::is_same<idx_t, int64_t>::value, "type must be `int64_t`");
  static_assert(std::is_same<real_t, float>::value, "real_t must be `float`");

  MPI_Comm *mpi_con = reinterpret_cast<MPI_Comm *>(mpi_com_handle);
  int mpi_size, rank;
  MPI_Comm_size(*mpi_con, &mpi_size);
  MPI_Comm_rank(*mpi_con, &rank);

  uint64_t magicNum;
  size_t indptr_start_pos, indcies_start_pos, vwgt_start_pos;
  idx_t num_vertexs;
  fs->Read(&magicNum);
  fs->Read(&num_vertexs);
  fs->Read(&indptr_start_pos);
  fs->Read(&indcies_start_pos);
  fs->Read(&vwgt_start_pos);

  std::vector<idx_t> indptr, indices, vwgt_arr;
  std::vector<idx_t> part_arr;
  part_arr.resize(num_vertexs);

  std::vector<idx_t> vtxdist;
  vtxdist.push_back(0);
  size_t pos = num_vertexs / mpi_size;
  for (size_t i = 1; i < mpi_size + 1; i++) {
    if (pos > num_vertexs) {
      pos = num_vertexs;
    }
    vtxdist.push_back(pos);
    pos += num_vertexs / mpi_size;
  }
  size_t num_indptr = vtxdist[rank + 1] - vtxdist[rank];
  indptr.resize(num_indptr + 1);
  fs->Seek(indptr_start_pos + vtxdist[rank] * sizeof(int64_t));
  fs->ReadArray(&indptr[0], num_indptr + 1);
  size_t num_indices = indptr[indptr.size() - 1] - indptr[0];
  fs->Seek(indcies_start_pos + num_indices * sizeof(int64_t));
  indices.resize(num_indices);
  fs->ReadArray(&indices[0], num_indices);
  for (size_t i = 1; i < indptr.size(); i++) {
    indptr[i] = indptr[i] - indptr[0];
  }

  idx_t nvtxs      = num_vertexs;
  idx_t ncon       = 1;  // # balacing constraints.
  idx_t *xadj      = &indptr[1];
  idx_t *adjncy    = &indices[0];
  idx_t nparts     = num_partition;
  idx_t objval     = 0;
  idx_t *part      = &part_arr[0];
  int64_t vwgt_len = vwgt_arr.size();
  idx_t *vwgt      = NULL;
  idx_t wgtflag    = 0;
  if (vwgt_len > 0) {
    ncon    = vwgt_len / num_vertexs;
    vwgt    = &vwgt_arr[0];
    wgtflag = 2;
  }
  idx_t numflag    = 0;
  idx_t options[3] = {0, 0, 0};
  std::vector<real_t> tpwgts;
  tpwgts.resize(ncon * nparts);
  std::fill(tpwgts.begin(), tpwgts.end(), 1.0f / (ncon * nparts));
  std::vector<real_t> ubvec;
  ubvec.resize(ncon);
  std::fill(ubvec.begin(), ubvec.end(), 1.05f);
  ParMETIS_V3_PartKway(
    &vtxdist[0],  // vertex partition,
    xadj,         // indptr
    adjncy,       // indices
    vwgt,         // the weights of the vertices
    nullptr,      // edge weight
    &wgtflag,     // flags of whether use weights of the edges
    &numflag,     // count from zero
    &ncon,        // The number of balancing constraints.
    &nparts,      // Number of partitions
    &tpwgts[0],   // the desired weight for each partition and constraint
    &ubvec[0],    // the allowed load imbalanceg tolerance
    &options[0],  // options
    &objval,      // total edge cut
    part,         // partition output
    mpi_con);

  auto out_fs = std::unique_ptr<dmlc::Stream>(
    dmlc::Stream::Create(output_filename.c_str(), "w"));
  out_fs->Write(part_arr);
}