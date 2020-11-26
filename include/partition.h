#ifndef INCLUDE_PARTITION_H_
#define INCLUDE_PARTITION_H_
#include <string>

void MetisAssignment(int64_t num_partition, std::string input_filename,
                     std::string output_filename, size_t mpi_com_handle);

int64_t NumNodes(std::string input_filename);

void MergePartArr(std::string output_filename, int64_t comm_size,
                  int64_t num_nodes);
#endif /* INCLUDE_PARTITION_H_ */
