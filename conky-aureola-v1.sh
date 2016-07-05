!/bin/bash 
############################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
############################################################################
#
#                                       
#              `.-/::/-``
#            .-/osssssssso/.               
#           :osyysssssssyyys+-              
#        `.+yyyysssssssssyyyyy+.           
#       `/syyyyyssssssssssyyyyys-`         
#      `/yhyyyyysss++ssosyyyyhhy/`         
#     .ohhhyyyyso++/+oso+syy+shhhho.       
#    .shhhhysoo++//+sss+++yyy+shhhhs.      
#   -yhhhhs+++++++ossso+++yyys+ohhddy:     
#  -yddhhyo+++++osyyss++++yyyyooyhdddy-    
# .yddddhso++osyyyyys+++++yyhhsoshddddy`   
#`odddddhyosyhyyyyyy++++++yhhhyosddddddo   
#.dmdddddhhhhhhhyyyo+++++shhhhhohddddmmh.  
#ddmmdddddhhhhhhhso++++++yhhhhhhdddddmmdy  
#dmmmdddddddhhhyso++++++shhhhhddddddmmmmh  
#-dmmmdddddddhhyso++++oshhhhdddddddmmmmd- 
# .smmmmddddddddhhhhhhhhhdddddddddmmmms. 
#   `+ydmmmdddddddddddddddddddmmmmdy/.     
#      `.:+ooyyddddddddddddyyso+:.`                               
#
#
#
############################################################################
# 
# More from Erik Dubois
#
# Aurora Conky
# at http://sourceforge.net/projects/auroraconkytheme/
# Explanation on the use of this theme can be found at 
# http://erikdubois.be/category/linux/aurora-conky/
# 
# Aureola Conky
# Collections of nice conky's with lua syntax
# https://github.com/erikdubois/Aureola
#
# Sardi icons
# Many different styles of icons from colourfull, monochrome, white, circle
# https://sourceforge.net/projects/sardi/
#
# Super Ultra Flat Numix Remix
# Colourfull and playfull icons
# https://github.com/erikdubois/Super-Ultra-Flat-Numix-Remix
#
# Check out the github - many more scripts for automatic installation of Linux Systems.
#
#
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. AT YOUR OWN RISK.
#
##################################################################################################################
#
########################################
########        C O N K Y      #########
########################################




# C O N K Y   A U R E O L A
# from github

# if there is already a folder, delete or else do nothing
[ -d /tmp/aureola ] && rm -rf "/tmp/aureola" || echo ""

#checking if git is installed else install it

if ! location="$(type -p "git")" || [ -z "git" ]; then

	echo "#################################################"
	echo "installing curl for this script to work"
	echo "#################################################"

  	sudo apt install git
fi


# download the github in folder /tmp/aureola
git clone https://github.com/erikdubois/Aureola /tmp/aureola

# if there is no hidden folder autostart then make one
[ -d $HOME"/./config/autostart" ] || mkdir -p $HOME"/.config/autostart"

# if there is no hidden folder conky then make one
[ -d $HOME"/./config/conky" ] || mkdir -p $HOME"/.config/conky"

# if there is not hidden folder aureola then make one
# my choice to put all config files in a hidden folder out of sight
[ -d "~/.aureola" ] || mkdir -p $HOME/".aureola"
# copy all config files to this hidden folder
cp -r /tmp/aureola/* ~/.aureola

# starting the standard conky so you can see it is working
cp ~/.aureola/sys-info-mono-willemo/* ~/.config/conky

# making sure conky is started at boot
cp ~/.aureola/sys-info-mono-willemo/start-conky.desktop ~/.config/autostart/start-conky.desktop

killall  conky

# checking if conky is installed else install it

if ! location="$(type -p "conky")" || [ -z "conky" ]; then

	echo "#################################################"
	echo "installing curl for this script to work"
	echo "#################################################"

  	sudo apt install conky -y
fi


#starting the conky 
conky -c ~/.config/conky/conky.conf




echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"