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
include CMakeFiles/fmusim_10_me.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/fmusim_10_me.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/fmusim_10_me.dir/flags.make

CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.o: CMakeFiles/fmusim_10_me.dir/flags.make
CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.o: ../fmu10/src/model_exchange/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.o   -c /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/model_exchange/main.c

CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/model_exchange/main.c > CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.i

CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/model_exchange/main.c -o CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.s

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.o: CMakeFiles/fmusim_10_me.dir/flags.make
CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.o: ../fmu10/src/shared/sim_support.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.o   -c /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/sim_support.c

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/sim_support.c > CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.i

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/sim_support.c -o CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.s

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.o: CMakeFiles/fmusim_10_me.dir/flags.make
CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.o: ../fmu10/src/shared/xmlVersionParser.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.o   -c /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/xmlVersionParser.c

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/xmlVersionParser.c > CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.i

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/xmlVersionParser.c -o CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.s

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.o: CMakeFiles/fmusim_10_me.dir/flags.make
CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.o: ../fmu10/src/shared/parser/stack.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.o   -c /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/parser/stack.c

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/parser/stack.c > CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.i

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/parser/stack.c -o CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.s

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.o: CMakeFiles/fmusim_10_me.dir/flags.make
CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.o: ../fmu10/src/shared/parser/xml_parser.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.o   -c /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/parser/xml_parser.c

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/parser/xml_parser.c > CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.i

CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lucas/Desktop/11_Github/FMI/fmusdk/fmu10/src/shared/parser/xml_parser.c -o CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.s

# Object files for target fmusim_10_me
fmusim_10_me_OBJECTS = \
"CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.o" \
"CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.o" \
"CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.o" \
"CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.o" \
"CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.o"

# External object files for target fmusim_10_me
fmusim_10_me_EXTERNAL_OBJECTS =

../temp/fmu10/me/fmusim_10_me: CMakeFiles/fmusim_10_me.dir/fmu10/src/model_exchange/main.c.o
../temp/fmu10/me/fmusim_10_me: CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/sim_support.c.o
../temp/fmu10/me/fmusim_10_me: CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/xmlVersionParser.c.o
../temp/fmu10/me/fmusim_10_me: CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/stack.c.o
../temp/fmu10/me/fmusim_10_me: CMakeFiles/fmusim_10_me.dir/fmu10/src/shared/parser/xml_parser.c.o
../temp/fmu10/me/fmusim_10_me: CMakeFiles/fmusim_10_me.dir/build.make
../temp/fmu10/me/fmusim_10_me: CMakeFiles/fmusim_10_me.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable ../temp/fmu10/me/fmusim_10_me"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fmusim_10_me.dir/link.txt --verbose=$(VERBOSE)
	/usr/local/bin/cmake -E copy /home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/me/fmusim_10_me /home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/

# Rule to build all files generated by this target.
CMakeFiles/fmusim_10_me.dir/build: ../temp/fmu10/me/fmusim_10_me

.PHONY : CMakeFiles/fmusim_10_me.dir/build

CMakeFiles/fmusim_10_me.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/fmusim_10_me.dir/cmake_clean.cmake
.PHONY : CMakeFiles/fmusim_10_me.dir/clean

CMakeFiles/fmusim_10_me.dir/depend:
	cd /home/lucas/Desktop/11_Github/FMI/fmusdk/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lucas/Desktop/11_Github/FMI/fmusdk /home/lucas/Desktop/11_Github/FMI/fmusdk /home/lucas/Desktop/11_Github/FMI/fmusdk/debug /home/lucas/Desktop/11_Github/FMI/fmusdk/debug /home/lucas/Desktop/11_Github/FMI/fmusdk/debug/CMakeFiles/fmusim_10_me.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/fmusim_10_me.dir/depend
