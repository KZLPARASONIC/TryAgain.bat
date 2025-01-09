@echo off
:: Basit Dosya Yedekleme Aracı

:: Ana menüyü göster
cls
echo --------------------------------------
echo Basit Dosya Yedekleme Araci
echo --------------------------------------
echo 1. Yedekleme Islemine Basla
echo 2. Cikis
echo --------------------------------------
set /p choice="Seciminizi yapin (1/2): "

if "%choice%"=="1" goto backup_files
if "%choice%"=="2" exit
goto main

:: Dosya Yedekleme Islemi
:backup_files
cls
echo Yedeklemek Istediğiniz Dosya/Dizin Yolunu Girin:
set /p source_dir="Kaynak Dizin: "
if not exist "%source_dir%" (
    echo Kaynak dizini bulunamadi!
    pause
    goto main
)

echo Yedekleme Klasorunu Girin:
set /p backup_dir="Yedekleme Klasoru: "
if not exist "%backup_dir%" (
    echo Yedekleme klasoru bulunamadi, yeni klasor olusturuluyor...
    mkdir "%backup_dir%"
)

echo Yedekleme islemi basliyor...
xcopy "%source_dir%" "%backup_dir%" /E /H /C /I
echo Yedekleme tamamlandi!

pause
goto main
