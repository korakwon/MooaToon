setlocal enabledelayedexpansion

set repoURL=https://github.com/JasonMa0012/MooaToon.git
set branchName=main


git init

:loop
git fetch --depth=1 %repoURL% %branchName%
if not %errorlevel% == 0 (
   echo Fetch failed, retrying in 5 seconds...
   timeout /t 10 /nobreak
   goto loop
)

git checkout FETCH_HEAD
git remote add origin %repoURL%
git pull origin %branchName%
git checkout %branchName%
git reset --hard origin/%branchName%

echo successfully update.
timeout /t 10