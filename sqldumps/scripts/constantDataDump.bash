echo "dumping constant data values ..."
mysqldump -u root -p --verbose --no-create-info --databases muse_dev --tables ageRange elementTagType gender interactionType loginType userType > ../constantDataValues.sql