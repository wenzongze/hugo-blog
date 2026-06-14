#!/bin/bash
set -ex

# 清理旧文件
rm -rf go.mod go.sum themes/hugo-theme-stack public

# 创建必要的目录
mkdir -p themes public

# 下载并解压 Hugo 主题
echo "📥 正在下载 Hugo 主题..."
curl -sL https://github.com/CaiJimmy/hugo-theme-stack/archive/refs/heads/master.tar.gz | tar xz -C themes/
mv themes/hugo-theme-stack-* themes/hugo-theme-stack

# 下载并解压 Hugo Extended 引擎 (使用更新的版本)
HUGO_VERSION="0.130.0"
echo "⏬ 正在下载 Hugo 引擎 v${HUGO_VERSION}..."
curl -sL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" -o hugo.tar.gz

# 检查下载是否成功
if [ ! -f hugo.tar.gz ]; then
  echo "❌ 下载 Hugo 失败！"
  exit 1
fi

# 解压 Hugo
tar xzf hugo.tar.gz hugo
chmod +x hugo

# 验证 Hugo 安装
./hugo version

# 构建站点
echo "🚀 正在构建站点..."
./hugo --gc --minify
