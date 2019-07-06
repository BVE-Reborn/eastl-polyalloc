function(target_add_warnings target)
    if (OS_WINDOWS)
        if (NOT NOVA_PACKAGE)
            target_compile_options(${target} PRIVATE /WX)
            if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
                string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
            else()
                target_compile_options_if_supported(${target} PRIVATE /W4)
            endif()

            target_compile_options_if_supported(${target} PRIVATE
                /w44061
                /w44062
                /w44263
                /w44264
                /w44266
                /w44296
                /w44545
                /w44546
                /w44547
                /w44548
                /w44549
                /w44574
                /w44668
                /wd4251
            )
            target_compile_options_if_supported(${target} PRIVATE /experimental:external /external:anglebrackets /external:W3)
        endif()
        target_compile_options_if_supported(${target} PRIVATE
            /wd4068 # unknown pragmas
        )
        target_compile_options_if_supported(${target} PRIVATE /permissive-)
    else()
        target_compile_options_if_supported(${target} PRIVATE -fdiagnostics-color=always)
        if (NOT NOVA_PACKAGE)
            target_compile_options(${target} PRIVATE -Werror)
            target_compile_options_if_supported(${target} PRIVATE
                -Wall
                -Wextra
                -Wpedantic

                -Wcast-align
                -Wcast-qual
                -Wctor-dtor-privacy
                -Wdisabled-optimization
                -Wdouble-promotion
                -Wduplicated-branches
                -Wduplicated-cond
                -Wformat=2
                -Winit-self
                -Wlogical-op
                -Wmissing-include-dirs
                -Wnull-dereference
                -Wold-style-cast
                -Woverloaded-virtual
                -Wrestrict
                -Wshadow
                -Wstrict-aliasing=1
                -Wstrict-null-sentinel
                -Wstrict-overflow=2
                -Wswitch-default
                -Wundef
                -Wuseless-cast
            )
        endif()
        target_compile_options_if_supported(${target} PRIVATE
            -Wno-gnu-zero-variadic-macro-arguments
            -Wno-unknown-pragmas
        )
    endif()
endfunction()
