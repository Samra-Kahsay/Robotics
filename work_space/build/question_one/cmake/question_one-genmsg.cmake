# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "question_one: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iquestion_one:/home/sam/work_space/src/question_one/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(question_one_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/input.msg" NAME_WE)
add_custom_target(_question_one_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "question_one" "/home/sam/work_space/src/question_one/msg/input.msg" ""
)

get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/output.msg" NAME_WE)
add_custom_target(_question_one_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "question_one" "/home/sam/work_space/src/question_one/msg/output.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(question_one
  "/home/sam/work_space/src/question_one/msg/input.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/question_one
)
_generate_msg_cpp(question_one
  "/home/sam/work_space/src/question_one/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/question_one
)

### Generating Services

### Generating Module File
_generate_module_cpp(question_one
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/question_one
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(question_one_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(question_one_generate_messages question_one_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/input.msg" NAME_WE)
add_dependencies(question_one_generate_messages_cpp _question_one_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/output.msg" NAME_WE)
add_dependencies(question_one_generate_messages_cpp _question_one_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(question_one_gencpp)
add_dependencies(question_one_gencpp question_one_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS question_one_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(question_one
  "/home/sam/work_space/src/question_one/msg/input.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/question_one
)
_generate_msg_eus(question_one
  "/home/sam/work_space/src/question_one/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/question_one
)

### Generating Services

### Generating Module File
_generate_module_eus(question_one
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/question_one
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(question_one_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(question_one_generate_messages question_one_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/input.msg" NAME_WE)
add_dependencies(question_one_generate_messages_eus _question_one_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/output.msg" NAME_WE)
add_dependencies(question_one_generate_messages_eus _question_one_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(question_one_geneus)
add_dependencies(question_one_geneus question_one_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS question_one_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(question_one
  "/home/sam/work_space/src/question_one/msg/input.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/question_one
)
_generate_msg_lisp(question_one
  "/home/sam/work_space/src/question_one/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/question_one
)

### Generating Services

### Generating Module File
_generate_module_lisp(question_one
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/question_one
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(question_one_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(question_one_generate_messages question_one_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/input.msg" NAME_WE)
add_dependencies(question_one_generate_messages_lisp _question_one_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/output.msg" NAME_WE)
add_dependencies(question_one_generate_messages_lisp _question_one_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(question_one_genlisp)
add_dependencies(question_one_genlisp question_one_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS question_one_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(question_one
  "/home/sam/work_space/src/question_one/msg/input.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/question_one
)
_generate_msg_nodejs(question_one
  "/home/sam/work_space/src/question_one/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/question_one
)

### Generating Services

### Generating Module File
_generate_module_nodejs(question_one
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/question_one
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(question_one_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(question_one_generate_messages question_one_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/input.msg" NAME_WE)
add_dependencies(question_one_generate_messages_nodejs _question_one_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/output.msg" NAME_WE)
add_dependencies(question_one_generate_messages_nodejs _question_one_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(question_one_gennodejs)
add_dependencies(question_one_gennodejs question_one_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS question_one_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(question_one
  "/home/sam/work_space/src/question_one/msg/input.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/question_one
)
_generate_msg_py(question_one
  "/home/sam/work_space/src/question_one/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/question_one
)

### Generating Services

### Generating Module File
_generate_module_py(question_one
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/question_one
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(question_one_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(question_one_generate_messages question_one_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/input.msg" NAME_WE)
add_dependencies(question_one_generate_messages_py _question_one_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sam/work_space/src/question_one/msg/output.msg" NAME_WE)
add_dependencies(question_one_generate_messages_py _question_one_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(question_one_genpy)
add_dependencies(question_one_genpy question_one_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS question_one_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/question_one)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/question_one
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(question_one_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/question_one)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/question_one
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(question_one_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/question_one)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/question_one
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(question_one_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/question_one)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/question_one
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(question_one_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/question_one)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/question_one\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/question_one
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(question_one_generate_messages_py std_msgs_generate_messages_py)
endif()
