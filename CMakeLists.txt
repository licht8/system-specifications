cmake_minimum_required(VERSION 3.10)

project(SystemSpecifications)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

include_directories(${PROJECT_SOURCE_DIR}/headers)

set(HEADER_FILES
    headers/DiskInfo.h
    headers/FileReader.h
    headers/GraphicsCardInfo.h
    headers/MemoryInfo.h
    headers/MotherboardInfo.h
    headers/ProcessorInfo.h
    headers/SetConsoleColor.h
)

set(SOURCE_FILES
    SystemSpecs.cpp
)

add_executable(SystemSpecifications ${SOURCE_FILES} ${HEADER_FILES})

add_custom_command(TARGET SystemSpecifications POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${CMAKE_SOURCE_DIR}/logo.txt $<TARGET_FILE_DIR:SystemSpecifications>/logo.txt)

# target_link_libraries(... ...)
