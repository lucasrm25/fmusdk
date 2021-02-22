# CMake generated Testfile for 
# Source directory: /home/lucas/Desktop/11_Github/FMI/fmusdk
# Build directory: /home/lucas/Desktop/11_Github/FMI/fmusdk/debug
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_bouncingBall_10_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/fmusim_10_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/bouncingBall.fmu")
set_tests_properties(test_bouncingBall_10_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/cs/bouncingBall" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_dq_10_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/fmusim_10_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/dq.fmu")
set_tests_properties(test_dq_10_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/cs/dq" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_inc_10_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/fmusim_10_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/inc.fmu")
set_tests_properties(test_inc_10_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/cs/inc" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_values_10_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/fmusim_10_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/values.fmu")
set_tests_properties(test_values_10_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/cs/values" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_vanDerPol_10_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/fmusim_10_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/cs/vanDerPol.fmu")
set_tests_properties(test_vanDerPol_10_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/cs/vanDerPol" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_bouncingBall_10_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/fmusim_10_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/bouncingBall.fmu")
set_tests_properties(test_bouncingBall_10_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/me/bouncingBall" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_dq_10_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/fmusim_10_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/dq.fmu")
set_tests_properties(test_dq_10_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/me/dq" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_inc_10_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/fmusim_10_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/inc.fmu")
set_tests_properties(test_inc_10_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/me/inc" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_values_10_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/fmusim_10_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/values.fmu")
set_tests_properties(test_values_10_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/me/values" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_vanDerPol_10_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/fmusim_10_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu10/me/vanDerPol.fmu")
set_tests_properties(test_vanDerPol_10_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu10/me/vanDerPol" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_bouncingBall_20_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/fmusim_20_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/bouncingBall.fmu")
set_tests_properties(test_bouncingBall_20_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/bouncingBall" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_dq_20_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/fmusim_20_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/dq.fmu")
set_tests_properties(test_dq_20_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/dq" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_inc_20_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/fmusim_20_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/inc.fmu")
set_tests_properties(test_inc_20_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/inc" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_values_20_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/fmusim_20_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/values.fmu")
set_tests_properties(test_values_20_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/values" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_vanDerPol_20_cs "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/fmusim_20_cs" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/cs/vanDerPol.fmu")
set_tests_properties(test_vanDerPol_20_cs PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/cs/vanDerPol" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_bouncingBall_20_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/fmusim_20_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/bouncingBall.fmu")
set_tests_properties(test_bouncingBall_20_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/me/bouncingBall" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_dq_20_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/fmusim_20_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/dq.fmu")
set_tests_properties(test_dq_20_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/me/dq" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_inc_20_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/fmusim_20_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/inc.fmu")
set_tests_properties(test_inc_20_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/me/inc" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_values_20_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/fmusim_20_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/values.fmu")
set_tests_properties(test_values_20_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/me/values" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
add_test(test_vanDerPol_20_me "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/fmusim_20_me" "/home/lucas/Desktop/11_Github/FMI/fmusdk/dist/fmu20/me/vanDerPol.fmu")
set_tests_properties(test_vanDerPol_20_me PROPERTIES  ENVIRONMENT "FMUSDK_HOME=/home/lucas/Desktop/11_Github/FMI/fmusdk" WORKING_DIRECTORY "/home/lucas/Desktop/11_Github/FMI/fmusdk/temp/fmu20/me/vanDerPol" _BACKTRACE_TRIPLES "/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;216;add_test;/home/lucas/Desktop/11_Github/FMI/fmusdk/CMakeLists.txt;0;")
