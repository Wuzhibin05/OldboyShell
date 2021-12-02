# 使用dos2unix批量转换文件

​		`dos2unix`是Linux下的一个用户转换格式的程序，由于windows上文件的结束符和linux上的不同，那么在windows上编写的文件或者是脚本在Linux上就会遇到类似于下面的错误：

```bash
/bin/sh^M: bad interpreter: No such file or directory
```

出现上述的错误真实因为结束符的不同，要解决上述问题，只需要转换一下就行了



## 方法一：针对于单个文件或少量文件：

- 使用vi 编辑sh脚本或者其他的脚本文件，然后按ESC进入vi的命令行模式，输入下面的命令：

```bash
：set fileformat=unix
```

- 当然如果要将文件格式设定为dos文件格式，也就是windows的格式，那么输入下面的命令就行了

```bash
：set fileformat=dos
```

- 修改完成后，使用下面的命令查看文件的格式类型：

```bash
：set ff
```

**缺点：**只适合少量文件，当文件数较多时，工作量巨大



## 方法二：批量更改linux文件格式

​		和方法一类似的，Linux本身提供了dos2unix和unix2dos这两个命令来实现windows和linux文件的转换，

但是。dos2unix和unix2dos本身没有提供递归也就是批量修改的方式，这样一来我们就需要借助于xargs命令了

xargs的命令的作用就是将参数列表转换成小块分段传递给其他命令，借助于xargs，我们可以很简单的实现批量替换；

这里假设我需要替换的文件所在目录为 /home/test目录下，要更改文件格式的后缀为.py ,那么借助于下面的命令就可以轻松的实现批量替换格式：

批量替换为linux文件格式：

```bash
sudo find /home/test -name "*.py" | xargs dos2unix
```

批量替换为dos文件格式：

```bash
sudo find /home/test -name "*.py" | xargs unix2dos
```

**优点：**批量替换，工作量小， 总的来说，方法二借助于 管道符和xargs来实现的批量命令，将方法二修改一下就可以实现很多的批量操作，

比如：

1. 批量删除整个linux系统中后缀为.tmp的文件；那么命令可以这么写：

```bash
sudo find /home/test -name "*.tmp" | xargs rm -f
```

2. 删除整个linux系统中与apache相关的文件:

```bash
sudo find /home/test -name "*apache" | xargs rm -rf
```

只要理解了xargs的功能。

 

### 安装相关命令：

```bash
sudo yum -y install dos2unix
sudo yum -y install unix2dos
```

 批量去掉[noeol]

```bash
sudo find /home/test -name "*.*" | xargs cat -A
```

