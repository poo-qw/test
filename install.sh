#!/bin/bash

# نصب وابستگی‌های بک‌اند
echo "Installing backend dependencies..."
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# راه‌اندازی سرور بک‌اند
echo "Running backend..."
nohup flask run --host=0.0.0.0 --port=5000 &

# نصب وابستگی‌های فرانت‌اند
echo "Installing frontend dependencies..."
cd ../frontend
rm -rf node_modules package-lock.json dist
npm install
npm run build

echo "Setup complete. Backend on :5000, Frontend built in ./frontend/dist"
