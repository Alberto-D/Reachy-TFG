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
CMAKE_SOURCE_DIR = /home/alberto/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/alberto/catkin_ws/build

# Include any dependencies generated for this target.
include usb_cam/CMakeFiles/camera_publisher.dir/depend.make

# Include the progress variables for this target.
include usb_cam/CMakeFiles/camera_publisher.dir/progress.make

# Include the compile flags for this target's objects.
include usb_cam/CMakeFiles/camera_publisher.dir/flags.make

usb_cam/CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.o: usb_cam/CMakeFiles/camera_publisher.dir/flags.make
usb_cam/CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.o: /home/alberto/catkin_ws/src/usb_cam/src/camera_publisher.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/alberto/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object usb_cam/CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.o"
	cd /home/alberto/catkin_ws/build/usb_cam && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.o -c /home/alberto/catkin_ws/src/usb_cam/src/camera_publisher.cpp

usb_cam/CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.i"
	cd /home/alberto/catkin_ws/build/usb_cam && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/alberto/catkin_ws/src/usb_cam/src/camera_publisher.cpp > CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.i

usb_cam/CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.s"
	cd /home/alberto/catkin_ws/build/usb_cam && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/alberto/catkin_ws/src/usb_cam/src/camera_publisher.cpp -o CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.s

# Object files for target camera_publisher
camera_publisher_OBJECTS = \
"CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.o"

# External object files for target camera_publisher
camera_publisher_EXTERNAL_OBJECTS =

/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: usb_cam/CMakeFiles/camera_publisher.dir/src/camera_publisher.cpp.o
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: usb_cam/CMakeFiles/camera_publisher.dir/build.make
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /home/alberto/catkin_ws/devel/lib/libusb_cam.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libcv_bridge.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_dnn.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_video.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_aruco.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_bgsegm.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_bioinspired.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_ccalib.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_datasets.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_dnn_objdetect.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_dnn_superres.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_dpm.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_face.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_freetype.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_fuzzy.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_hdf.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_hfs.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_img_hash.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_line_descriptor.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_optflow.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_phase_unwrapping.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_plot.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_quality.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_reg.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_rgbd.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_saliency.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_shape.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_stereo.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_structured_light.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_surface_matching.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_text.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_tracking.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_viz.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_ximgproc.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_xobjdetect.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_xphoto.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_core.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so.4.2.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libimage_transport.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libmessage_filters.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libclass_loader.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libPocoFoundation.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libdl.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libroslib.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/librospack.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libpython3.8.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libcamera_info_manager.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libcamera_calibration_parsers.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libactionlib.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libroscpp.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/librosconsole.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/librostime.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /opt/ros/noetic/lib/libcpp_common.so
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher: usb_cam/CMakeFiles/camera_publisher.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/alberto/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher"
	cd /home/alberto/catkin_ws/build/usb_cam && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/camera_publisher.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
usb_cam/CMakeFiles/camera_publisher.dir/build: /home/alberto/catkin_ws/devel/lib/usb_cam/camera_publisher

.PHONY : usb_cam/CMakeFiles/camera_publisher.dir/build

usb_cam/CMakeFiles/camera_publisher.dir/clean:
	cd /home/alberto/catkin_ws/build/usb_cam && $(CMAKE_COMMAND) -P CMakeFiles/camera_publisher.dir/cmake_clean.cmake
.PHONY : usb_cam/CMakeFiles/camera_publisher.dir/clean

usb_cam/CMakeFiles/camera_publisher.dir/depend:
	cd /home/alberto/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/alberto/catkin_ws/src /home/alberto/catkin_ws/src/usb_cam /home/alberto/catkin_ws/build /home/alberto/catkin_ws/build/usb_cam /home/alberto/catkin_ws/build/usb_cam/CMakeFiles/camera_publisher.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : usb_cam/CMakeFiles/camera_publisher.dir/depend

