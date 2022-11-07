# Install script for directory: /home/alberto/catkin_ws/src/dialog/dialogflow_ros/dialogflow_ros_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/alberto/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dialogflow_ros_msgs/srv" TYPE FILE FILES "/home/alberto/catkin_ws/src/dialog/dialogflow_ros/dialogflow_ros_msgs/srv/DialogflowService.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dialogflow_ros_msgs/msg" TYPE FILE FILES
    "/home/alberto/catkin_ws/src/dialog/dialogflow_ros/dialogflow_ros_msgs/msg/DialogflowResult.msg"
    "/home/alberto/catkin_ws/src/dialog/dialogflow_ros/dialogflow_ros_msgs/msg/DialogflowContext.msg"
    "/home/alberto/catkin_ws/src/dialog/dialogflow_ros/dialogflow_ros_msgs/msg/DialogflowParameter.msg"
    "/home/alberto/catkin_ws/src/dialog/dialogflow_ros/dialogflow_ros_msgs/msg/DialogflowRequest.msg"
    "/home/alberto/catkin_ws/src/dialog/dialogflow_ros/dialogflow_ros_msgs/msg/DialogflowEvent.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dialogflow_ros_msgs/cmake" TYPE FILE FILES "/home/alberto/catkin_ws/build/dialog/dialogflow_ros/dialogflow_ros_msgs/catkin_generated/installspace/dialogflow_ros_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/alberto/catkin_ws/devel/include/dialogflow_ros_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/alberto/catkin_ws/devel/share/roseus/ros/dialogflow_ros_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/alberto/catkin_ws/devel/share/common-lisp/ros/dialogflow_ros_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/alberto/catkin_ws/devel/share/gennodejs/ros/dialogflow_ros_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/alberto/catkin_ws/devel/lib/python3/dist-packages/dialogflow_ros_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/alberto/catkin_ws/devel/lib/python3/dist-packages/dialogflow_ros_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/alberto/catkin_ws/build/dialog/dialogflow_ros/dialogflow_ros_msgs/catkin_generated/installspace/dialogflow_ros_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dialogflow_ros_msgs/cmake" TYPE FILE FILES "/home/alberto/catkin_ws/build/dialog/dialogflow_ros/dialogflow_ros_msgs/catkin_generated/installspace/dialogflow_ros_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dialogflow_ros_msgs/cmake" TYPE FILE FILES
    "/home/alberto/catkin_ws/build/dialog/dialogflow_ros/dialogflow_ros_msgs/catkin_generated/installspace/dialogflow_ros_msgsConfig.cmake"
    "/home/alberto/catkin_ws/build/dialog/dialogflow_ros/dialogflow_ros_msgs/catkin_generated/installspace/dialogflow_ros_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dialogflow_ros_msgs" TYPE FILE FILES "/home/alberto/catkin_ws/src/dialog/dialogflow_ros/dialogflow_ros_msgs/package.xml")
endif()

