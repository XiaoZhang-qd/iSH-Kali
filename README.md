# iSH-Kali-install

## 项目简介
**iSH-Kali-install** 是一个专为iOS/iPadOS上的iSH应用设计的Kali Linux安装脚本，让您能够在iOS设备上便捷地安装和使用Kali Linux环境。

![Kali Linux Logo](https://www.kali.org/images/kali-logo.svg)

## 项目信息
- **项目作者**: XiaoZhang-qd
- **项目地址**: https://github.com/XiaoZhang-qd/iSH-Kali
- **脚本版本**: 1.0
- **适用平台**: iOS/iPadOS 设备运行的 iSH 应用
- **脚本大小**: 20KB
- **更新频率**: 随缘更新
- **脚本依赖**: bash


## 设备与软件要求
- **设备**: iPhone 12/iPad Pro 2018及以上机型
- **软件**: 必须安装iSH应用
- **系统**: iOS/iPadOS 14及以上版本
- **存储**: 至少7GB可用空间
- **网络**: 需要连接互联网以下载必要文件
- **权限**: 需要root权限（iSH默认提供）
- **注意事项**: 请确保iSH应用已开启后台运行模式

## 功能特性
- 一键安装Kali Linux环境
- 支持多种安装选项组合
- 自动设置脚本权限
- 提供ASCII艺术图标显示
- 脚本版本检查与自动更新
- 安装iSH-Tools工具集
- 支持快捷指令工具

## 安装准备
1. 在App Store下载并安装**iSH**应用
2. 打开iSH应用，等待初始化完成
3. 确保您的设备已连接到稳定的网络
4. 在iOS设置中开启iSH的后台运行权限
   - 设置 → 隐私与安全性 → 定位服务 → iSH → 设置为"始终"
5. 下载此脚本到您的设备

## 安装步骤
1. 在iSH中，通过wget或curl运行安装脚本
   ```bash
   sudo bash "$(curl -fsSL https://raw.githubusercontent.com/XiaoZhang-qd/iSH-Kali/main/iSH-Kali-install.sh)"
   ```
    或者
   ```bash
   sudo bash "$(wget -O - https://raw.githubusercontent.com/XiaoZhang-qd/iSH-Kali/main/iSH-Kali-install.sh)"
   ```


   脚本将自动执行安装过程，包括下载Kali Linux镜像、安装依赖软件包、配置环境等。
   安装完成后，您可以在iSH应用中启动Kali Linux环境。
   首次启动时，系统会要求您设置root密码。请根据提示输入密码并确认。
   完成后，您可以使用`kali`用户名和您设置的密码登录Kali Linux环境。
   登录后，您可以使用`startkali`命令启动Kali Linux环境。
   您也可以使用`stopkali`命令停止Kali Linux环境。
   若要更新脚本到最新版本，请运行`updatekali`命令。
   若要卸载脚本，请运行`uninstallkali`命令。
   卸载时，脚本会提示确认操作。请输入`y`确认卸载。
   卸载完成后，您可以删除脚本文件。
   若要重新安装脚本，请重复以上步骤。
   注意：卸载脚本时，会删除Kali Linux环境和相关配置。请确保您已备份重要数据。