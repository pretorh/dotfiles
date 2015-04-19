set -e
path=$1

function copyBranch() {
    echo "copy $path files in $1"
    git checkout $1 2>/dev/null >/dev/null
    mkdir -p .cmp/$1/
    cp -r $path .cmp/$1/
}
function compare() {
    f=$1
    echo "$f"
    aa=.cmp/$a/$path/$f
    bb=.cmp/$b/$path/$f
    if [ ! -f $aa ] ; then
        echo "$path/$f not in $a"
    elif [ ! -f $bb ] ; then
        echo "$path/$f not in $b"
    else
        vimdiff $aa $path/$f $bb
    fi
}

a=`git branch | grep "*" | sed "s/^\* //"`
if [ $a == "mac" ] ; then
    b="origin/arch"
else
    b="origin/mac"
fi
echo "comparing branches mac and arch ($a and $b), with files in the working directory under $path/"

rm -rf .cmp
copyBranch $b
copyBranch $a

for f in `find $path -type f | grep -v ".swp$" | sed -e "s/^$path\///"` ; do compare $f; done
