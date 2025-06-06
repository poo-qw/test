#!/bin/bash

echo "🚀 VPN Rewarder Installer"
echo "--------------------------"

# نصب وابستگی‌ها (درصورت نیاز)
command -v node >/dev/null 2>&1 || {
  echo "❌ Node.js نصب نیست. لطفاً اول Node.js و npm رو نصب کن."
  exit 1
}

# کلون یا دانلود پروژه در صورت نیاز
# git clone https://github.com/USERNAME/REPO.git vpnrewarder

# فرض: پروژه قبلاً دانلود شده و در همین مسیر هست
cd vpnrewarder || {
  echo "❌ پوشه پروژه پیدا نشد!"
  exit 1
}

# نصب و build فرانت‌اند
echo "🔧 نصب فرانت‌اند..."
cd frontend
npm install
npm run build
cd ..

# نصب بک‌اند
echo "🔧 نصب بک‌اند..."
cd backend
npm install
cd ..

# اجرا
echo ""
echo "✅ نصب کامل شد!"
echo "🌐 برای اجرا:"
echo "cd backend && npm start"
