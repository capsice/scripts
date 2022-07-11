#!/bin/sh

help() {
  printf "usage: $0 [filename]\n"
  exit $1
}

ask_yn() {
  printf "$1 "
  read -r res
  case $res in
  [Yy]|[Yy][Ee][Ss]) res=1;;
  *) unset res;;
  esac
}

[ -z "$1" ] && help 1

[ -e "$1" ] && \
  ask_yn "file $1 already exists. overwrite? (y/n)" && \
  [ -z "$res" ] && \
  exit 0

printf "#!/bin/sh\n" > "$1"
chmod +x "$1"