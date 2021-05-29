#!/bin/bash
echo "生成网页文件"
hugo -D
echo "重命名Docs"
rm -rf ./docs
mv ./public ./docs
