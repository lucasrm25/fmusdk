cmake_minimum_required (VERSION 3.2)

FUNCTION(cat IN_FILE OUT_FILE)
  file(READ ${IN_FILE} CONTENTS)
  file(APPEND ${OUT_FILE} "${CONTENTS}")
ENDFUNCTION()


# set debug options
set(default_build_type "Debug")
# set(CMAKE_BUILD_TYPE "Debug")

# set optimization and debug flags
set (CMAKE_C_FLAGS_DEBUG "-O0 -ggdb3 -DDEBUG")
set (CMAKE_CXX_FLAGS_DEBUG "-O0 -ggdb3 -DDEBUG")

set (CMAKE_C_FLAGS_RELEASE "-O2 ${CMAKE_C_FLAGS_RELEASE}")
# set (CMAKE_C_FLAGS_RELEASE "-ggdb3 -O0 -DDEBUG")
# set (CMAKE_CXX_FLAGS_RELEASE "-ggdb3 -O0 -DDEBUG")

# SET(CMAKE_CXX_FLAGS "-ggdb3 -O0 -DDEBUG")
# SET(CMAKE_C_FLAGS "-ggdb3 -O0 -DDEBUG")




message(STATUS "CMAKE_C_FLAGS_DEBUG = ${CMAKE_C_FLAGS_DEBUG}")

# check OS and processor type
if (NOT UNIX AND NOT "${CMAKE_SIZEOF_VOID_P}" STREQUAL "8")
  MESSAGE("Only UNIX64 platform is supported for compilation")
  return()
endif()
set (FMI_PLATFORM linux64)



project (FMUSDK)


# -------------------------------------------------------------------------------------
# --------------------------------- FMU models ----------------------------------------
# -------------------------------------------------------------------------------------

MESSAGE("\n * ********* Setting up compilation for FMU models ************")

list(APPEND MODEL1 20 me springDamper)
# list(APPEND MODEL2 20 me dq)
# list(APPEND MODEL3 20 me test)
list(APPEND MODELS MODEL1)


