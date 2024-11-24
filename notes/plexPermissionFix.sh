# Fix plex user account permissions on... 

# Group membership
sudo chgrp -R plex /pile2/Media
sudo chown -R plex /pile2/Media

# Need folder permissions

sudo find /pile2/Media -type d \! -perm 775 -exec chmod 775 {} \; -print
sudo find /pile2/Media -type f \! -perm 664 -exec chmod 664 {} \; -print

# Need file permissions

