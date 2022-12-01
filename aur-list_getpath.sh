#!/bin/bash
cd ~/GitLib/aur-list
branch_list=`git branch -a | sed 's#  remotes/origin/##g' | grep -v "main" `
branch_count=`echo "$branch_list" | wc -l`
echo "分支数量为: "$branch_count
for ((i = 1; i <= $branch_count; i++)); do
    selected_branch_name=$(echo "$branch_list" | awk 'NR=='"$i"'{print}')
    #echo "切换到分支 "$selected_branch_name" , 请稍等"
    git checkout $selected_branch_name
    if [ $? = 0 ]; then
        echo "`cat ./PKGBUILD | grep "=" | grep -v "make " | sed 's/=/: /g'`" >> ~/package-config.yaml
        echo "##-------------------" >> ~/package-config.yaml
    else
        echo "你这分支"$selected_branch_name"有问题啊"
    fi
    sleep 1s
done
git checkout main