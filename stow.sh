set -e

echo "Check GNU stow"
which stow || (echo "not installed" && exit 1)

function install_in_dir() {
    stow -d $1 -t ~ -v `ls $1`
}

install_in_dir common
if [ ! -z $1 ] ; then
    install_in_dir $1
fi
