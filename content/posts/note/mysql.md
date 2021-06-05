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

**1. 合并两个json数组(不去重)**

    - `select JSON_MERGE_PRESERVE('["1"]','["1","2","3"]');`
    
        结果：`["1", "1", "2", "3"]`
        
**2. 合并两个json数组(去重)**

    - `select JSON_MERGE_PATCH('["1"]','["1","2","3"]');`
    
        结果：`["1", "2", "3"]`

**3. 查询json对象字段**
      
      sku字段内容：`{name:"校服"}`
  
    - `SELECT sku->"$.name" FROM trade_store_sku`
      
      结果：`"校服"`
  
    - `SELECT sku->>"$.name" FROM trade_store_sku`
      
      结果：`校服`

**4. 赋值**

    - `SELECT JSON_SET('{"name":"校服"}', "$.name", "秋装")`
    
      结果：`{"name": "秋装"}` 

    - `SELECT JSON_SET('["1","2","3"]', "$[1]", "秋装")`
    
      结果：`["1", "秋装", "3"]` 

**5. 删除**

    - `SELECT JSON_REMOVE('{"name":"校服"}', "$.name")`
    
      结果：`{}` 

    - `SELECT JSON_REMOVE('["1","2","3"]', "$[1]")`
    
      结果：`["1", "3"]` 
