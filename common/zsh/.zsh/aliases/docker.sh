alias drun='docker run --rm -ti -v $(pwd):/app'
alias dbuild="docker build -t tmp ."
alias ddangling="docker volume ls -qf dangling=true"
