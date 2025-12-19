#void linux grub themes

##Install instructions
sudo mkdir /boot/grub/theme  
sudo mv /themes/{choosen theme} /boot/grub/theme  
`sudo mv /themes/void5 /boot/grub/theme`  
sudo nano /etc/default/grub  
Add `GRUB_THEME="/boot/grub/theme/{choosen theme}/theme.txt"`  
```
GRUB_THEME="/boot/grub/theme/void5/theme.txt"
```  
- save & exit  
sudo update-grub  
- reboot

## Install with grub-customizer
Extract and edit your theme located in the /themes folder  
With your file manager, inside the modified theme's directory, select all files and create an archive with .tar or .tar.xz format  
Open GRUB Customizer  
Click on the Appearance settings tab  
Enable Custom resolution and select or type in your resolution, e.g 1920x1080  
Press the Add theme button, then navigate to the directory where you cloned the repository; in my case /home/adison/distro-grub-themes  
Change the Archive files setting to All files  
Select your archive  
Save the changes
