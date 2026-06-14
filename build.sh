set -ex

# 1. 彻底清除所有 Go Module 相关的“幽灵文件”
rm -rf go.mod go.sum
rm -rf themes/hugo-theme-stack

# 2. 【关键】删除可能隐藏的 module.toml 配置文件！
rm -f config/_default/module.toml

# 3. 下载主题到本地 themes 文件夹
mkdir -p themes
curl -sL https://github.com/CaiJimmy/hugo-theme-stack/archive/refs/heads/master.tar.gz | tar xz -C themes/
mv themes/hugo-theme-stack-* themes/hugo-theme-stack

# 4. 【自动化手术】强制在 config.toml 第一行注入 theme 字段
sed -i '/^theme\s*=/d' config/_default/config.toml
sed -i '1s/^/theme = "hugo-theme-stack"\n/' config/_default/config.toml
