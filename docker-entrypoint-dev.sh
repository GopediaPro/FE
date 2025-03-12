#!/bin/sh
set -e

# 패키지가 변경되었는지 확인하고 필요한 경우 설치
if [ -f "package.json" ]; then
  # 이미 설치된 의존성이 있는지 확인
  if [ ! -d "node_modules" ] || [ ! -f "node_modules/.package-lock.json" ]; then
    echo "📦 Installing dependencies..."
    npm install
    # 설치 완료 표시 파일 생성
    touch node_modules/.package-lock.json
  else
    # package.json과 package-lock.json이 node_modules보다 최신인지 확인
    if [ "package.json" -nt "node_modules/.package-lock.json" ] || [ "package-lock.json" -nt "node_modules/.package-lock.json" ]; then
      echo "📦 Dependencies changed, reinstalling..."
      npm install
      touch node_modules/.package-lock.json
    else
      echo "📦 Dependencies are up to date."
    fi
  fi
fi

# 개발 서버 실행
echo "🚀 Starting development server..."
npm run dev -- --host 0.0.0.0