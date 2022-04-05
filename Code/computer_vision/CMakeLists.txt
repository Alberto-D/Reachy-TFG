cmake_minimum_required(VERSION 3.8)
project(computer_vision)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(image_transport REQUIRED)
find_package(cv_bridge REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(std_msgs REQUIRED)
find_package(OpenCV REQUIRED)


add_executable(cv_node src/cv_node.cpp)
target_include_directories(cv_node PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>)
target_compile_features(cv_node PUBLIC c_std_99 cxx_std_17 cxx_std_14)  # Require C99 and C++17
ament_target_dependencies(
  cv_node
  "rclcpp"
  "image_transport"
  "cv_bridge"
  "sensor_msgs"
  "std_msgs"
  "OpenCV"
)


target_link_libraries(cv_node ${OpenCV_LIBS})

# Introduce preprocessor variables to keep paths of asset files
set(FACE_DETECTION_CONFIGURATION
"${PROJECT_SOURCE_DIR}/assets/deploy.prototxt")

set(FACE_DETECTION_WEIGHTS
"${PROJECT_SOURCE_DIR}/assets/res10_300x300_ssd_iter_140000_fp16.caffemodel")

target_compile_definitions(cv_node PRIVATE 
FACE_DETECTION_CONFIGURATION="${FACE_DETECTION_CONFIGURATION}")

target_compile_definitions(cv_node PRIVATE 
FACE_DETECTION_WEIGHTS="${FACE_DETECTION_WEIGHTS}")


install(TARGETS cv_node
  DESTINATION lib/${PROJECT_NAME})



if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # uncomment the line when a copyright and license is not present in all source files
  #set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # uncomment the line when this package is not in a git repo
  #set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()

