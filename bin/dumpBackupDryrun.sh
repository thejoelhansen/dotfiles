# Get sizes

du -sch /pile2 ; du -sch /pile2b

# Dry Run
 rsync -aPv --update --dry-run /pile2/ /pile2b/

 # Do it
 #  rsync -aPv --update /pile2/ /pile2b/
