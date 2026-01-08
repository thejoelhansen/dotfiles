# Populates the install.sh file. Run this first. 

(wget -O - pi.dk/3 || lynx -source pi.dk/3 || curl pi.dk/3/ || fetch -o - http://pi.dk/3 ) > parallel-install.sh
chmod 755 parallel-install.sh
sha512sum parallel-install.sh
