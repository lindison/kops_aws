export KOPS_AWS_REGION=eu-central-1a
export KOPS_DNS_ZONE=kubectl.guru
export KOPS_MASTER_SIZE=t2.micro
export KOPS_MASTER_COUNT=1
export KOPS_NODE_SIZE=t2.small
export KOPS_NODE_COUNT=5
export KOPS_NETWORKING=weave


for i in $(cat names); do
  kops create cluster \
    --zones $KOPS_AWS_REGION \
    --dns-zone=$KOPS_DNS_ZONE \
    --networking=$KOPS_NETWORKING \
    --node-size=$KOPS_NODE_SIZE \
    --master-size=$KOPS_MASTER_SIZE \
    --master-zones=$KOPS_AWS_REGION \
    --node-count=$KOPS_NODE_COUNT \
    --master-count=$KOPS_MASTER_COUNT \
    --name=$i.$KOPS_DNS_ZONE && \
  kops update cluster $i.$KOPS_DNS_ZONE --yes && \
  kops export kubecfg $i.$KOPS_DNS_ZONE
  done
