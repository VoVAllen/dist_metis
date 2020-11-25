#ifndef INCLUDE_PARTITION_H_
#define INCLUDE_PARTITION_H_
#include <string>

void MetisAssignment(int64_t num_partition, std::string input_filename,
                     std::string output_filename, size_t mpi_com_handle);
#endif /* INCLUDE_PARTITION_H_ */
