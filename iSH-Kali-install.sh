#!/bin/bash
# 安装iSH上的Kali

# 检查是否为root用户
if [ "$(id -u)" != "0" ]; then
    echo "错误：请使用root用户运行此脚本"
    exit 1
fi

# 获取当前脚本名称
SCRIPT_NAME=$(basename "$0")
# 定义脚本版本号
VERSION="1.0"

# 给脚本添加相应的权限
Permission() {
    # 检查脚本是否已经有执行权限
    if [ -x "./$SCRIPT_NAME" ]; then
        echo -e "${GREEN}脚本 ${SCRIPT_NAME} 已经有执行权限，无需重复操作${NC}"
        return
    fi
    # 提示用户此脚本无权限
    echo -e "${LIGHT_RED}脚本 ${SCRIPT_NAME} 无执行权限，需要添加权限${NC}"
    # 提示用户正在添加权限
    echo -e "${YELLOW}正在给脚本： ${SCRIPT_NAME} 添加可执行权限${NC}"
    # 使用 chmod +x 添加可执行权限，避免使用不安全的 7777 权限
    chmod +x "./$SCRIPT_NAME"
    # 检查权限添加是否成功
    if [ -x "./$SCRIPT_NAME" ]; then
        echo -e "${GREEN}脚本 ${SCRIPT_NAME} 已成功添加可执行权限${NC}"
    else
        echo -e "${RED}脚本 ${SCRIPT_NAME} 添加可执行权限失败，可能是权限不足或文件系统只读，请检查后重试${NC}"
        return 1
    fi
}


# 颜色代码
RED='\033[0;31m' # 红色
LIGHT_RED='\033[1;31m' # 亮红色
GREEN='\033[0;32m' # 绿色
LIGHT_GREEN='\033[1;32m' # 亮绿色
YELLOW='\033[0;33m' # 黄色
LIGHT_YELLOW='\033[1;33m' # 亮黄色
BLUE='\033[0;34m' # 蓝色
LIGHT_BLUE='\033[1;34m' # 亮蓝色
PURPLE='\033[0;35m' # 紫色
LIGHT_PURPLE='\033[1;35m' # 亮紫色
CYAN='\033[0;36m' # 青色
LIGHT_CYAN='\033[1;36m' # 亮青色
WHITE='\033[0;37m' # 白色
LIGHT_WHITE='\033[1;37m' # 亮白色
BLACK='\033[0;30m' # 黑色
LIGHT_BLACK='\033[1;30m' # 亮黑色
NC='\033[0m' # 无颜色/重置颜色

