@echo off
set path=%cd%
copy %path%\devices\*.* %path%\lib\pymcuprog\deviceinfo\devices
rmdir /s /q devices
del runme.bat