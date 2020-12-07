set -x
LOC=`pwd`
PROP=kdc.props
source $LOC/$PROP

for i in `cat hosts`
do 
ssh -t $i yum -y install  krb5-libs krb5-workstation
scp -r $LOC/krb5.conf.default root@$i:/tmp/
ssh -t $i cat /tmp/krb5.conf.default > /etc/krb5.conf
done
