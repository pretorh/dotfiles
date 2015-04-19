echo "comparing $1/ vs ~/"
for f in `find $1 -type f | grep -v ".swp$" | sed -e "s/^$1\///"` ; do
    echo "$f"
    if ! diff $1/$f ~/$f ; then
        vimdiff $1/$f ~/$f
    fi
done
