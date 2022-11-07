execute_process(COMMAND "/home/alberto/catkin_ws/build/audio_commonhgertj/sound_play/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/alberto/catkin_ws/build/audio_commonhgertj/sound_play/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
