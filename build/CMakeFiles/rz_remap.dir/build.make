# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gsd/Code/C/rz-map

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gsd/Code/C/rz-map/build

# Include any dependencies generated for this target.
include CMakeFiles/rz_remap.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/rz_remap.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/rz_remap.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/rz_remap.dir/flags.make

CMakeFiles/rz_remap.dir/rz-remap.cpp.o: CMakeFiles/rz_remap.dir/flags.make
CMakeFiles/rz_remap.dir/rz-remap.cpp.o: /home/gsd/Code/C/rz-map/rz-remap.cpp
CMakeFiles/rz_remap.dir/rz-remap.cpp.o: CMakeFiles/rz_remap.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gsd/Code/C/rz-map/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/rz_remap.dir/rz-remap.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/rz_remap.dir/rz-remap.cpp.o -MF CMakeFiles/rz_remap.dir/rz-remap.cpp.o.d -o CMakeFiles/rz_remap.dir/rz-remap.cpp.o -c /home/gsd/Code/C/rz-map/rz-remap.cpp

CMakeFiles/rz_remap.dir/rz-remap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rz_remap.dir/rz-remap.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gsd/Code/C/rz-map/rz-remap.cpp > CMakeFiles/rz_remap.dir/rz-remap.cpp.i

CMakeFiles/rz_remap.dir/rz-remap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rz_remap.dir/rz-remap.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gsd/Code/C/rz-map/rz-remap.cpp -o CMakeFiles/rz_remap.dir/rz-remap.cpp.s

# Object files for target rz_remap
rz_remap_OBJECTS = \
"CMakeFiles/rz_remap.dir/rz-remap.cpp.o"

# External object files for target rz_remap
rz_remap_EXTERNAL_OBJECTS =

rz_remap.so: CMakeFiles/rz_remap.dir/rz-remap.cpp.o
rz_remap.so: CMakeFiles/rz_remap.dir/build.make
rz_remap.so: /usr/lib/librz_core.so
rz_remap.so: /usr/lib/librz_core.so
rz_remap.so: /usr/lib/librz_magic.so
rz_remap.so: /usr/lib/librz_util.so
rz_remap.so: /usr/lib/librz_demangler.so
rz_remap.so: /usr/lib/librz_diff.so
rz_remap.so: /usr/lib/librz_reg.so
rz_remap.so: /usr/lib/librz_syscall.so
rz_remap.so: /usr/lib/librz_search.so
rz_remap.so: /usr/lib/librz_cons.so
rz_remap.so: /usr/lib/librz_analysis.so
rz_remap.so: /usr/lib/librz_crypto.so
rz_remap.so: /usr/lib/librz_flag.so
rz_remap.so: /usr/lib/librz_hash.so
rz_remap.so: /usr/lib/librz_parse.so
rz_remap.so: /usr/lib/librz_asm.so
rz_remap.so: /usr/lib/librz_config.so
rz_remap.so: /usr/lib/librz_bin.so
rz_remap.so: /usr/lib/librz_io.so
rz_remap.so: /usr/lib/librz_socket.so
rz_remap.so: /usr/lib/librz_type.so
rz_remap.so: /usr/lib/librz_il.so
rz_remap.so: /usr/lib/librz_lang.so
rz_remap.so: /usr/lib/librz_egg.so
rz_remap.so: /usr/lib/librz_debug.so
rz_remap.so: /usr/lib/librz_bp.so
rz_remap.so: /usr/lib/librz_sign.so
rz_remap.so: CMakeFiles/rz_remap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gsd/Code/C/rz-map/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library rz_remap.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rz_remap.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/rz_remap.dir/build: rz_remap.so
.PHONY : CMakeFiles/rz_remap.dir/build

CMakeFiles/rz_remap.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/rz_remap.dir/cmake_clean.cmake
.PHONY : CMakeFiles/rz_remap.dir/clean

CMakeFiles/rz_remap.dir/depend:
	cd /home/gsd/Code/C/rz-map/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gsd/Code/C/rz-map /home/gsd/Code/C/rz-map /home/gsd/Code/C/rz-map/build /home/gsd/Code/C/rz-map/build /home/gsd/Code/C/rz-map/build/CMakeFiles/rz_remap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/rz_remap.dir/depend
