# tar



## 命令详解

【命令星级】 ⭐⭐⭐⭐⭐



【功能说明】 

- 将多个文件打包，或者解压打包的文件

  

## 语法格式

```shell
tar [option] [file]
```



![image-20210805123717918](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20210805123717918.png)





## 示例



- 1，压缩文件夹

```shell
tar zcvf test.tar.gz ./html  # 把html文件夹压缩成test.tar.gz
```

- 2，查看压缩包内容

```shell
tar ztvf test.tar.gz
```

- 3, 解压

```sh
tar zxvf  test.tar.gz
```

- 4，排除打包

```shell
tar zcvf www.tar.gz ./html --exclude=html/oldboy  #oldboy目录结尾不要加/ 否则会失败
tar zcvf www.tar.gz ./html --exclude=html/oldboy  --exclude=html/oldgirl #排除多个文件夹
```





> centos linux来说  加-z 和z效果一样
