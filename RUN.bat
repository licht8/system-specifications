@echo off
setlocal
chcp 65001 > nul

if not exist "build" (
    set /p build_type="Do you want to build the program in Debug or Release version? (D/R): "
	if "%build_type%"=="" set "build_type=D"
	)

if not exist "build" (
    mkdir build
    cd build

    if /I "%build_type%"=="D" (
		cls
        echo Selected Debug build
        cmake -DCMAKE_BUILD_TYPE=Debug ..
        cmake --build . --config Debug

		if not errorlevel 1 (
            echo.
			echo The program successfully built!
            color
        )
    ) else if /I "%build_type%"=="R" (
		cls
        echo Selected Release build
        cmake -DCMAKE_BUILD_TYPE=Release ..
        cmake --build . --config Release

		if not errorlevel 1 (
            echo.
			echo The program successfully built!
            color
        )
    ) else (
        echo Invalid choice. Please choose D or R.
        exit /b 1
    )
) else (
    cd build
)

if exist "Release" (
    cd Release
    if exist SystemSpecifications.exe (
        start SystemSpecifications.exe
    ) else (
        echo .exe file not found in Release directory.
    )
) else if exist "Debug" (
    cd Debug
    if exist SystemSpecifications.exe (
        start SystemSpecifications.exe
    ) else (
        echo .exe file not found in Debug directory.
    )
) else (
    echo Neither Release nor Debug directory found.
)

endlocal
