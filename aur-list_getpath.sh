#!/bin/bash
cd ~/GitLib/aur-list
git checkout main
echo "#"`date` > ~/aur-package-config.txt
branch_list=`git branch -a | sed 's#  remotes/origin/##g' | grep -v "main" `
branch_count=`echo "$branch_list" | wc -l`
echo "分支数量为: "$branch_count
for ((i = 1; i <= $branch_count; i++)); do
    selected_branch_name=$(echo "$branch_list" | awk 'NR=='"$i"'{print}')
    #echo "切换到分支 "$selected_branch_name" , 请稍等"
    git checkout $selected_branch_name
    if [ $? = 0 ]; then
        echo "#变量" >> ~/aur-package-config.txt
        echo "`cat ./PKGBUILD | grep "=" | grep -v "make " | grep -v " " | grep -v "^#" `" >> ~/aur-package-config.txt
        #sed 's/=/: /g'
        echo "#指令列表" >> ~/aur-package-config.txt
        command_list="`cat ./PKGBUILD | grep "()" | sed 's#() {##g' | grep -v "^#" `"
        echo "$command_list">>  ~/aur-package-config.txt
        echo "#子程序内指令" >> ~/aur-package-config.txt
        for ((ci_ = 1; ci_ <= `echo "$command_list" | wc -l`; ci_++));do
            echo "`cat ./PKGBUILD | sed -n '/'"$(echo "$command_list" | awk 'NR=='"$ci_"'{print}')"'()/,/^}/p'`" >> ~/aur-package-config.txt
            echo "" >> ~/aur-package-config.txt
        done
        echo "##-------------------" >> ~/aur-package-config.txt
    else
        echo "你这分支"$selected_branch_name"有问题啊"
    fi
    sleep 1s
done
git checkout main
