# nginx-1.22.0-reading快速开始

## 介绍
本仓库集成了一些《深入理解Nginx》中的示例代码，使用nginx-stable-1.22.0版本。

## 安装教程
1. 编译和安装
    目前项目支持以下例子：
    1. helloworld
    2. sendfile
    3. testconfig
    4. upstream
    5. subrequest
    6. testfilter

    如果要运行以上例子中的一个，需要在编译时指定上面的变量，如`make build helloworld=1`。

    ``` shell
    # 编译Nginx，使用官方默认模块
    make build
    # 编译时添加upstream模块
    make build upstream=1

    # 安装
    make install

    # 清理编译文件
    make clean
    ```

    默认安装路径为：`/usr/local/nginx`。如果需要自定义安装目录，请设置`prefix`变量，如：
    ``` shell
    make prefix=/root/nginx
    ```

2. 卸载
    ``` shell
    # 默认安装路径
    rm -r /usr/local/nginx

    # 如果使用自定义安装路径，需要自己记录安装路径
    rm -r /root/nginx
    ```

3. 热部署: `make build && make upgrade`
