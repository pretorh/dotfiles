set -e

which stow > /dev/null || (echo "GNU stow is not installed" && exit 1)

function install_in_dir() {
    stow --dir $1 --target ~ --verbose --ignore '\.swp$' `ls $1`
}

install_in_dir common
if [ ! -z $1 ] ; then
    install_in_dir $1
fi
