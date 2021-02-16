# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lucas/Desktop/11_Github/FMI/fmusdk

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lucas/Desktop/11_Github/FMI/fmusdk/debug

# Include any dependencies generated for this target.
include CMakeFiles/values_20_cs.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/values_20_cs.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/values_20_cs.dir/flags.make

CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.o: CMakeFiles/values_20_cs.dir/flags.make
CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.o: ../fmu20/src/models/values/values.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.o   -c /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu20/src/models/values/values.c

CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu20/src/models/values/values.c > CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.i

CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu20/src/models/values/values.c -o CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.s

# Object files for target values_20_cs
values_20_cs_OBJECTS = \
"CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.o"

# External object files for target values_20_cs
values_20_cs_EXTERNAL_OBJECTS =

../temp/fmu20/cs/values/binaries/linux64/values.so: CMakeFiles/values_20_cs.dir/fmu20/src/models/values/values.c.o
../temp/fmu20/cs/values/binaries/linux64/values.so: CMakeFiles/values_20_cs.dir/build.make
../temp/fmu20/cs/values/binaries/linux64/values.so: CMakeFiles/values_20_cs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library ../temp/fmu20/cs/values/binaries/linux64/values.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/values_20_cs.dir/link.txt --verbose=$(VERBOSE)
	/usr/local/bin/cmake -E copy /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu20/src/models/values/modelDescription_cs.xml /home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/values/modelDescription.xml
	/usr/local/bin/cmake -E copy /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu20/src/models/values/values.c /home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/values/sources/values.c
	/usr/local/bin/cmake -E copy /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu20/src/models/fmuTemplate.c /home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/values/sources/fmuTemplate.c
	/usr/local/bin/cmake -E copy /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu20/src/models/fmuTemplate.h /home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/values/sources/fmuTemplate.h
	cd /home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/values && /usr/local/bin/cmake -E tar cfv /home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/values.fmu --format=zip modelDescription.xml binaries sources

# Rule to build all files generated by this target.
CMakeFiles/values_20_cs.dir/build: ../temp/fmu20/cs/values/binaries/linux64/values.so

.PHONY : CMakeFiles/values_20_cs.dir/build

CMakeFiles/values_20_cs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/values_20_cs.dir/cmake_clean.cmake
.PHONY : CMakeFiles/values_20_cs.dir/clean

CMakeFiles/values_20_cs.dir/depend:
	cd /home/lucas/Desktop/11_Github/FMI/fmusdk/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lucas/Desktop/11_Github/FMI/fmusdk /home/lucas/Desktop/11_Github/FMI/fmusdk /home/lucas/Desktop/11_Github/FMI/fmusdk/debug /home/lucas/Desktop/11_Github/FMI/fmusdk/debug /home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles/values_20_cs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/values_20_cs.dir/depend

