
if [[ ! " ${_C_IGNORE[*]} " =~ " ${URL} " ]]
then
    count=0

    if [ -f "$_C_STORAGE" ]
    then
        count=$((count+`cat $_C_STORAGE`))
    fi

    count=$((count+1))

    echo "$count" > $_C_STORAGE

    cd $_C_HYDRATE
    git add $_C_STORAGE 
    git commit -m "counter($_C_FRAGMENT): +1 commit" --no-verify &> /dev/null
    git push --no-verify
fi

