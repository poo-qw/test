#!/bin/bash

echo "🚀 VPN Rewarder Installer"
echo "--------------------------"

# Check for Node.js
if ! command -v node &> /dev/null; then
  echo "🔧 Node.js یافت نشد. در حال نصب Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

# Check for npm
if ! command -v npm &> /dev/null; then
  echo "🔧 npm یافت نشد. در حال نصب npm..."
  sudo apt install -y npm
fi

# Clone repo
echo "📥 در حال دریافت پروژه از گیت‌هاب..."
git clone https://github.com/poo-qw/test.git vpnrewarder
cd vpnrewarder/frontend || exit 1

# Install deps
echo "📦 نصب پکیج‌ها..."
npm install

# Build
echo "🏗️ در حال ساخت پروژه..."
npm run build

# Serve (optional, if you want auto-run)
echo "🚀 اجرای برنامه..."
npm install -g serve
serve -s dist --port 3000

echo "✅ نصب کامل شد. پنل روی http://localhost:3000 در دسترس است."
