cmake_minimum_required(VERSION 3.5)
########################################
# Borrowed and adapted from TVM project
########################################
project(pymetis C CXX)
message(STATUS "Start configuring project ${PROJECT_NAME}")
# set(PYTHON_EXECUTABLE "")
execute_process(COMMAND python3 -c "import sys; print(sys.executable)"
                      WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
                      OUTPUT_VARIABLE PYTHON_EXECUTABLE
                      OUTPUT_STRIP_TRAILING_WHITESPACE)
message(STATUS "PE: ${PYTHON_EXECUTABLE}")
add_subdirectory("third_party/pybind11")

set(CMAKE_C_FLAGS "-O2 -Wall -fPIC ${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "-O2 -Wall -fPIC -std=c++11 ${CMAKE_CXX_FLAGS}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DIDXTYPEWIDTH=64 -DREALTYPEWIDTH=32")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DIDXTYPEWIDTH=64 -DREALTYPEWIDTH=32")

include(FindMPI)
if(NOT MPI_FOUND)
  message(FATAL_ERROR "mpi is not found")
endif()
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${MPI_COMPILE_FLAGS}")
MESSAGE(STATUS "MPI Flag: ${MPI_COMPILE_FLAGS}")
MESSAGE(STATUS "MPI Include Path: ${MPI_CXX_INCLUDE_PATH}")
MESSAGE(STATUS "MPI C Libraries Path: ${MPI_C_LIBRARIES}")

include_directories(${MPI_C_INCLUDE_PATH})
set(SHARED OFF)
set(GKLIB_PATH "${CMAKE_SOURCE_DIR}/third_party/GKlib")
include(${GKLIB_PATH}/GKlibSystem.cmake)
# set(METIS_PATH "${CMAKE_SOURCE_DIR}/third_party/ParMETIS/metis")
# include(${GKLIB_PATH}/GKlibSystem.cmake)
include_directories(${GKLIB_PATH})
include_directories("third_party/ParMETIS/include")
include_directories("third_party/METIS/include")
# include_directories("third_party/ParMETIS/include")
# include_directories("third_party/ParMETIS/metis/include")
add_subdirectory("third_party/GKlib")
add_subdirectory("third_party/METIS/libmetis/")
add_subdirectory("third_party/ParMETIS/libparmetis")

include_directories("third_party/dmlc-core/include")
add_subdirectory("third_party/dmlc-core")


include_directories("include")
pybind11_add_module(pymetis MODULE src/api.cc src/partition.cc src/read_num_nodes.cc)
target_link_libraries(pymetis PRIVATE dmlc parmetis metis GKlib ${MPI_CXX_LIBRARIES} ${MPI_CXX_LINK_FLAGS})