foreach(MODEL ${MODELS})
  LIST(GET ${MODEL} 0 FMI_VERSION)
  LIST(GET ${MODEL} 1 FMI_TYPE)
  LIST(GET ${MODEL} 2 MODEL_NAME)

  MESSAGE(" * ")
  MESSAGE(" * Configuring FMU model: ${MODEL_NAME}, type: ${FMI_TYPE}, version: ${FMI_VERSION}")


  # set(CMAKE_SKIP_BUILD_RPATH TRUE)
  # set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
  # set(CMAKE_INSTALL_RPATH_USE_LINK_PATH FALSE)
  # set(CMAKE_INSTALL_RPATH "bla/lib")   # "$ORIGIN/../lib"
  

  # define target name
  set(TARGET_NAME ${MODEL_NAME}_${FMI_VERSION}_${FMI_TYPE})

  # Adds a library target called <name> to be built from the source files listed in the command invocation.
  # SHARED libraries are linked dynamically and loaded at runtime
  # create FMU model library from source .c and xml files
  add_library(
    ${TARGET_NAME} SHARED 
    fmu${FMI_VERSION}/src/models/${MODEL_NAME}/${MODEL_NAME}.c 
    fmu${FMI_VERSION}/src/models/${MODEL_NAME}/modelDescription_${FMI_TYPE}.xml
  )

  # Create the given directories and their parents as needed
  file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/dist/fmu${FMI_VERSION}/${FMI_TYPE})

  # Define DISABLE_PREFIX to build a binary FMU.
  target_compile_definitions(${TARGET_NAME} PRIVATE DISABLE_PREFIX)

  # Used only by FMI 1.0 
  # If FMI_COSIMULATION is defined, this implements "FMI for Co-Simulation 1.0",
  #  otherwise "FMI for Model Exchange 1.0".
  if (${FMI_TYPE} MATCHES "cs")
    target_compile_definitions(${TARGET_NAME} PRIVATE FMI_COSIMULATION)
  endif()

  # include libraries (FMU standard .h files and our FMU template)
  target_include_directories(${TARGET_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/models")
  target_include_directories(${TARGET_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/include")
  target_include_directories(${TARGET_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/extern/gsl/include")

  # GSL_LINK = -L/data/oums-quantopo/YOURUSERNAME/gsl/lib
  # LIBS = -lm -lgsl -lgslcblas
  target_link_libraries (${TARGET_NAME} PRIVATE "m")
  target_link_libraries (${TARGET_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/extern/gsl/lib/libgsl.so")
  target_link_libraries (${TARGET_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/extern/gsl/lib/libgslcblas.so")

  # target_link_libraries (${TARGET_NAME} PRIVATE "gsl")
  # target_link_libraries (${TARGET_NAME} PRIVATE "gslcblas")

  # set building directory to a temp folder
  set(FMU_BUILD_DIR ${CMAKE_CURRENT_SOURCE_DIR}/temp/fmu${FMI_VERSION}/${FMI_TYPE}/${MODEL_NAME})

  set_target_properties(${TARGET_NAME} PROPERTIES
      RUNTIME_OUTPUT_DIRECTORY         "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
      RUNTIME_OUTPUT_DIRECTORY_DEBUG   "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
      RUNTIME_OUTPUT_DIRECTORY_RELEASE "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
      LIBRARY_OUTPUT_DIRECTORY         "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
      LIBRARY_OUTPUT_DIRECTORY_DEBUG   "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
      LIBRARY_OUTPUT_DIRECTORY_RELEASE "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
      ARCHIVE_OUTPUT_DIRECTORY         "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
      ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
      ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
  )

  # set RPATH options
  set_target_properties(${TARGET_NAME} PROPERTIES
      BUILD_RPATH_USE_ORIGIN            TRUE
      BUILD_RPATH                      "$ORIGIN"
      SKIP_BUILD_RPATH                  FALSE           # TRUE skips RPATH from the build target
      BUILD_WITH_INSTALL_RPATH          FALSE
  )

  # define some macros to be used during compilation
  set_target_properties(${TARGET_NAME} PROPERTIES PREFIX "")
  set_target_properties(${TARGET_NAME} PROPERTIES OUTPUT_NAME ${MODEL_NAME})

  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib)

  # - Copy source files (.c, .h, .xml) to the temp built directory
  # - Zip source files with compiled model library (.so) to a .fmu file
  # - Copy .fmu file to dist directory
  add_custom_command(
    TARGET ${TARGET_NAME} 
    POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy
    ${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/models/${MODEL_NAME}/modelDescription_${FMI_TYPE}.xml
    "${FMU_BUILD_DIR}/modelDescription.xml"
  )
  add_custom_command(
    TARGET ${TARGET_NAME} POST_BUILD 
    COMMAND ${CMAKE_COMMAND} -E copy
    "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/models/${MODEL_NAME}/${MODEL_NAME}.c"
    "${FMU_BUILD_DIR}/sources/${MODEL_NAME}.c"
  )
  add_custom_command(
    TARGET ${TARGET_NAME} POST_BUILD 
    COMMAND ${CMAKE_COMMAND} -E copy
    "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/models/fmuTemplate.c"
    "${FMU_BUILD_DIR}/sources/fmuTemplate.c"
  )
  add_custom_command(
    TARGET ${TARGET_NAME} 
    POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy
    "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/models/fmuTemplate.h"
    "${FMU_BUILD_DIR}/sources/fmuTemplate.h"
  )

  # copy GSL headers into fmu "sources" folder 
  add_custom_command(
    TARGET ${TARGET_NAME} 
    POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy_directory
    "${CMAKE_CURRENT_SOURCE_DIR}/extern/gsl/include/gsl" "${FMU_BUILD_DIR}/sources/gsl"
  )

  # copy GSL library into fmu "binaries" folder 
  file(GLOB MY_LIB "${CMAKE_CURRENT_SOURCE_DIR}/extern/gsl/lib/*")
  foreach(CurrentLibFile IN LISTS MY_LIB)
    add_custom_command(
      TARGET ${TARGET_NAME} 
      POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy_if_different
      ${CurrentLibFile} "${FMU_BUILD_DIR}/binaries/${FMI_PLATFORM}"
      # COMMENT "Copying library: ${CurrentLibFile}"
    )
  endforeach()

  # zip as .fmu
  add_custom_command(
    TARGET ${TARGET_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E tar "cfv" "${CMAKE_CURRENT_SOURCE_DIR}/dist/fmu${FMI_VERSION}/${FMI_TYPE}/${MODEL_NAME}.fmu" --format=zip
    "modelDescription.xml"
    "binaries"
    "sources"
    WORKING_DIRECTORY ${FMU_BUILD_DIR}
  )

  MESSAGE(" * FMU model path: ${CMAKE_CURRENT_SOURCE_DIR}/dist/fmu${FMI_VERSION}/${FMI_TYPE}/${MODEL_NAME}.fmu")

endforeach(MODEL)


# -------------------------------------------------------------------------------------
# --------------------------------- FMU models ----------------------------------------
# -------------------------------------------------------------------------------------



# -------------------------------------------------------------------------------------
# ----------------------------- FMU simulators ----------------------------------------
# -------------------------------------------------------------------------------------
MESSAGE("\n\n * ********* Setting up compilation for FMU simulators ************")

foreach (FMI_VERSION 10 20)
foreach (FMI_TYPE cs me)
  set(TARGET_NAME fmusim_${FMI_VERSION}_${FMI_TYPE})

  MESSAGE(" * ")
  MESSAGE(" * Configuring FMU simulator: ${TARGET_NAME}")

  if (${FMI_TYPE} STREQUAL "cs")
    set(SIM_TYPE co_simulation)
  else ()
    set(SIM_TYPE model_exchange)
  endif ()

  set(SRCS
    "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/sim_support.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/xmlVersionParser.c")

  if (${FMI_VERSION} EQUAL 10)
    set(SRCS ${SRCS}
      "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/parser/stack.c"
      "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/parser/xml_parser.c")
  else ()
    set(SRCS ${SRCS}
      "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/parser/XmlElement.cpp"
      "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/parser/XmlParser.cpp"
      "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/parser/XmlParserCApi.cpp")
  endif ()

  add_executable(
    ${TARGET_NAME} "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/${SIM_TYPE}/main.c" 
    ${SRCS}
  )

  file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/dist/fmu${FMI_VERSION}/${FMI_TYPE})

  target_include_directories(${TARGET_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/${SIM_TYPE}")
  target_include_directories(${TARGET_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared")
  target_include_directories(${TARGET_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/include")
  target_include_directories(${TARGET_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/fmu${FMI_VERSION}/src/shared/parser")

  # define code directives
  if (${FMI_TYPE} STREQUAL "cs")
    target_compile_definitions(${TARGET_NAME} PRIVATE FMI_COSIMULATION)
  endif ()
  target_compile_definitions(${TARGET_NAME} PRIVATE STANDALONE_XML_PARSER)
  target_compile_definitions(${TARGET_NAME} PRIVATE LIBXML_STATIC)

  set(TARGET_OUTPUT_NAME "${TARGET_NAME}")

  target_link_libraries (${TARGET_NAME} PRIVATE "dl")
  target_link_libraries (${TARGET_NAME} PRIVATE "xml2")
  target_link_libraries (${TARGET_NAME} PRIVATE "expat")

  set(FMU_BUILD_DIR ${CMAKE_CURRENT_SOURCE_DIR}/temp/fmu${FMI_VERSION}/${FMI_TYPE})

  set_target_properties(${TARGET_NAME} PROPERTIES
      RUNTIME_OUTPUT_DIRECTORY         "${FMU_BUILD_DIR}"
      RUNTIME_OUTPUT_DIRECTORY_DEBUG   "${FMU_BUILD_DIR}"
      RUNTIME_OUTPUT_DIRECTORY_RELEASE "${FMU_BUILD_DIR}"
      LIBRARY_OUTPUT_DIRECTORY         "${FMU_BUILD_DIR}"
      LIBRARY_OUTPUT_DIRECTORY_DEBUG   "${FMU_BUILD_DIR}"
      LIBRARY_OUTPUT_DIRECTORY_RELEASE "${FMU_BUILD_DIR}"
      ARCHIVE_OUTPUT_DIRECTORY         "${FMU_BUILD_DIR}"
      ARCHIVE_OUTPUT_DIRECTORY_DEBUG   "${FMU_BUILD_DIR}"
      ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${FMU_BUILD_DIR}"
  )

  add_custom_command(TARGET ${TARGET_NAME} POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy
    "${FMU_BUILD_DIR}/${TARGET_OUTPUT_NAME}"
    "${CMAKE_CURRENT_SOURCE_DIR}/dist/fmu${FMI_VERSION}/${FMI_TYPE}/"
  )
  MESSAGE(" * FMU simulator path: ${CMAKE_CURRENT_SOURCE_DIR}/dist/fmu${FMI_VERSION}/${FMI_TYPE}/${TARGET_OUTPUT_NAME}")


endforeach(FMI_TYPE)
endforeach(FMI_VERSION)
# -------------------------------------------------------------------------------------
# ----------------------------- FMU simulators ----------------------------------------
# -------------------------------------------------------------------------------------

MESSAGE("")

# -------------------------------------------------------------------------------------
# --------------------- test simulators and models ------------------------------------
# -------------------------------------------------------------------------------------
enable_testing()

foreach(MODEL ${MODELS})
  LIST(GET ${MODEL} 0 FMI_VERSION)
  LIST(GET ${MODEL} 1 FMI_TYPE)
  LIST(GET ${MODEL} 2 MODEL_NAME)

  set(FMU_BUILD_DIR ${CMAKE_CURRENT_SOURCE_DIR}/temp/fmu${FMI_VERSION}/${FMI_TYPE})
  set(TEST_NAME test_${MODEL_NAME}_${FMI_VERSION}_${FMI_TYPE})

  add_test(NAME ${TEST_NAME}
    COMMAND "${CMAKE_CURRENT_SOURCE_DIR}/dist/fmu${FMI_VERSION}/${FMI_TYPE}/fmusim_${FMI_VERSION}_${FMI_TYPE}"
        "${CMAKE_CURRENT_SOURCE_DIR}/dist/fmu${FMI_VERSION}/${FMI_TYPE}/${MODEL_NAME}.fmu"
    WORKING_DIRECTORY "${FMU_BUILD_DIR}/${MODEL_NAME}"
  )
  set_tests_properties(${TEST_NAME} PROPERTIES ENVIRONMENT FMUSDK_HOME=${CMAKE_CURRENT_SOURCE_DIR})
 
endforeach(MODEL)



# -------------------------------------------------------------------------------------
# --------------------- test simulators and models ------------------------------------
# -------------------------------------------------------------------------------------