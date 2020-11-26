#include <dmlc/io.h>
#include <mpi.h>
#include <parmetis.h>
#include <partition.h>

#include <iostream>
#include <memory>
#include <string>

int64_t NumNodes(std::string input_filename) {
  auto fs = std::unique_ptr<dmlc::SeekStream>(
    dmlc::SeekStream::CreateForRead(input_filename.c_str()));
  uint64_t magicNum;
  size_t indptr_start_pos, indcies_start_pos, vwgt_start_pos;
  idx_t num_vertexs;
  fs->Read(&magicNum);
  fs->Read(&num_vertexs);
  //   fs->Read(&indptr_start_pos);
  //   fs->Read(&indcies_start_pos);
  //   fs->Read(&vwgt_start_pos);
  return num_vertexs;
};

void MergePartArr(std::string output_filename, int64_t comm_size,
                  int64_t num_nodes) {
  auto out_fs = std::unique_ptr<dmlc::Stream>(
    dmlc::Stream::Create(output_filename.c_str(), "w"));
  out_fs->Write(num_nodes);
  for (size_t i = 0; i < comm_size; i++) {
    std::vector<int64_t> part_arr;
    auto out_pfs =
      std::unique_ptr<dmlc::SeekStream>(dmlc::SeekStream::CreateForRead(
        (output_filename + std::to_string(i)).c_str()));
    out_pfs->Read(&part_arr);
    out_fs->Write(&part_arr[0], part_arr.size() * sizeof(int64_t));
    // for (size_t i = 0; i < part_arr.size(); i++) {
    //   LOG(INFO) << part_arr[i];
    // }
  }
};