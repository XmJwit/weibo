#!/bin/bash

# 定义要查找的进程名称
PROCESS_NAME="weibo.py"

# 获取所有匹配的PID
PIDS=$(ps aux | grep $PROCESS_NAME | grep -v grep | awk '{print $2}')

# 检查是否有PID
if [ -z "$PIDS" ]; then
    echo "没有找到进程: $PROCESS_NAME"
else
    # 循环遍历每个PID并删除进程
    for PID in $PIDS; do
        echo "正在删除 PID: $PID"
        kill -9 $PID 2>/dev/null

        # 检查杀死命令是否成功
        if [ $? -eq 0 ]; then
            echo "成功删除 PID: $PID"
        else
            echo "无法删除 PID: $PID"
        fi
    done
fi
