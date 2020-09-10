
## 下载flutter引擎源码

1. 在github上fork一份flutter引擎的官方代码：<https://github.com/flutter/engine>

    > 确保个人的github账号上已经添加了本机的ssh key

2. 在本地创建一个目录，比如：**flutter_engine**，在该目录下新建一个文件，名为`.gclient`，其内容如下：

    ```
    solutions = [
    {
        "managed": False,
        "name": "src/flutter",
        // 将<your_name_here>替换成自己github的账户名
        "url": "git@github.com:<your_name_here>/engine.git",
        "custom_deps": {},
        "deps_file": "DEPS",
        "safesync_url": "",
    },
    ]
    ```

3. 执行以下命令，下载flutter引擎以及其所依赖的库：

    ```shell
    $ cd flutter_engine
    $ gclient sync
    ```


## 准备编译flutter引擎的Docker镜像

将[Makefile](Makefile), [Dockerfile](Dockerfile)，[entrypoint.sh](entrypoint.sh)拷贝到flutter_engine目录。

可以选择从网上下载一个编译好的镜像，也可以重新本地编译一个。

- 从docker hub下载一个现有的镜像

    ```shell
    $ docker pull duanqz/flutter-build-env
    ```

- 本地编译一个镜像

    ```shell
    $ make flutter-build-env
    ```

## 运行Docker镜像

```shell
$ make docker-run
```

以上命令会以命令行进入Docker的ubuntu镜像，flutter引擎的源码映射到了/workspace目录，继续执行以下命令就能编译flutter引擎：

```shell
root@4be0cb124cd7:/workspace# source /etc/profile
root@4be0cb124cd7:/workspace# cd src
root@4be0cb124cd7:/workspace/src# ./flutter/tools/gn
root@4be0cb124cd7:/workspace/src# ninja -C out/host_debug/
```