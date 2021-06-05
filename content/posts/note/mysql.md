---
title: "Mysql的Json相关操作"
date: 2021-06-02T13:31:54+08:00
draft: false
tags: [
  "Mysql",
  "笔记",
  "语法",
]
---
#### Mysql Json相关操作

_[官方文档](https://dev.mysql.com/doc/refman/8.0/en/json.html)_

1. 合并两个json数组(不去重)

    - `select JSON_MERGE_PRESERVE('["tag1"]','["tag1","tag2","tag3"]');`
    
        结果：`["tag1", "tag1", "tag2", "tag3"]`
        
2. 合并两个json数组(不去重)

    - `select JSON_MERGE_PATCH('["tag1"]','["tag1","tag2","tag3"]');`
    
        结果：`["tag1", "tag2", "tag3"]`

