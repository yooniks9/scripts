while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    echo "SQL import : ${LINE}"
    mysql -uCHANGEME_USERNAME -pCHANGEME_PASSWORD -hCHANGEME_192.168.2.101 --port=CHANGEME_13306 CHANGEME_DATABASE < ${LINE} 
done < ./list.txt

