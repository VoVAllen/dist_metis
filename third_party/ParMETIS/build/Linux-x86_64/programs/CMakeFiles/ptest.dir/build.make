# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/tools/parmetis-4.0.3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64

# Include any dependencies generated for this target.
include programs/CMakeFiles/ptest.dir/depend.make

# Include the progress variables for this target.
include programs/CMakeFiles/ptest.dir/progress.make

# Include the compile flags for this target's objects.
include programs/CMakeFiles/ptest.dir/flags.make

programs/CMakeFiles/ptest.dir/ptest.c.o: programs/CMakeFiles/ptest.dir/flags.make
programs/CMakeFiles/ptest.dir/ptest.c.o: ../../programs/ptest.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object programs/CMakeFiles/ptest.dir/ptest.c.o"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && /usr/local/mpi/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ptest.dir/ptest.c.o   -c /home/ubuntu/tools/parmetis-4.0.3/programs/ptest.c

programs/CMakeFiles/ptest.dir/ptest.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ptest.dir/ptest.c.i"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && /usr/local/mpi/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/tools/parmetis-4.0.3/programs/ptest.c > CMakeFiles/ptest.dir/ptest.c.i

programs/CMakeFiles/ptest.dir/ptest.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ptest.dir/ptest.c.s"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && /usr/local/mpi/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/tools/parmetis-4.0.3/programs/ptest.c -o CMakeFiles/ptest.dir/ptest.c.s

programs/CMakeFiles/ptest.dir/io.c.o: programs/CMakeFiles/ptest.dir/flags.make
programs/CMakeFiles/ptest.dir/io.c.o: ../../programs/io.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object programs/CMakeFiles/ptest.dir/io.c.o"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && /usr/local/mpi/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ptest.dir/io.c.o   -c /home/ubuntu/tools/parmetis-4.0.3/programs/io.c

programs/CMakeFiles/ptest.dir/io.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ptest.dir/io.c.i"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && /usr/local/mpi/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/tools/parmetis-4.0.3/programs/io.c > CMakeFiles/ptest.dir/io.c.i

programs/CMakeFiles/ptest.dir/io.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ptest.dir/io.c.s"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && /usr/local/mpi/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/tools/parmetis-4.0.3/programs/io.c -o CMakeFiles/ptest.dir/io.c.s

programs/CMakeFiles/ptest.dir/adaptgraph.c.o: programs/CMakeFiles/ptest.dir/flags.make
programs/CMakeFiles/ptest.dir/adaptgraph.c.o: ../../programs/adaptgraph.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object programs/CMakeFiles/ptest.dir/adaptgraph.c.o"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && /usr/local/mpi/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ptest.dir/adaptgraph.c.o   -c /home/ubuntu/tools/parmetis-4.0.3/programs/adaptgraph.c

programs/CMakeFiles/ptest.dir/adaptgraph.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ptest.dir/adaptgraph.c.i"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && /usr/local/mpi/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/tools/parmetis-4.0.3/programs/adaptgraph.c > CMakeFiles/ptest.dir/adaptgraph.c.i

programs/CMakeFiles/ptest.dir/adaptgraph.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ptest.dir/adaptgraph.c.s"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && /usr/local/mpi/bin/mpicc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/tools/parmetis-4.0.3/programs/adaptgraph.c -o CMakeFiles/ptest.dir/adaptgraph.c.s

# Object files for target ptest
ptest_OBJECTS = \
"CMakeFiles/ptest.dir/ptest.c.o" \
"CMakeFiles/ptest.dir/io.c.o" \
"CMakeFiles/ptest.dir/adaptgraph.c.o"

# External object files for target ptest
ptest_EXTERNAL_OBJECTS =

programs/ptest: programs/CMakeFiles/ptest.dir/ptest.c.o
programs/ptest: programs/CMakeFiles/ptest.dir/io.c.o
programs/ptest: programs/CMakeFiles/ptest.dir/adaptgraph.c.o
programs/ptest: programs/CMakeFiles/ptest.dir/build.make
programs/ptest: libparmetis/libparmetis.so
programs/ptest: libmetis/libmetis.a
programs/ptest: programs/CMakeFiles/ptest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable ptest"
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ptest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
programs/CMakeFiles/ptest.dir/build: programs/ptest

.PHONY : programs/CMakeFiles/ptest.dir/build

programs/CMakeFiles/ptest.dir/clean:
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs && $(CMAKE_COMMAND) -P CMakeFiles/ptest.dir/cmake_clean.cmake
.PHONY : programs/CMakeFiles/ptest.dir/clean

programs/CMakeFiles/ptest.dir/depend:
	cd /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/tools/parmetis-4.0.3 /home/ubuntu/tools/parmetis-4.0.3/programs /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64 /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs /home/ubuntu/tools/parmetis-4.0.3/build/Linux-x86_64/programs/CMakeFiles/ptest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : programs/CMakeFiles/ptest.dir/depend

