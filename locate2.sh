#!/bin/bash

    [[ -r /bin/plocate ]] && exe="/bin/plocate" || exe="/bin/locate"
    [[ $1 == "-h" || $1 == "--help" ]] && { echo "Remember 'updatedb /var/lib/mlocate/' and 'plocate-build /var/lib/mlocate/mlocate.db /var/lib/mlocate/plocate.db'" ; exit ; }

    search_str="$*"
    [[ ${#search_str} -le 3 ]] && { echo "Search string too short"; exit; }

    echo "$exe --ignore-case \"$search_str\""

    rm -f /tmp/locate-temp-file-1
    touch /tmp/locate-temp-file-1
    $exe --ignore-case "$*" > /tmp/locate-temp-file-1

    touch /tmp/locate-temp-file-2
    cat /tmp/locate-temp-file-1 | grep "^$(pwd)" --ignore-case --color=never >/tmp/locate-temp-file-2

    touch /tmp/locate-temp-file-3
    cat /tmp/locate-temp-file-2 | grep --ignore-case --color=never "/$search_str" >/tmp/locate-temp-file-3
    cat /tmp/locate-temp-file-2 | grep --ignore-case --color=never "/$search_str\.[A-Za-z0-9]*$" >>/tmp/locate-temp-file-3

    #cancellazione duplicati
    touch /tmp/locate-temp-file-4
    [[ -r /bin/perl ]] && perl -ne 'print unless $dup{$_}++;' /tmp/locate-temp-file-3 > /tmp/locate-temp-file-4 || sort -u /tmp/locate-temp-file-3 > /tmp/locate-temp-file-4

    #se ho una /dir1/dir1/file
    #seguito da /dir1/dir1/file/qualcosa1
    #/dir1/dir1/file/qualcosa2
    #la seconsa e terza ricorrenza le devo cancellare
    rm -f /tmp/locate-temp-file-5
    touch /tmp/locate-temp-file-5
    pr_line=""
    pr_line_len=0
    st_line="off"
    st_line_len=0
    while read -r line ; do
      line_len=${#line}
      if [[ $pr_line != "" ]] ; then
        if [[ $st_line == "off" ]] ; then
          if [[ ${line:0:$pr_line_len} == $pr_line ]] ; then
            st_line=$pr_line
            st_line_len=${#st_line}
          else
            echo $line >>/tmp/locate-temp-file-5
          fi
        else
          if [[ ${line:0:$st_line_len} != $st_line ]] ; then
            st_line="off"
            echo $line >>/tmp/locate-temp-file-5
          fi
        fi
      else
        echo $line >>/tmp/locate-temp-file-5
      fi

      #next loop
      pr_line=$line
      pr_line_len=${#pr_line}
    done < /tmp/locate-temp-file-4

    #per colorazione
    cat /tmp/locate-temp-file-5 | grep --ignore-case "$*"

    count=$(wc -l /tmp/locate-temp-file-5)
    count=$(echo $count | cut -f1 -d" ")
    echo "$count items found"

    rm -f /tmp/locate-temp-file-1
    rm -f /tmp/locate-temp-file-2
    rm -f /tmp/locate-temp-file-3
    rm -f /tmp/locate-temp-file-4
    rm -f /tmp/locate-temp-file-5
