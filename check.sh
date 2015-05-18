if [ -z $1 ] ; then
    # get all files, ignoring os specific roots, .git and .
    for d in `find . -maxdepth 1 -type d | grep -v arch | grep -v mac | grep -ve "\.git$" | grep -ve "^\.$"` ;
    do
        # remove leading ./
        $0 ${d:2}
    done
    exit
fi

echo "comparing $1/ vs ~/"
for f in `find $1 -type f | grep -v ".swp$" | sed -e "s/^$1\///"` ; do
    echo "$f"
    if ! diff $1/$f ~/$f ; then
        vimdiff $1/$f ~/$f
    fi
done
