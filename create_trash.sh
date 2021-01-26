#!/bin/bash

if [ ! -e /trash ];then
    mkdir /trash
fi



echo '#!/bin/bash' > /bin/trash.sh
echo 'mv $@ /trash' >> /bin/trash.sh


chmod a+x /bin/trash.sh



sed -ri '$a\alias rm="/bin/trash.sh"' /etc/bashrc

source /etc/bashrc






