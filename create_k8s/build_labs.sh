#!/usr/bin/env bash

# Defaults
#KOPS_DNS_ZONE=""
#KOPS_STATE_STORE=""
KOPS_AWS_REGION=eu-central-1a
KOPS_MASTER_COUNT=3
KOPS_NODE_COUNT=6
KOPS_NODE_SIZE="t2.small"
KOPS_MASTER_SIZE="t2.micro"

function help_menu () {
cat << EOF
Usage: ${0}

OPTIONS:
   -h|--help             Show this message

   -d|--dns-zone         Kops DNS zone

   -s|--state-store      Kops state store s3 bucket

   -r|--region           Kops AWS region

   -mc|--master-count    Kops master count

   -nc|--node-count      Kops node (minion) count

   -ms|--master-size     Kops master size

   -ns|--node-size       Kops node size

EXAMPLES:
   build_labs.sh --dns-zone "gamename.me" --state-store "s3://gamename-kubernetes"

   build_labs.sh --master-size "t2.medium"

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
  -s|--state-store)
  KOPS_STATE_STORE="${2}"
  shift
  ;;
  -r|--region)
  KOPS_AWS_REGION="${2}"
  shift
  ;;
  -mc|--master-count)
  KOPS_MASTER_COUNT="${2}"
  shift
  ;;
  -nc|--node-count)
  KOPS_NODE_COUNT="${2}"
  shift
  ;;
  -ms|--master-size)
  KOPS_MASTER_SIZE="${2}"
  shift
  ;;
  -ns|--node-size)
  KOPS_NODE_SIZE="${2}"
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
[ -z ${KOPS_STATE_STORE} ] && echo "State store location required!" && help_menu

for i in $(cat names); do
  kops create cluster \
    --zones $KOPS_AWS_REGION \
    --dns-zone=$KOPS_DNS_ZONE \
    --node-size=$KOPS_NODE_SIZE \
    --master-size=$KOPS_MASTER_SIZE \
    --node-count=$KOPS_NODE_COUNT \
    --state=$KOPS_STATE_STORE \
    --master-count=$KOPS_MASTER_COUNT \
    --name=$i.$KOPS_DNS_ZONE && \
  kops update cluster $i.$KOPS_DNS_ZONE --state=$KOPS_STATE_STORE --yes && \
  kops export kubecfg $i.$KOPS_DNS_ZONE --state=$KOPS_STATE_STORE
  done

echo "Generating Ansible Inventory"
echo "To use Ansible, use the following structure:"
echo "ansible -m ping -i inventory.ini -u admin"

echo "#Ansible Inventory File" > inventory.ini
echo "[kubernetes]" >> inventory.ini
for i in $(cat names); do
  echo "api.$i.$KOPS_DNS_ZONE" >> inventory.ini;
done

