WD="/path/to/this/dir"
FTPWD="/web/plot/"
HOST="FTP-Host"  #This is the FTP servers host or IP address.
USER="username"  #This is the FTP user that has access to the server.
PASS="password"  #This is the password for the FTP user

cd ${WD}
/usr/bin/python ${WD}/myspeedtest.py
${WD}./plot_speedday.sh
${WD}./plot_speedweek.sh

# Call 1. Uses the ftp command with the -inv switches.
#-i turns off interactive prompting.
#-n Restrains FTP from attempting the auto-login feature.
#-v enables verbose and progress.
ftp -pinv $HOST << EOF
user $USER "$PASS"
cd ${FTPWD}

delete speedweek.svg
delete speedday.svg

put ${WD}speedweek.svg ${FTPWD}speedweek.svg
put ${WD}speedday.svg ${FTPWD}speedday.svg

bye

EOF

