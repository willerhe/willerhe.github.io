#### Spring事务的默认隔离级别?

默认隔离级别：REPEATED_READ

1. READ_UNCOMMITED 读未提交  高并发场景下，其他线程可以读到未提交的事务的数据 ，可能出现脏读、幻读或不可重复读
2. READ_COMMITED 读已提交  只能读到已提交的数据
3. REPEATED_READ 重复读 能读到当前事务中的未提交的数据和其他事务已经提交的数据
4. SERIALIZABLE 串行化 事务挨个执行，不存在脏读、幻读、不可重复读问题，但是影响性能

#### 常见的设计模式？

1. 单例模式
2. 装饰器模式 一个统一的抽象父类，不同的子类有自己不同的装饰属性和装饰方法
3. 工厂模式 流程一致，但每个子类的单独流程处理不同
4. 建造者模式 SQL build就是非常常见的一种建造者模式
5. 观察者模式 即发布订阅模式

#### Spring中所使用的设计模式
1. 切面AOP使用代理模式、事务也是使用的代理模式
2. 适配器模式，DispatcherServlet根据请求信息调用HandlerMapping
3. 装饰器模式，Spring 中配置 DataSource 的时候，DataSource 可能是不同的数据库和数据源
4. 工厂模式，Spring使用工厂模式通过 BeanFactory、ApplicationContext 创建 bean 对象
5. 模板方法模式，spring 中 jdbcTemplate、hibernateTemplate 等以 Template 结尾的对数据库操作的类，它们就使用到了模板模式
6. 观察者模式，ApplicationEvent
7. 单例模式，Spring 中 bean 的默认作用域就是 singleton(单例)的

#### 常用的软件工程图。时序图、状态图、ER图、流程图

#### Mysql常用的方法

```sql
concat、ifnull、upper、substr、trim、rpad、lpad、replace、round、now、currenttime、UNIX_TIMESTAMP、FROM_UNIXTIME
```

#### Mysql分页的实现

1. limit offset 传统实现
2. 通过有序id去实现
3. 覆盖索引，利用索引优势select * from (select id from job limit 1000000,100) a left join job b on a.id = b.id;

#### 如何处理超卖订单？

避免超卖订单的产生：分布式锁（redison）底层是用Lua脚本实现的redis原子执行，乐观锁、自旋锁。

还有可能出现的问题：redis主从切换导致锁丢失

#### mq 的典型应用场景，项目中什么地方用到过，怎么实现的？

目的：削峰、解耦

高可用：rabbitmq的镜像集群的部署模式

...

#### 什么场景下会使用多线程

1. 一个业务有很多处理流程并且处理流程之间不会相互影响
2. 定时任务、批处理任务
3. 需要知道一个任务的执行情况，比如redission中自动续期功能的实现就是一个新的线程不断查看锁的引用状态

#### Redis的几种基本数据类型

1. String
2. 键值对Hash
3. 列表list
4. 集合set
5. 有序集合zset

#### Mybatis怎么用WhereIn

不能够直接写会有sql注入问题，用Mybatis的foreach方法对数组进行处理。

#### 线程的几种状态

1. 创建
2. 可运行
3. 运行中
4. 阻塞
5. 消亡

#### Idea中常用的插件有哪些

1. Idea Mind Map

2. MybatisX 映射文件的生成

3. Mybatis log plugin 把mybatis生成的日志转为实际的sql语句

#### SpringMVC的声明周期

1. 发起请求到前端控制器DispatcherServlet
2. 前端控制器请求Handle
3. 向前端控制器返回Handle
4. 前端控制器去处理执行Handle
5. 返回结果

#### Java中==和equals的不同

对于基本数据类型来说没有不同，对于引用类型==对比实际引用的对象，equals对比的是值

#### Java中如何让toString方法不产生异常

用valueOf会返回字符串`"null"`

#### Java反射的原理

1. java反射机制实现是在代码的运行时实现
2. java在编译后会生成class文件，反射通过字节码文件找到类的属性和方法

#### Java中数组转list

1. `List<Integer> list1 = new ArrayList<>(Arrays.asList(arr));`
2. `Collections.addAll(list1,arr);`
3. `Java9中 List<String> resultList = List.of(array);`

#### Java中String、StringBuilder、StringBuffer的区别

