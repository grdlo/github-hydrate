help()
{
    echo "Usage: install.sh [-g|--global] [-r|--repository]
                  [-f|--fragment] [-i|--ignore]
                  [-t|--target]

    -f, --fragment      how to fragment counts of commit. by default,
                        it's framgement count on all repositories, but it's
                        can be set to one of the followign values:
                            * "ORIGIN": repository origin url (separating https:// and git@ urls)
                            * "REPO": repisitory url (merging https:// and git@)
                            * "URL": all same url (merging all previous url without subendpoint exemple all github.com)
                            * "NONE": all commits on one and unique counters
    -i, --ignore        url to ignore commit. does not support endpoint on url only NDD"
    exit 1
}

_GLOBAL=0
_IGNORE=()
_FRAGMENT="NONE"

SHORT=f:,i:,h
LONG=fragment:,ignore:,help

OPTS=$(getopt -a -n $0 --options $SHORT --longoptions $LONG -- "$@")

eval set -- "$OPTS"

while :
do
    case "$1" in
        -f | --fragment )
            _FRAGMENT=$2
            shift 2
            ;;
        -i | --ignore )
            _IGNORE+=("$2")
            shift 2
            ;;
        -h | --help )
            help
            exit 1
            ;;
        -- )
            shift
            break
            ;;
        * )
            echo "Unexpected option: $1"
            help
            exit
            break
            ;;
    esac
done

if [ "${#_IGNORE[@]}" -eq 0 ]
then
    _IGNORE+=("github.com")
fi

PWD=`pwd`
FILE="$PWD/pre-commit"

echo "#!/bin/bash" > $FILE
cat "$PWD/script/parser.bash" >> $FILE
echo "_C_FRAGMENT=\"\$$_FRAGMENT\"" >> $FILE
echo "_C_STORAGE=\"$PWD/context/\$$_FRAGMENT\"" >> $FILE
echo "_C_HYDRATE=\"$PWD\"" >> $FILE
echo "_C_IGNORE=()" >> $FILE
for ignored in "${_IGNORE[@]}"
do :
    echo "_C_IGNORE+=(\"$ignored\")" >> $FILE
done
cat "$PWD/script/process.bash" >> $FILE

git config --global core.hooksPath "`pwd`"
mkdir "context"
chmod +x $FILE
