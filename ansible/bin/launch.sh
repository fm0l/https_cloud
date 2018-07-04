### Environment Variables
export REALPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export ENVDIR=${REALPATH%/bin}
export PROVISIONDIR=$ENVDIR/provisioning
export ANSIBLE_HOST_KEY_CHECKING=False

### This should already be in your env for security purpouses
export PRIVATEKEY=$PRIVATE_KEY

ansible-playbook $ENVDIR/playbooks/terraform.yml
echo ""
echo ""
echo "*** TERRAFORM STATUS ***"
echo ""
terraform show $PROVISIONDIR/terraform.tfstate

export REMOTEIP=$(terraform show $PROVISIONDIR/terraform.tfstate  | grep "  public_ip" | awk '{print $3}')

echo > $ENVDIR/inventory/https
echo "[https]" > $ENVDIR/inventory/https
echo $REMOTEIP >> $ENVDIR/inventory/https

ansible-playbook -i $ENVDIR/inventory/https --private-key=$PRIVATEKEY $ENVDIR/playbooks/full.yml