1. String是不可变类，任何对字符串的操作都会产生新的对象空间
2. StringBuffer、StringBuilder都不会产生额外的空间
3. StringBuffer是线程安全的，但是效率和StringBuilder相比要慢得多
4. StringBuffer加了很多`synchronized`

#### Java中`synchronized`和`volatile`的区别

1. 都是为了保证线程安全，线程安全分为两个方面`执行控制`和`内存可见`
2. synchronized实现执行控制，它会阻止其他线程访问被其保护的代码段
3. volatile保证了内存可见，volatile声明的变量在读取的时候都会在主存中读取
4. volatile不会造成线程阻塞，volatile只能用于变量，volatile只适用于对变量的写入不依赖变量当前值的情况

#### Java中HashMap和HashTable的区别

HashTable线程安全 不能用null作为key，HashMap不安全 可以用null作为key

#### MySQL中left join的时候on后面加的条件是过滤什么数据的

on后面加的条件是对临时表数据进行过滤，不影响主表数据，where后的条件是过滤主表数据的

#### 一条MySQL执行的全部流程

1. 查询缓存 - MySQL 拿到一个查询请求后先会在查询缓存中看看是否执行过此语句，之前执行的语句会以 key-value 的形式缓存在内存中，key 是缓存的语句，value 是查询的结果
2. 解析器生成解析树，判断是否满足SQL要求
3. 预处理再次生成解析数
4. 查询优化
   - 选择合适的索引
   - 扫表还是走索引
   - 表关联
   - 优化where
5. 查询执行计划和执行引擎，保证权限
6. 查询数据返回结果

#### 几种方法可以过滤数组的某几个元素

1. java8的filter方法

2. 传统方式的遍历

#### 移除List中的元素，用for循环遍历的时候是从前到后还是从后到前?从后向前

#### 微服务的相关组件

1. 网关 Spring-gateway
2. 注册中心和配置中心 nacos
3. 服务通信 spring-openfeign
4. 负载均衡ribbon
5. 服务降级、熔断限流Hystrix、sentinel
6. 分布式事务seata

#### Spring中常用的注解

`RestController RequestMapping RequestBody RequestParam PathVariable RequiresPermissions Autowried`

#### Spring中一个服务接口多个实现，怎么注入Controller

通过给service自定义名称注入，用Resource注入并加name，或者保持名称一致用Autowired，或者用Qualifier加类名

#### Java中注解的实现原理

1. 注解的本质是一个接口
2. 运行时会反射得到注解信息
3. 能够注解注解的注解叫做元注解

#### 线程、进程、携程

进程是操作系统分配资源的最小单位，线程是程序分配的最小单位，携程是基于线程之上的更加轻量的存在

#### JVM类加载器怎么加载的类顺序

1. 首先加载父类的静态字段或者静态语句块

2. 子类的静态字段或静态语句块

3. 父类普通变量以及语句块

4. 父类构造方法被加载

5. 子类变量或者语句块被加载

6. 子类构造方法被加载

#### 应对高并发的手段

1. redis缓存
2. CDN加速、负载均衡
3. 索引优化
4. MQ削峰
5. 通过redis实现的分布式限流方法，实现方式类似令牌桶

#### 容器化的优势

1. 减少启动和管理的虚拟机的数量
2. 可移植，具备灵活性，能够快速部署
3. 可以编排容器，提高生产力

#### Java中如何实现一个单例
双重检查的实现方法(线程安全、关注效率)

```java
public class Singleton {

    private static volatile Singleton singleton;
    private Singleton() {}
    public static Singleton getInstance() {
        if (singleton == null) {
            synchronized (Singleton.class) {
                if (singleton == null) {
                    singleton = new Singleton();
                }
            }
        }
        return singleton;
    }
}
```

#### MySQL中Left Join、Inner join、right join的区别

1. Inner join 等值连接 返回两个表中连接字段相等的值
2. Left join 左表为基础返回左表中所有的记录和右表中连接记录相等的记录
3. 同left join

#### AOP切面
底层通过动态代理实现
实现：
1. @Component @Aspect
2. @Pointcut(value = "execution( * com.example.demo.controller.*.*(..))")
3. @Around("pointCut()")

