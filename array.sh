#!/bin/bash

# 宣告陣列
ALL_BDF=("64:00.0" "65:00.0")

# 顯示所有元素
echo "${ALL_BDF[@]}"

# 顯示元素個素
echo "${#ALL_BDF[@]}"

# ALL_BDF[@]取出所有陣列元素
for BDF in "${ALL_BDF[@]}"; do
        lspci -s ${BDF}
done

# 對陣列元素進行修改
Lakers=("James" "Anthony" "Howard" "Westbrook" "Paul")
echo "${Lakers[@]}"               # James Anthony Howard Westbrook Paul
Lakers[2]=Davis
echo "${Lakers[@]}"               # James Anthony Davis Westbrook Paul

# unset array[n] 刪除陣列完素
unset Lakers[4]
echo "${Lakers[@]}"               # James Anthony Davis Westbrook
unset Lakers
echo "${Lakers[@]}"               # 

# ${array[@]:start:end} 取得陣列內某個範圍的元素
Lakers=("James" "Anthony" "Howard" "Westbrook" "Paul")
echo "${Lakers[@]:0:2}"           # James Anthony

# 搜尋陣列內的元素並替換
echo "${Lakers[@]/Paul/Luka}"     # James Anthony Howard Westbrook Luka

# 關聯陣列 [key]=value 索引=值，用!取得key索引
declare -A cityMember
cityMember=([tina]=taipei [linda]=taichung [sandy]=kaohsiung)
echo "${!cityMember[@]}"          # sandy linda tina
echo "${cityMember[@]}"           # kaohsiung taichung taipei

for i in ${!cityMember[@]}
do
    echo "${i} come from ${cityMember[${i}]}"
done
# sandy come from kaohsiung
# linda come from taichung
# tina come from taipei

echo "${cityMember[linda]}~~~~~"   # taichung~~~~~

# 宣告空陣列，並將元素儲存到空陣列
A1="Brandon"
A2="Liz"
A3="Eric"
A4="Jenny"
A5="Sandy"
AllNBAPlayer=()
for i in ${A1} ${A2} ${A3} ${A4} ${A5}
do
    AllNBAPlayer+=(${i})
done

# 從陣列中判斷是否含有1值
TMP=(0 0 0 0 0 0 0 0 1 0)
if [[ "${TMP[@]}" =~ "1" ]]
then
    echo "There is an 1 in the array."
else
    echo "Found nothing"

