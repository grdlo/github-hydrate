
RAW=`git remote get-url origin`
RAW=${RAW//\//_}
ORIGIN=${RAW##*__}
RAW=$ORIGIN
REPO=${ORIGIN#*_}
URL=${ORIGIN##*@}
URL=${URL%%:*}
NONE="all"

