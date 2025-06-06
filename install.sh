#!/bin/bash

echo "🚀 VPN Rewarder Installer"
echo "--------------------------"

# Stop on errors
set -e

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

# Check for git
if ! command -v git &> /dev/null; then
  echo "🔧 git یافت نشد. در حال نصب git..."
  sudo apt install -y git
fi

# Clone repo
echo "📥 در حال دریافت پروژه از گیت‌هاب..."
git clone https://github.com/poo-qw/test.git vpnrewarder
cd vpnrewarder/frontend || exit 1

# Install dependencies
echo "📦 نصب پکیج‌ها..."
npm install

# Build project
echo "🏗️ در حال ساخت پروژه..."
npx vite build

# Install serve globally (if not already)
if ! command -v serve &> /dev/null; then
  echo "🌐 در حال نصب serve برای اجرای پروژه..."
  npm install -g serve
fi

# Run project
echo "🚀 اجرای برنامه روی http://localhost:3000"
serve -l 3000 dist
