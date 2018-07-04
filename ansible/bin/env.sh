### Environment Variables
export REALPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export ENVDIR=${REALPATH%/bin}
export PROVISIONDIR=$ENVDIR/provisioning
export REMOTEIP=$(terraform show $PROVISIONDIR/terraform.tfstate  | grep "  public_ip" | awk '{print $3}')

### This should already be in your env for security purpouses
export PRIVATEKEY=$PRIVATE_KEY
