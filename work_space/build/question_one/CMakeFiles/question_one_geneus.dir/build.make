# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sam/work_space/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sam/work_space/build

# Utility rule file for question_one_geneus.

# Include the progress variables for this target.
include question_one/CMakeFiles/question_one_geneus.dir/progress.make

question_one_geneus: question_one/CMakeFiles/question_one_geneus.dir/build.make

.PHONY : question_one_geneus

# Rule to build all files generated by this target.
question_one/CMakeFiles/question_one_geneus.dir/build: question_one_geneus

.PHONY : question_one/CMakeFiles/question_one_geneus.dir/build

question_one/CMakeFiles/question_one_geneus.dir/clean:
	cd /home/sam/work_space/build/question_one && $(CMAKE_COMMAND) -P CMakeFiles/question_one_geneus.dir/cmake_clean.cmake
.PHONY : question_one/CMakeFiles/question_one_geneus.dir/clean

question_one/CMakeFiles/question_one_geneus.dir/depend:
	cd /home/sam/work_space/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sam/work_space/src /home/sam/work_space/src/question_one /home/sam/work_space/build /home/sam/work_space/build/question_one /home/sam/work_space/build/question_one/CMakeFiles/question_one_geneus.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : question_one/CMakeFiles/question_one_geneus.dir/depend