#### 事务
Springboot注解式事务的使用需要了解事务的 [传播机制](https://blog.csdn.net/levae1024/article/details/82998386)。
1. 脏读：一个事务读取了另外一个事务没有提交的数据，然后另外一个事务回滚了，造成第一个事务读取数据错误
2. 不可重复读： 在一个事务当中前后两次查询数据得到的值是不一样的，说明有其他事务修改了数据
3. 幻读：一般是增加或者删除操作

mysql默认的隔离级别是Repeatable Read 在读取数据的时候不能修改，但是因为可以删除和新增所以可能产生幻读

一般事务使用要加上rollbackFor 确保不论出现什么异常都会回滚@Transactional(rollbackFor = Exception.class)

B站视频[详解事务](https://www.bilibili.com/video/BV1EE411p7dD)

#### 分布式架构需要用到的锁
synchronize 是针对单机部署的情况，如果有多个实例就需要用到分布式的锁，分布式的锁一般是可重入式的自旋锁

B站视频 详解[分布式锁](https://www.bilibili.com/video/BV1vi4y1V7se?p=7&t=377)

#### Redis缓存不一致问题
缓存和事务结合起来容易出现缓存不一致的情况，应该在事务提交的时候删除缓存

#### 内存泄漏相关问题
1. 造成内存泄漏的常见原因：长期持有某些资源没有释放、对象所占内存过大、static修饰的静态资源太大

[其他汇总](https://blog.csdn.net/duoduo18up/article/details/81545958)

#### BIO、NIO、AIO 有什么区别？

BIO：Block IO 同步阻塞式 IO，就是我们平常使用的传统 IO，它的特点是模式简单使用方便，并发处理能力低。

NIO：New IO 同步非阻塞 IO，是传统 IO 的升级，客户端和服务器端通过 Channel（通道）通讯，实现了多路复用。

AIO：Asynchronous IO 是 NIO 的升级，也叫 NIO2，实现了异步非堵塞 IO ，异步 IO 的操作基于事件和回调机制。

#### ThreadLocal的作用
实现在线程中的上下文传递对象
创建线程的私有变量
#### Web问题安全
1. SQL注入 Mybatis中使用#{}代替${},#可以预编译，#{xxx}，使用的是PreparedStatement，会有类型转换，所以比较安全；
2. XSS/CSS跨站脚本攻击
3. CSRF跨站请求伪造
#### 常见的异常类
1. NullPointerException：当应用程序试图访问空对象时，则抛出该异常。

2. SQLException：提供关于数据库访问错误或其他错误信息的异常。

3. IndexOutOfBoundsException：指示某排序索引（例如对数组、字符串或向量的排序）超出范围时抛出。 

4. NumberFormatException：当应用程序试图将字符串转换成一种数值类型，但该字符串不能转换为适当格式时，抛出该异常。

5. FileNotFoundException：当试图打开指定路径名表示的文件失败时，抛出此异常。

6. IOException：当发生某种I/O异常时，抛出此异常。此类是失败或中断的I/O操作生成的异常的通用类。

7. ClassCastException：当试图将对象强制转换为不是实例的子类时，抛出该异常。

8. ArrayStoreException：试图将错误类型的对象存储到一个对象数组时抛出的异常。

9. IllegalArgumentException：抛出的异常表明向方法传递了一个不合法或不正确的参数。

10. ArithmeticException：当出现异常的运算条件时，抛出此异常。例如，一个整数“除以零”时，抛出此类的一个实例。 

11. NegativeArraySizeException：如果应用程序试图创建大小为负的数组，则抛出该异常。

12. NoSuchMethodException：无法找到某一特定方法时，抛出该异常。

13. SecurityException：由安全管理器抛出的异常，指示存在安全侵犯。

14. UnsupportedOperationException：当不支持请求的操作时，抛出该异常。

15. RuntimeExceptionRuntimeException：是那些可能在Java虚拟机正常运行期间抛出的异常的超类。

#### 题目汇总
[地址](https://zhuanlan.zhihu.com/p/64147696)


#### Spring中实现代理的方式
1. jdk代理，依赖接口，如果没有接口就不能实现
2. cglib动态代理
动态代理jdk要比cglib效率好一些，所以server层一般都使用接口

#### Java8的函数式编程汇总
todo..

#### 什么是面向对象
#### 封装继承和多态

#### Netty 使用

#### 反射的实现原理

#### 多个集群怎么保证会话一致性
1. 有状态的，通过redis存储用户的凭证信息
2. 无状态的，每次都去计算，无状态的



















