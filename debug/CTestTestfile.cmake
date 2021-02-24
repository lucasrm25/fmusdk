# CMake generated Testfile for 
# Source directory: /home/lucas/Desktop/11_Github/FMI/fmusdk
# Build directory: /home/lucas/Desktop/11_Github/FMI/fmusdk/debug
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_springDamper_20_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/fmusim_20_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/springDamper.fmu")
set_tests_properties(test_springDamper_20_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/me/springDamper" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;289;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
