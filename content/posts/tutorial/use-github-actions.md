---
  title: "十分钟使用Github Actions自动发布Hugo网站"
date: 2021-05-29T13:31:54+08:00
draft: false
tags: [
  "教程",
  "Actions"
]
---

  ### 介绍
Github Actions是GitHub 于 2018 年 10 月推出的一个 CI\CD 服务。CI\CD 其实说的是三件事情：「持续集成（Continuous Integration）」、「持续交付（Continuous Delivery）」、「持续部署（Continuous Deployment）」。
有了 GitHub Action 以后， GitHub 除了能够存储代码，能做的事情就更多了，比如我在 master 分支上提交了一段代码， GitHub Action 可以自动的帮我部署到我自己的服务器上去，或者它还可以帮我把代码打成镜像，将镜像自动提交到镜像仓库里。
虽然这些事情自己手动也能做，但是懒惰是程序员的第一生产力嘛。

### 环境要求
1. 安装git
2. 拥有一个github账号
3. 了解Github Pages托管静态网站方式 [Check\>\>\>](../use-github-pages)
4. TODO：自动同步到Gitee镜像

### 步骤
1. 了解github actions的工作流程、了解docker镜像基本使用方式。
2. 找到需要自动构建的Hugo静态网站，并确保在本地能够构建成功。
3. 开始使用github actions 服务，github actions会寻找项目根目录下`.github/workflows/*`下面所有的文件作为工作流描述文件，[了解详情>\>\>](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)。
这里我们不需要自己编写，直接使用第三方镜像，在github的[应用市场](https://github.com/marketplace?type=actions&query=hugo+) 中查找适合自己Hugo项目的actions镜像，这里用的是[hugo-setup](https://github.com/marketplace/actions/hugo-setup)。
把示例项目中`.github/workflows/`下面的配置文件拷贝到自己的项目中，如果同样使用的是hugo-setup，注意` publish_dir: ./public`配置在`v3.8.0`版本是不起作用的，直接默认就好，不用改。
如果报项目仓库的访问权限错误，去给自己的项目加上访问秘钥，[\>\>\>](https://github.com/peaceiris/actions-gh-pages#%EF%B8%8F-first-deployment-with-github_token)。
4. 修改代码推送到main分支，在github actions栏目中能够看到构建过程。构建成功后，修改git pages设置，把网站指向镜像自动部署的分支，要保证github pages能够找到index.html文件。

_------ 待完善_

