@echo off
chcp 65001 >nul
echo ================================================
echo   同步价格数据到 GitHub Pages
echo ================================================
echo.

cd /d "%~dp0"

echo [1/2] 提交数据更新...
git add data/
git commit -m "更新价格数据 %date% %time%" --quiet 2>nul
if %errorlevel% neq 0 (
    echo       没有新数据需要更新
) else (
    echo       已提交
)

echo [2/2] 推送到 GitHub...
git push --quiet 2>nul
if %errorlevel% neq 0 (
    echo       推送失败，请检查网络连接或 Git 凭证
) else (
    echo       推送成功！GitHub Pages 将在几分钟后更新。
)

echo.
pause
