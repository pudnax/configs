cmake_minimum_required(VERSION 3.1.0)
project(new_project VERSION 0.1.0)

include(CTest)
enable_testing()

file(GLOB TARGET_SRC "./src/*.cpp" )

add_executable(main ${TARGET_SRC})

if(MSVC)
    add_compile_options("/W4" "$<$<CONFIG:RELEASE>:/O2>")
else()
    add_compile_options("-Wall" "-Wextra" "-Werror" "$<$<CONFIG:RELEASE>:-O3>")
endif()

set(CXX_STANDARD 20)
set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
