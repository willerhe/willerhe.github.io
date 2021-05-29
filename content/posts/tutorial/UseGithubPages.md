---
title: "十分钟使用Github Pages和Hugo搭建个人网站1"
date: 2021-05-29T13:31:54+08:00
draft: false
tags: [
  "教程"
]
---

### 介绍
Github Pages是Github官方的静态站点托管系统，能够依赖Git的代码管理能力和Github的仓库轻松维护个人网站。

Hugo是Go编写的静态网站生成器，速度快，易用，可配置。
使用Github Pages + Hugo构建个人网站的优点：
- 无须额外服务器，无须额外服务器，专注创作
- 支持Markdown
- 支持查看文件的历史改动
- Hugo拥有海量皮肤，能够自定义

### 环境要求
1. 安装git
2. 安装golang、hugo
3. 拥有一个github账号

### 步骤
1. 为站点创建仓库，仓库名称必须为`<user>.github.io`或者`<organization>.github.io`，必须为`Public`仓库，必须有`README.md`文件，必须有`index.html`作为网站入口。[More\>\>\>](https://docs.github.com/cn/pages/getting-started-with-github-pages/creating-a-github-pages-site#creating-a-repository-for-your-site)
2. 访问网站`https://<user>.github.io`或者`<https://<organization>.github.io`。看到`index.html`中的内容说明成功。
3. 了解静态网站生成器，github官方是[Jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll)，因为之前用过Hugo，体验非常好，所以改用Hugo。还有更多类似的 [类似工具](https://linux.cn/article-12671-1.html)，
但是最终目的是相同的，要把我们的文档内容转为静态网页文件，关于Hugo的安装和使用查看见[详情](https://gohugo.io/)。
4. 一切顺利的话，一个好看的网站就诞生了。

_------ 待完善_

