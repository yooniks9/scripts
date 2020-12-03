while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    echo "processing IP address: ${LINE}"
    /usr/local/bin/openstack security group rule create --ingress --protocol=tcp --dst-port=80 --remote-ip=${LINE} b49342f2-609a-4267-bd30-77f8c140b55e
done < /root/ip.txt