---
  title: "十分钟使用Github Actions自动同步代码仓库"
date: 2021-05-29T13:31:54+08:00
draft: false
tags: [
  "教程"
]
---

  ### 介绍
Github Actions是GitHub 于 2018 年 10 月推出的一个 CI\CD 服务。CI\CD 其实说的是三件事情：「持续集成（Continuous Integration）」、「持续交付（Continuous Delivery）」、「持续部署（Continuous Deployment）」。
有了 GitHub Action 以后， GitHub 除了能够存储代码，能做的事情就更多了，比如我在 master 分支上提交了一段代码， GitHub Action 可以自动的帮我部署到我自己的服务器上去，或者它还可以帮我把代码打成镜像，将镜像自动提交到镜像仓库里。
虽然这些事情自己手动也能做，但是懒惰是程序员的第一生产力嘛。

### 环境要求
1. 安装git
3. 拥有一个github账号

### 步骤