# 定义ASCII图标
ASCII_logo() {
    # 定义ASCII图标1

    ASCII_logo1="${BLUE}

..............
            ..,;:ccc,.
          ......''';lxO.
.....''''..........,:ld;
           .';;;:::;,,.x,
      ..'''.            0Xxoc:,.  ...
  ....                ,ONkc;,;cokOdc',.
 .                   OMo           ':ddo.
                    dMc               :OO;
                    0M.                 .:o.
                    ;W${RED}d
                     ${BLUE};${RED}XO,
                       ,d0Odlc;,..
                           ..',;:cdOOd::,.
                                    .:d;.':;.
                                       'd,  .'
                                         ;l   ..
                                          .o
                                            c
                                            .'
                                             .
${NC}
"

    # 定义ASCII图标2
    ASCII_logo2="${BLUE}

    ##################################################
    ##                                              ##
    ##  ${RED}88      a8P         db        88        88  ${BLUE}##
    ##  ${RED}88    .88'         d88b       88        88  ${BLUE}##
    ##  ${RED}88   88'          d8''8b      88        88  ${BLUE}##
    ##  ${RED}88 d88           d8'  '8b     88        88  ${BLUE}##
    ##  ${RED}8888'88.        d8YaaaaY8b    88        88  ${BLUE}##
    ##  ${RED}88P   Y8b      d8''''''''8b   88        88  ${BLUE}##
    ##  ${RED}88     '88.   d8'        '8b  88        88  ${BLUE}##
    ##  ${RED}88       Y8b d8'          '8b 888888888 88  ${BLUE}##
    ##                                              ##
    ####  ############# ${RED}NetHunter ${BLUE}####################${NC}
    
    "

    # 随机输出图标
    if [ $((RANDOM % 2)) -eq 0 ]; then
        echo -e "${ASCII_logo1}"
    else
        echo -e "${ASCII_logo2}"
    fi
}

# 项目介绍
Project_Introduction() {
    # 项目介绍
    echo -e "${BLUE}iSH-Kali-install(iSH-Kali 安装脚本程序)${NC}"
    echo -e "${RED}项目作者: XiaoZhang-qd${NC}"
    echo -e "${CYAN}项目地址:https://github.com/XiaoZhang-qd/iSH-Kali${NC}"
    # 设备与软件要求
    echo -e "${YELLOW}设备与软件要求：${NC}"
    echo -e "1. 设备：iPhone 12/iPad Pro 2018及以上"
    echo -e "2. 软件：必须是iSH应用"
    echo -e "3. 系统：iOS/iPadOS 14 及以上"
    echo -e "4. 检查下载的系统文件的大小是否为2GB，如果不是请重新下载"
    echo -e "5. 存储：7GB 及以上"
    echo -e "6. 网络：需要连接到互联网"
    echo -e "7. 权限：需要root权限（默认是有root的权限的）"
    echo -e "8. 注意：请确保iSH应用已打开后台运行"
}

# 安装iSH-tool
install_iSH-Tools() {

    # 让用户确认
    read -p "是否开始安装iSH-tool？(y/n) " confirm
    if [[ "$confirm" =~ ^([Yy]|)$ ]]; then
        echo -e "${GREEN}开始安装iSH-Tools${NC}\n"
        # 安装iSH-Tools
        install_iSH-Tools
    elif [[ "$confirm" =~ ^[Nn]$ ]]; then
        echo -e "${RED}已取消安装${NC}\n"
        return
    else
        echo -e "${RED}无效选择，请重新输入。${NC}"
        main
        return
    fi

    # 更新源和软件包
    # sudo apk update -y
    # sudo apk upgrade -y
    # 安装完成

    echo "iSH-Tools安装完成"
}

# 安装Kali
install_kali() {

    # 让用户确认
    read -p "是否开始安装Kali？(y/n) " confirm
    if [[ "$confirm" =~ ^([Yy]|)$ ]]; then
        select_other_features
    elif [[ "$confirm" =~ ^[Nn]$ ]]; then
        printf "${RED}已取消安装${NC}\n"
        return
    else
        echo -e "${RED}无效选择，请重新输入。${NC}"
        main
        return
    fi

    # 更新源和软件包
    sudo apk update -y
    # sudo apk upgrade -y
    # 检查并安装依赖 wget 和 curl
    dependencies=("wget" "curl")
    for dep in "${dependencies[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            echo "$dep 未安装，正在安装..."
            # 提示用户正在安装
            echo -e "${YELLOW}正在安装${dep}${NC}"
            # 安装依赖
            sudo apk add "$dep"
            # 检查安装是否成功
            if command -v "$dep" &> /dev/null; then
                echo -e "${GREEN}${dep} 安装成功${NC}"
            else
                echo -e "${RED}${dep} 安装失败${NC}"
            fi
        fi
    done
    # 创建kaliapp目录和进入kaliapp目录
    mkdir -p ~/kaliapp && cd ~/kaliapp
    # 下载Kali的系统文件
    wget https://yoururl.com/kali.tar.xz
    # curl -o kali.tar.xz https://yoururl.com/kali.tar.xz
    # 返回上一级目录
    cd ../
    # 安装Kali的方法
    echo -e "
    选择安装Kali的方法：
    从iSH应用开始：

    进入设置[齿轮图标]
    点击文件系统[Filesystems]
    点击导入[Import]
    选择下载下来的Kali根文件系统tar归档文件的目录（仅支持.tar.gz格式）并选择它 （在iSH的kaliapp目录下）
    等待iSH应用完全导入该文件
    选择您导入的Kali文件（kali.tar.xz）
    最后点击从此文件系统启动[Boot From This Filesystem]
    iSH应用会崩溃，不用担心，这是正常现象！再次启动iSH应用，等待其启动到新的文件系统
    现在您进入了Alpine系统，它作为恢复操作系统。从此处运行启动脚本以初始化Kali Linux环境：./kali.sh  

    恭喜！您现在可以在iOS设备上以文本模式使用完整的Kali Linux了

    要退出Kali环境，只需输入  exit 
    要退出iSH应用，只需再次输入  exit
"


    # 安装完成

    echo "Kali安装完成"
}

# 更新安装脚本
update_script() {
    # 更新安装脚本
    echo -e "${GREEN}开始更新安装脚本${NC}\n"
    # 定义远程版本文件地址
    REMOTE_VERSION_URL="https://yoururl.com/version.txt"
    # 检查是否有安装有curl
    if ! command -v curl &> /dev/null; then
        echo -e "${RED}curl 未安装，正在安装...${NC}"
        # 安装curl
        sudo apk add curl
    fi
    
    # 获取远程版本号
    echo -e "${YELLOW}正在获取远程脚本版本号...${NC}"
    REMOTE_VERSION=$(curl -s "$REMOTE_VERSION_URL")
    if [ $? -ne 0 ]; then
        echo -e "${RED}获取远程版本号失败，请检查网络连接${NC}"
        return 1
    fi
    
    # 比较本地和远程版本号
    echo -e "${YELLOW}正在比较版本号...${NC}"
    if [ "$VERSION" != "$REMOTE_VERSION" ]; then
        echo -e "${YELLOW}检测到新版本：${REMOTE_VERSION}，当前版本：${VERSION}，开始更新脚本...${NC}"
        # 执行更新操作
        # 备份旧脚本
        # echo -e "${YELLOW}正在备份旧脚本...${NC}"
        # mv "$0" "$0.bak"
        # 删除旧脚本
        echo -e "${BLUE}正在更新脚本...${NC}"
        echo -e "${YELLOW}正在删除旧脚本...${NC}"
        sudo rm "./$SCRIPT_NAME"
        # 检查是否有安装有git
        if ! command -v git &> /dev/null; then
            echo -e "${YELLOW}git 未安装，正在安装...${NC}"
            # 安装git
            # 更新源和软件包
            sudo apk update -y
            # sudo apk upgrade -y
            # 提示用户正在安装
            echo -e "${YELLOW}正在安装git${NC}"
            sudo apk add git
        fi
        # 下载(克隆)最新脚本
        git clone https://github.com/XiaoZhang-qd/iSH-Kali.git ~/iSH-Kali
        # 进入iSH-Kali目录
        cd ~/iSH-Kali
        # 检查下载是否成功
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}脚本更新成功，当前版本：${REMOTE_VERSION}${NC}"
            # 重新赋予执行权限
            chmod +x "$0"
        else
            echo -e "${RED}脚本更新失败，请检查网络连接${NC}"
            return 1
        fi
    else
        echo -e "${GREEN}脚本已经是最新版本（版本号：${VERSION})${NC}"
    fi
}

# 检查更新
check_update() {
    # 定义远程版本文件地址
    REMOTE_VERSION_URL="https://yoururl.com/version.txt"
    
    # 获取远程版本号
    echo -e "${YELLOW}正在获取远程脚本版本号...${NC}"
    REMOTE_VERSION=$(wget -qO- "$REMOTE_VERSION_URL")
    if [ $? -ne 0 ]; then
        echo -e "${RED}获取远程版本号失败，请检查网络连接${NC}"
        return 1
    fi
    
    # 比较本地和远程版本号
    echo -e "${YELLOW}正在比较版本号...${NC}"
    if [ "$VERSION" != "$REMOTE_VERSION" ]; then
        echo -e "${YELLOW}检测到新版本：${REMOTE_VERSION}，当前版本：${VERSION}，请更新脚本。${NC}"
    else
        echo -e "${GREEN}脚本已经是最新版本（版本号：${VERSION})${NC}"
    fi
}

# 让用户选择其他功能
select_other_features() {
    # 清空屏幕
    clear
    # ASCII_logo
    ASCII_logo

    echo -e "${CYAN}请选择其他操作：${NC}"
    sleep 0.01
    echo -e "${CYAN}1. 仅安装Kali${NC}"
    sleep 0.01
    echo -e "${CYAN}2. 安装Kali + iSH-Tools${NC}"
    sleep 0.01
    echo -e "${CYAN}3. 安装Kali + iSH-Tools + 快捷指令的工具${NC}"
    sleep 0.01
    echo -e "${CYAN}4. 安装Kali + 快捷指令的工具${NC}"
    sleep 0.01
    echo -e "${CYAN}5. 更新安装脚本${NC}"
    sleep 0.01
    echo -e "${CYAN}6. 检查更新${NC}"
    sleep 0.01
    echo -e "${CYAN}0. 退出程序${NC}"
    sleep 0.01
    read -p "请输入您的选择（1/2/3/4/5/6/0）：" choice

    # 检查输入是否为数字
    if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}无效选择，请输入数字。${NC}"
        clear
        select_other_features
        return
    fi

     case $choice in
        1)
            # 仅安装Kali
            echo -e "你选择了${YELLOW}仅安装Kali${NC}"
            install_kali
            ;;
        2)
            # 安装Kali + iSH-Tools
            echo -e "你选择了${YELLOW}安装Kali + iSH-Tools${NC}"
            install_kali
            install_iSH-Tools
            ;;
        3)
            # 安装Kali + iSH-Tools + 快捷指令的工具
            echo -e "你选择了${YELLOW}安装Kali + iSH-Tools + 快捷指令的工具${NC}"
            install_kali
            install_iSH-Tools
            shortcut
            ;;
        4)
            # 安装Kali + 快捷指令的工具
            echo -e "你选择了${YELLOW}安装Kali + 快捷指令的工具${NC}"
            install_kali
            shortcut
            ;;
        5)
            # 更新安装脚本
            echo -e "你选择了${YELLOW}更新安装脚本${NC}"
            update_script
            ;;
        6)
            # 检查更新
            echo -e "你选择了${YELLOW}检查更新${NC}"
            check_update
            ;;
        0)
            # 退出程序
            clear
            echo -e "你选择了${YELLOW}退出程序${NC}"
            echo -e "${GREEN}谢谢使用，再见！${NC}"
            exit 0
            ;;
        *)
            # 无效选择
            echo -e "${RED}无效选择，请重新输入。${NC}"
            clear
            select_other_features
            return
            ;;
    esac
}



# 主函数
main() {
    # 清空屏幕
    clear
    # 向用户显示ASCII图标
    ASCII_logo
    # 项目介绍
    # Project_Introduction
    # 向用户确认是否开启后台
    echo -e "${YELLOW}是否开启iSH应用的后台运行？(y/n)${NC}"
    # 读取用户输入
    read -p "请输入您的选择(y/n)：" background_choice
    # 检查用户输入
    if [[ "$background_choice" =~ ^[Yy]$ ]]; then
        echo -e "${GREEN}已开启iSH应用的后台运行${NC}"
        echo -e "${GREEN}记得在设置-->隐私与安全性-->定位服务-->iSH 中把允许访问位置信息设置为始终${NC}"

    elif [[ "$background_choice" =~ ^([Nn]|)$ ]]; then
        echo -e "${RED}未开启iSH应用的后台运行${NC}"
        echo -e "${RED}请开启iSH应用的后台运行，否则会因为被杀后台导致安装过程中断或失败除非您可以一直让iSH保持前台运行${NC}"
    else
        echo -e "${RED}无效选择，请重新输入。${NC}"
        main
        return
    fi
    # 向用户确认和检查并添加脚本权限
    read -p "是否开始添加脚本权限？(y/n) " confirm
    if [[ "$confirm" =~ ^([Yy]|)$ ]]; then
        Permission
    elif [[ "$confirm" =~ ^[Nn]$ ]]; then
        printf "${RED}已取消添加脚本权限，必须要添加脚本权限才可以使用其他功能${NC}\n"
        return
    else
        echo -e "${RED}无效选择，请重新输入。${NC}"
        main
        return
    fi
    # 调用安装Kali函数
    install_kali
}

# 执行主函数
main
