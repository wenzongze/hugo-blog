rm -f go.mod go.sum
mkdir -p themes
curl -sL https://github.com/CaiJimmy/hugo-theme-stack/archive/refs/heads/master.tar.gz | tar xz -C themes/
mv themes/hugo-theme-stack-* themes/hugo-theme-stack
