# gank.io&妹纸

## 简述

gank.io&妹纸是以[gank.io](gank.io)官方提供的 Api 实现的 gank 客户端，包含以下几个模块：

- 最新数据展示
- 分类（Android、iOS、前端、休息视频、扩展资源、瞎推荐、App 几个标签）
- 妹纸，历史小姐姐照片墙
- 个人中心
- 妹纸详情，支持手势缩放图片

项目结构：经过初步的探索，决定采用前端的项目结构，[参考链接](https://eastblueokay.github.io/eastblueokay.github.io/2018/03/28/%E4%BC%98%E9%9B%85%E7%9A%84-Vue-%E9%A1%B9%E7%9B%AE%E7%9B%AE%E5%BD%95%E7%BB%93%E6%9E%84%E8%AE%BE%E8%AE%A1/)。其实，开发 flutter 和开发前端的差异也不大，例如 flutter 里的 StatefullWidget  类似前端里的容器组件，StatelessWidget 类似傻瓜组件，所以熟悉前端开发流程对上手 flutter 还是非常有帮助的。

## 构建步骤

该步骤基于 Android Studio，用宇宙第一 IDE 的童鞋请忽略。

### step1

> git clone git@github.com:HelloVass/QuMeiZhi.git

### step2

> open project

### step3

> 在 terminal 中：运行 flutter packages get 
>
> 或者
>
> 在 IDE 中：点击`pubspec.yaml`文件顶部的’Packages Get’

### step4

> 点击运行按钮

## 依赖库

- dio
- json_serializable
- cached_network_image

## 最后

本项目是移动端小组对 2018 年后起之秀的跨平台开发框架 flutter 的一次尝试和采坑之旅，目的是通过一个不算太简单也不算太复杂的项目，来熟悉 Dart&flutter。项目中积累的技术经验以及遇到无法解决的难题都会以文章的形式记录下来，作为移动端小组对 flutter 的输出，敬请期待。

最后谈谈我的看法，flutter 的落地就是一场漫长而又艰辛的怪物狩猎之旅，需要发现怪物的踪迹，耐心的一步一步追踪怪物的足迹，这期间可能会跟丢甚至走错路。遇到怪物之后，还需要耗费大量体力与精力与怪物厮杀，最后才是对怪物的致命一击。









