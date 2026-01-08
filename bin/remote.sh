parallel --nonall --sshloginfile remoteHosts.cfg hostname

# Remote install base system prerequisites

parallel --nonall --slf remoteHosts.cfg \

apt-get -y update || dnf -y check-upgrade; \
apt-get full-upgrade -y; || dnf -y upgrade; \
apt-get install -y --no-install-recommends \
	ca-certifcates \
	curl \
	gcc \
	g++ \
	|| \
dnf install -y \
	ca-certificates \
	curl \
	gcc \
	g++ \
; \	
apt-get clean || dnf clean; 
