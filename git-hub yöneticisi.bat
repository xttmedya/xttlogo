@echo off
chcp 65001 >nul
cls

:: Tarih ve saat damgası oluştur
set ldt=%DATE:~12,2%%DATE:~7,2%%DATE:~4,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set "ldt=%ldt: =0%" :: Boşlukları sıfır ile değiştir
REM echo Yedekleme işlemi için tarih damgası: %ldt%

:: Başlangıç mesajı
echo *************************************
echo    Git Islem Menusu
echo *************************************

:: Kullanıcı bilgilerini al
REM set /p user_name="Kullanıcı adınızı girin (GitHub): "
REM set /p user_email="E-posta adresinizi girin (GitHub): "

set "user_name=xttmedya"
set "user_email=xttmedya@gmail.com"

:: GitHub kullanıcı bilgilerini ayarlama
git config --global user.name "%user_name%"
git config --global user.email "%user_email%"

:: Ana Menü
:MENU
cls
echo *************************************
echo    Git Islem Menusu
echo *************************************
echo 1. Dosya Ekleme (git add)
echo 2. Dosya Silme (git rm)
echo 3. Commit Yapma (git commit)
echo 4. GitHub'a Gönderme (git push)
echo 5. GitHub'dan Dizin Çekme (git pull)
echo 6. Durum Görüntüleme (git status)
echo 7. Eklenen dosya onayi
echo 8. Sil dosya onayi
echo 9. Giris yap
echo q. Cikis
echo *************************************
set /p option="Bir seçenek girin (1-9-q): "

if "%option%"=="1" goto ADD
if "%option%"=="2" goto REMOVE
if "%option%"=="3" goto COMMIT
if "%option%"=="4" goto PUSH
if "%option%"=="5" goto PULL
if "%option%"=="6" goto STATUS
if "%option%"=="7" goto eklenendosyaonayi
if "%option%"=="8" goto Sildosyaonayi
if "%option%"=="9" goto girisyap

if "%option%"=="q" exit

:: Dosya Ekleme (git add)
:ADD
cls
echo Dosya ekleniyor...
echo *************************************
echo 1. Tüm Dosyaları Ekle (git add .)
echo 2. Belirli Bir Dosya Ekle (git add dosyaadi)
echo 3. Ana Menuye Don
set /p add_option="Bir seçenek girin (1-3): "

if "%add_option%"=="1" (
    git add .
    echo Tüm dosyalar eklendi.
)
if "%add_option%"=="2" (
    set /p file_name="Eklenecek dosya adını girin: "
    git add %file_name%
    echo %file_name% dosyası eklendi.
)
if "%add_option%"=="3" goto MENU

pause
goto MENU

:: Dosya Silme (git rm)
:REMOVE
cls
echo Dosya siliniyor...
echo *************************************
echo 1. Tek Dosya Sil (git rm dosyaadi)
echo 2. Dizin Sil (git rm -r dizinadi)
echo 3. Ana Menuye Don
set /p remove_option="Bir seçenek girin (1-3): "

if "%remove_option%"=="1" (
    set /p file_name="Silinecek dosya adını girin: "
    git rm %file_name%
    echo %file_name% dosyası silindi.
)
if "%remove_option%"=="2" (
    set /p dir_name="Silinecek dizin adını girin: "
    git rm -r %dir_name%
    echo %dir_name% dizini silindi.
)
if "%remove_option%"=="3" goto MENU

pause
goto MENU

:: Commit Yapma (git commit)
:COMMIT
cls
echo Commit yapılıyor...
REM set /p commit_msg="Commit mesajınızı girin: "
set "commit_msg=%ldt%"
git commit -m "%commit_msg%"
echo Commit yapıldı.

pause
goto MENU

:: GitHub'a Gönderme (git push)
:PUSH
cls
echo GitHub'a gönderiliyor...
git push origin main
echo Değişiklikler GitHub'a gönderildi.

pause
goto MENU

:: GitHub'dan Dizin Çekme (git pull)
:PULL
cls
echo GitHub'dan dizin çekiliyor...
git pull origin main
echo Dizin başarıyla çekildi.

pause
goto MENU

:: Durum Görüntüleme (git status)
:STATUS
cls
echo Git deposu durumu görüntüleniyor...
git status

pause
goto MENU


:Sildosyaonayi
cls
git add -A
git commit -m "Silinen dosyalar guncellendi"
git push origin main

pause
goto MENU

:eklenendosyaonayi
cls
git add .
git commit -m "Yeni degisiklikler eklendi"
git push origin main

pause
goto MENU


:girisyap
cls
git config --global user.name "xttmedya"
git config --global user.email "xttmedya@gmail.com"

pause
goto MENU
