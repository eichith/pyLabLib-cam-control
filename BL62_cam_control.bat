@echo off
setlocal

rem ===== Application folder =====
if defined CAM_CTRL_PATH (
    if exist "%CAM_CTRL_PATH%\" (
        set "APP_DIR=%CAM_CTRL_PATH%"
        goto :find_python
    )
)

if exist "C:\SW\pyLabLib-cam-control\" (
    set "APP_DIR=C:\SW\pyLabLib-cam-control"
    goto :find_python
)

if exist "C:\Software\pyLabLib-cam-control\" (
    set "APP_DIR=C:\SW\pyLabLib-cam-control"
    goto :find_python
)

echo ERROR: pyLabLib-cam-control folder not found.
pause
exit /b 1

rem ===== Python environment =====
:find_python
if defined CAM_CTRL_VENV_PATH (
    if exist "%CAM_CTRL_VENV_PATH%\python.exe" (
        set "PYTHON_EXE=%CAM_CTRL_VENV_PATH%\python.exe"
        goto :run
    )
)

if exist "C:\ProgramData\anaconda3\envs\bl62_pypco_ctrl_env\python.exe" (
    set "PYTHON_EXE=C:\ProgramData\anaconda3\envs\bl62_pypco_ctrl_env\python.exe"
    goto :run
)

if exist "C:\ProgramData\miniconda3\envs\bl62_pypco_ctrl_env\python.exe" (
    set "PYTHON_EXE=C:\ProgramData\anaconda3\envs\bl62_pypco_ctrl_env\python.exe"
    goto :run
)

if exist "%USERPROFILE%\AppData\Local\anaconda3\envs\bl62_pypco_ctrl_env\python.exe" (
    set "PYTHON_EXE=%USERPROFILE%\anaconda3\envs\bl62_pypco_ctrl_env\python.exe"
    goto :run
)

if exist "%USERPROFILE%\AppData\Local\miniconda3\envs\bl62_pypco_ctrl_env\python.exe" (
    set "PYTHON_EXE=%USERPROFILE%\miniconda3\envs\bl62_pypco_ctrl_env\python.exe"
    goto :run
)

echo ERROR: python.exe for bl62_pypco_ctrl_env not found.
pause
exit /b 1

rem ===== Run =====
:run
echo Opening "%APP_DIR%" (VENV: "%PYTHON_EXE%")
cd /d "%APP_DIR%"
"%PYTHON_EXE%" control.py
pause