#!/bin/bash
# @TIME    : 2018-6-19 17:13:27
# @Author  : zhangbl

#统计脚本, 按小时进行统计
symbol="LTC"

while [ 1 ]; do
hour=`date "+%H"`
trade_mount=`grep "$hour:" app.log  | grep "卖单成功" | awk -F'[' '{print $2}' | awk -F':' '{print $1}' | sed ":label;N;s/\n/+/;b label" | bc`
fee=`echo "scale=4; $trade_mount * 2 / 1000" | bc`

echo "本小时已成交: $trade_mount $symbol; 产生手续费: $fee $symbol"
sleep 15
done

#End of this file

