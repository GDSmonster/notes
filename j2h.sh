#!/bin/zsh

# 创建 html 存放目录
mkdir -p html

# 转换所有根目录下的 .ipynb 文件到 html 目录
for notebook in *.ipynb; do
    jupyter nbconvert --to html "$notebook" --output-dir html --output "$(basename "$notebook" .ipynb)"
done

# 将新链接添加到 README.md 的末尾
# echo "\n Notebooks $notebook" >> README.md
for notebook in *.ipynb; do
    echo "- [View $(basename "$notebook" .ipynb) Notebook](./html/$(basename "$notebook" .ipynb).html)" >> README.md
done
