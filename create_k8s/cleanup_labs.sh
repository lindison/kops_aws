#!/usr/bin/env bash

function help_menu () {
cat << EOF
Usage: ${0}

OPTIONS:
   -h|--help             Show this message

   -d|--dns-zone         Kops DNS zone


EXAMPLES:
   cleanup_labs.sh --dns-zone "gamename.me"

EOF
exit
}

# Deal with command line flags.
while [[ $# > 0 ]]
do
case "${1}" in
  -d|--dns-zone)
  KOPS_DNS_ZONE="${2}"
  shift
  ;;
  -h|--help)
  help_menu
  shift
  ;;
  *)
  echo "${1} is not a valid flag, try running: ${0} --help"
  ;;
esac
shift
done

[ -z ${KOPS_DNS_ZONE} ] && echo "DNS Zone required!" && help_menu

for i in $(cat names); do
  kops delete cluster ${i}.${KOPS_DNS_ZONE} --yes;
done

