#!/bin/zsh

# 指定要安装的 Python 版本
PYTHON_VERSION="3.11"  # 可以根据需要更改

# 检测并安装指定版本的 Python
if  ls /usr/bin/python$PYTHON_VERSION &> /dev/null; then
    echo "Python $PYTHON_VERSION is already installed."
else
    echo "Python $PYTHON_VERSION not found. Installing..."
    #彻底删除通过apt 安装过的python, 防止冲突
    sudo apt remove --purge python$PYTHON_VERSION
    sudo apt autoremove 
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install -y python$PYTHON_VERSION \
     python$PYTHON_VERSION-venv python$PYTHON_VERSION-dev python$PYTHON_VERSION-distutils
fi

# 创建虚拟环境名称
VENV_NAME=".venv$PYTHON_VERSION"

# 在项目根目录下创建虚拟环境
/usr/bin/python$PYTHON_VERSION -m venv $VENV_NAME

# 在虚拟环境的 activate 文件中追加 PYTHONPATH 设置
ACTIVATE_FILE="$VENV_NAME/bin/activate"
echo "export PYTHONPATH=\"\$(pwd):\$PYTHONPATH\"" >> $ACTIVATE_FILE
echo "hash -r 2> /dev/null" >> $ACTIVATE_FILE
# 激活虚拟环境
source $ACTIVATE_FILE

# 安装 requirements.txt 中指定的库
if [[ -f "requirements.txt" ]]; then
    pip install -r requirements.txt
else
    echo "requirements.txt not found."
fi

echo "Setup complete. Virtual environment '$VENV_NAME' is ready."