#include <partition.h>
#include <pybind11/pybind11.h>
namespace py = pybind11;

int add(int i, int j) { return i + j; }

PYBIND11_MODULE(pymetis, m) {
  m.doc() = "pymetis";  // optional module docstring

  m.def("metis_assignment", &MetisAssignment,
        "A function to generate metis assignment");
  m.def("num_nodes", &NumNodes, "A function to read number of nodes");
  m.def("merge_results", &MergePartArr, "A function to merge results from MPI");
}