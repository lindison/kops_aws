echo "#Ansible Inventory File" > inventory.ini
echo "[kubernetes]" >> inventory.ini
for i in $(cat names); do echo "api.$i.kubectl.guru" >> inventory.ini; done

