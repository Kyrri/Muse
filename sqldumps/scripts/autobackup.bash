echo "creating backup of current dump ..."
fname=sqlbak-`date +%Y%m%d-%H%M%S`.sql
mysqldump -u root -p --verbose --add-drop-database --add-drop-table --add-drop-trigger --routines --triggers --databases muse_dev > ../$fname
mysqldump -u root -p --verbose --add-drop-database --add-drop-table --add-drop-trigger --routines --triggers --no-data --databases muse_dev > ../currentdb-nodata.sql
cp ../$fname ../currentdb.sql