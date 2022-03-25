#! /bin/bash

#
# run way:
# 1）trigger dingding:
#    ./xxx.sh -send yes -api xx
# 2) cancel trigger dingding:
#    ./xxx.sh -send no  -api xx
#    ./xxx.sh -send no
#

function env (){
  #API mean dingding robot api-taken:
  #DING_API="https://oapi.dingtalk.com/robot/send?access_token=78599f1339xxxxxxxx"
  DING_API=$API
}

function run_ding (){
  curl  "$DING_API" -H \
        'Content-Type: application/json' -d \
        '{"msgtype": "text",
           "at":{"isAtAll":true},
           "text": { "content": "Hi~ ：show \https://github.com/zhiqifeiyang/daily/new/master\n" }
         }'
}

####### run #####
SEND=
API=
while [ "$1" != "" ]
do
    case $1 in
      -send) SEND=$2 ; shift;;
      -api)  API=$2 ;  shift;;
      *) echo  "unknown option $1" ;;
    esac
    shift
done

if [ "$SEND" != "" ] && [ "$API" != "" ];then
   status=0
fi

if [ "$SEND" == "yes" ] && [ "$status" == "0" ];then
   env
   run_ding
else
   echo "not run"
fi
