# the name of the target operating system
set(CMAKE_SYSTEM_NAME Windows)

# which compiler to use
set(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
set(CMAKE_C_FLAGS_RELEASE_INIT "-Wl,-subsystem,windows")

# where is the target environment located
set(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)

# adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# search headers and libraries in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Fix 'IMPORTED_IMPLIB not set for imported target SDL2::SDL2' error
if(TARGET SDL2::SDL2)
    get_target_property(SDL2_LOCATION SDL2::SDL2 IMPORTED_LOCATION)
    set_target_properties(SDL2::SDL2 PROPERTIES IMPORTED_IMPLIB "/usr/x86_64-w64-mingw32/lib/libSDL2.dll.a")
endif()
