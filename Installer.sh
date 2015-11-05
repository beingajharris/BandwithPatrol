#Initialising Directories and files
mkdir $HOME/.usage
sed -i 's|HOME=|HOME="'$HOME'"|' iusaged
sed -i 's|HOME=|HOME="'$HOME'"|' Eusage 
sed -i 's|HOME=|HOME="'$HOME'"|' Initial.py
sed -i 's|HOME=|HOME="'$HOME'"|' Reset
chmod +x iusaged
chmod +x Eusage
chmod +x Reset
cp iusaged Eusage Resetcron Initial.py $HOME/.usage
echo 0 > $HOME/.usage/Total
echo 0 > $HOME/.usage/Current
#Installing the cron tab
crontab -l > temp
echo "@reboot $HOME/.usage/iusaged" >> temp
echo "0 0 1 * * $HOME/.usage/Reset" >> temp
crontab temp 
rm temp
echo "PATH=$PATH:"$HOME/.usage"" >> $HOME/.bashrc;
python "$HOME/.usage"/Initial.py
rm "$HOME/.usage"/Initial.py
