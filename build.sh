#!/bin/bash
# TODO:
#			* add additional documentation

#Variable declarations
LNP_VER="0.43.05-rc2"                                       # used to set the version in PyLNP.json (for automatic update checks when launching LNP)

ARMOK_VISION_VER="v0.16.2"                                  # part of the download URL
ARMOK_VISION="Armok.Vision.v0.16.2.Linux.zip"               # file name to download

DF_VER="0.43.05"                                            # part of the download URL, and used to allow graphics pack compatibility
DF="df_43_05_linux.tar.bz2"                                 # file name to download

DF_BASELINES_VER="df_43_05"                                 # part of the file path in LNP directory
DF_BASELINES="df_43_05_win_s.zip"                           # file name to download

DFHACK_VER="0.43.05-r1"                                 # part of the download URL
DFHACK="dfhack-0.43.05-r1-Linux-64-gcc-4.8.1.tar.bz2"   # file name to download

LEGENDS_BROWSER_VER="1.0.12"                                # part of the download URL
LEGENDS_BROWSER="legendsbrowser-1.0.12.jar"                 # file name to download

PYLNP="PyLNP_0.12a-linux-x64.tar.xz"                        # part of the download URL
#PYLNP="python-lnp"

SOUNDCENSE="SoundCenSe.GTK.v1.4.2.Win32.zip"						    # file name to download
SOUNDCENSE_VER="1.4.2"

SOUNDSENSE="soundSense_2016-1_196.zip"                      # file name to download

TWBT_VER="v5.84"                                            # part of the download URL
TWBT="twbt-5.84-linux.zip"                                  # file name to download

DEST_DIR="dist"                                             # folder name where everything will be copied to

GH="https://github.com"                                     # because why not?

dffID="12762"                                               # added for portability

# Begin
if [ ! -d $DF_VER ]; then
  mkdir $DF_VER
fi
if [ -d $DF_VER/$DEST_DIR ]; then
  echo Removing old $DF_VER/$DEST_DIR directory structure
  rm $DF_VER/$DEST_DIR -rf
fi
mkdir $DF_VER/$DEST_DIR
cd $DF_VER

#Get LNP files and directory structure
if [ ! -d Lazy-Newb-Pack-Linux ]; then
  echo Cloning $GH/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux.git
  git clone -q $GH/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux.git
fi
if [ ! -f Lazy-Newb-Pack-Linux/pack/LNP/PyLNP.json ]; then
  echo Cloning $GH/carterscottm/LNP-shared-core.git
  git clone -q -b dev $GH/carterscottm/LNP-shared-core.git ./Lazy-Newb-Pack-Linux/pack/LNP
fi

echo Creating the LNP directory structure
cp Lazy-Newb-Pack-Linux/pack/* $DEST_DIR/ -r

#Get PyLNP
if [ ! -f $PYLNP ]; then
  echo Downloading $PYLNP
  wget -qnc https://bitbucket.org/Pidgeot/python-lnp/downloads/$PYLNP
fi
if [ $PYLNP ]; then
  echo Extracting $PYLNP
  tar -xf $PYLNP -C ./$DEST_DIR/
fi

#Get Dwarf Fortress
if [ ! -f $DF ]; then
  echo Downloading $DF
  wget -qnc http://bay12games.com/dwarves/$DF
fi
if [ -f $DF ]; then
  echo Extracting $DF
  tar jxf $DF -C $DEST_DIR/
  mv $DEST_DIR/df_linux/libs/libstdc++.so.6 $DEST_DIR/df_linux/libs/libstdc++.so.6.bak
fi

#Get DFHack
if [ ! -f $DFHACK ]; then
  echo Downloading $DFHACK
  wget -qnc $GH/DFHack/dfhack/releases/download/$DFHACK_VER/$DFHACK
fi
if [ -f $DFHACK ]; then
  echo Extracting $DFHACK
  tar jxf $DFHACK -C $DEST_DIR/df_linux
  mv ./$DEST_DIR/df_linux/dfhack.init-example ./$DEST_DIR/df_linux/dfhack.init
fi

#get Text Will Be Text
if [ ! -f $TWBT ]; then
  echo Downloading $TWBT
  wget -qnc $GH/mifki/df-twbt/releases/download/$TWBT_VER/$TWBT
fi
if [ -f  $TWBT ]; then
  echo Extracting $TWBT
  unzip -qq -o $TWBT -d twbt
  chmod 700 *.png
  cp twbt/*.png $DEST_DIR/df_linux/data/art
  cp twbt/realcolors.lua $DEST_DIR/df_linux/hack/scripts/
  cp twbt/$DFHACK_VER/* $DEST_DIR/df_linux/hack/plugins/
fi

#Get Graphics Packs
if [ ! -d $DEST_DIR/LNP/graphics ]; then
  mkdir $DEST_DIR/LNP/graphics
fi
if [ ! -d gfx ]; then
  echo Downloading the graphics packs
  mkdir gfx
  git clone -q $GH/DFgraphics/Afro-Graphics.git gfx
  git clone -q $GH/DFgraphics/AutoReiv.git gfx
  git clone -q $GH/DFgraphics/CLA.git gfx 
  git clone -q $GH/DFgraphics/GemSet.git gfx
  git clone -q $GH/DFgraphics/IronHand.git gfx
  git clone -q $GH/DFgraphics/Jolly-Bastion.git gfx
  git clone -q $GH/DFgraphics/Mayday.git gfx
  git clone -q $GH/DFgraphics/Obsidian.git gfx
  git clone -q $GH/DFgraphics/Phoebus.git gfx
  git clone -q $GH/DFgraphics/Rally-Ho.git gfx
  git clone -q $GH/DFgraphics/Spacefox.git gfx
  git clone -q $GH/DFgraphics/Taffer.git gfx
  git clone -q $GH/DFgraphics/Tergel.git gfx
  git clone -q $GH/DFgraphics/Wanderlust.git gfx

  # Roll back the graphics packs to a known-compatible commit with this version of DF
  #cd gfx/Afro-Graphics
  #git reset --hard fccafc3f5099f645e0e82b2eee46cb2da9f578a9
  #cd ..
  #cd AutoReiv
  #git reset --hard 2d1c10467c41e2f4840e9d9bb1158f9da1535e2b
  #cd ..
  #cd CLA
  #git reset --hard 8e043019e94cad6b43a75a28342c17d5ec2348bb
  #cd ..
  #cd GemSet
  #git reset --hard 0889c4cb79aa2a12ce3142ded0f2be76242adbe6
  #cd ..
  #cd IronHand
  #git reset --hard aaf68412999e62e79c7ee37edcaf0e1d3492b76
  #cd ..
  #cd Jolly-Bastion
  #git reset --hard 82506d6ddc9588865d7c0c66a13f1c773acac11f
  #cd ..
  #cd Mayday
  #git reset --hard 4a64918e6f6b116d7a72e4de48a08aa1c7f497dd
  #cd ..
  #cd Obsidian
  #git reset --hard 9bfdd377c7c4ad9a81b6fe69516f42142296e637
  #cd ..
  #cd Phoebus
  #git reset --hard a8a8e3daa2c66f10a2d98386afc2f594c51ae36e
  #cd ..
  #cd Rally-Ho
  #git reset --hard b342666cb3f39309f39e7a61d6b2f440b37035fb
  #cd ..
  #cd Spacefox
  #git reset --hard f840e53652764021c3edb290b6ecb09f809b9e4b
  #cd ..
  #cd Taffer
  #git reset --hard 70b57c5595b97c33f674cc7c746a8d4640f76f99
  #cd ..
  #cd Tergel
  #git reset --hard 6772c2aafa72cf2647cb5aa24ee55969df698b72
  #cd ..
  #cd Wanderlust
  #git reset --hard a105813b95e57a9e468c56c681afab819504814d
  #cd ../..
fi
echo Copying graphics packs to LNP/graphics directory
cp gfx/* $DEST_DIR/LNP/graphics/ -r

#Get DF Baselines
if [ ! -f $DF_BASELINES ]; then
  echo Downloading DF Baselines
  wget -qnc http://www.bay12games.com/dwarves/$DF_BASELINES
fi
if [ -f $DF_BASELINES ]; then
  echo Downloading DF Baselines to create ASCII graphics pack
  if [ ! -d ./baselines ]; then
    mkdir ./baselines
  fi
  if [ ! -d ./baselines/$DF_BASELINES_VER ]; then
    mkdir ./baselines/$DF_BASELINES_VER
  fi
  unzip -qq -o $DF_BASELINES -d ./baselines/$DF_BASELINES_VER
fi

#Get Dwarf Therapist
cp ~/projects/dwarf_therapist $DEST_DIR/LNP/utilities -r
#mkdir $DEST_DIR/LNP/utilities/dwarf_therapist
#if [ ! -d Dwarf-Therapist ]; then
#	echo Downloading Dwarf Therapist
#	git clone -q $GH/splintermind/Dwarf-Therapist.git
#	echo compiling Dwarf Therapist, please be patient.
#	cd Dwarf-Therapist
#	qmake
#  make > /dev/null 2>&1
#	cd ..
#fi
#echo Copying Dwarf Therapist to LNP/utilities directory
#cd Dwarf-Therapist
#cp release/DwarfTherapist ../$DEST_DIR/LNP/utilities/dwarf_therapist
#cp share ../$DEST_DIR/LNP/utilities/dwarf_therapist -r
#cp hammer.* ../$DEST_DIR/LNP/utilities/dwarf_therapist
#cp LICENSE.txt ../$DEST_DIR/LNP/utilities/dwarf_therapist
#cp README.rst ../$DEST_DIR/LNP/utilities/dwarf_therapist
#cp CHANGELOG.txt ../$DEST_DIR/LNP/utilities/dwarf_therapist
#cp dist/dwarftherapist ../$DEST_DIR/LNP/utilities/dwarf_therapist
#cd ..
#Create manifest.json for Dwarf Therapist
#echo "{" > ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
#echo "    \"author\": \"splintermind\"," >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
#echo "    \"content_version\": \"37.0.0\"," >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
#echo "    \"title\": \"Dwarf Therapist\"," >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
#echo "    \"tooltip\": \"Makes managing your dwarves' jobs and psychology easy! (NB - DFHack \\\"autolabor\\\" must be disabled).\"," >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
#echo "    \"linux_exe\": \"DwarfTherapist\"" >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
#echo "}" >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json

#Get Armok Vision
if [ ! -f $ARMOK_VISION ]; then
  echo Downloading $ARMOK_VISION
  wget -qnc $GH/JapaMala/armok-vision/releases/download/$ARMOK_VISION_VER/$ARMOK_VISION
fi
if [ -f $ARMOK_VISION ]; then
  mkdir ./$DEST_DIR/LNP/utilities/armok_vision
  echo Copying $ARMOK_VISION to LNP/utilities directory
  unzip -qq -o $ARMOK_VISION -d ./$DEST_DIR/LNP/utilities/armok_vision
  chmod +x ./$DEST_DIR/LNP/utilities/armok_vision/Armok\ Vision.*
fi

#Get SoundCenSe
if [ ! -f $SOUNDCENSE ]; then
  echo Downloading $SOUNDCENSE
  wget -qnc $GH/Algorithman/SoundCenSe/releases/download/$SOUNDCENSE_VER/$SOUNDCENSE
fi
if [ -f $SOUNDCENSE ]; then
  echo Copying $SOUNDCENSE to LNP/utilities directory
  mkdir ./$DEST_DIR/LNP/utilities/soundcense
  unzip -qq -o $SOUNDCENSE  -d ./$DEST_DIR/LNP/utilities/soundcense
  echo '#!/bin/bash' > ./$DEST_DIR/LNP/utilities/soundcense/soundcense.sh
  echo 'mono SoundCenSeGTK.exe' >> ./$DEST_DIR/LNP/utilities/soundcense/soundcense.sh
  chmod +x ./$DEST_DIR/LNP/utilities/soundcense/soundcense.sh
  find ./$DEST_DIR/LNP/utilities/soundcense -name manifest.json -exec sed -i "s/\"win_exe\": \"\(.*\)\"/\"linux_exe\": \"soundcense.sh\"/g" {} \;
  # pre-configure SoundCenSe to point to the right location for the gamelog and sound packs
  find ./$DEST_DIR/LNP/utilities/soundcense -name Configuration.json -exec sed -i "s/..\/df_linux\/gamelog.txt/..\/..\/..\/df_linux\/gamelog.txt/g" {} \;
  find ./$DEST_DIR/LNP/utilities/soundcense -name Configuration.json -exec sed -i "s/.\/packs\//..\/..\/..\/df_linux\/sounds\//g" {} \;
fi

#Get SoundSense
if [ ! -f $SOUNDSENSE ]; then
  echo Downloading $SOUNDSENSE
  wget -qnc http://df.zweistein.cz/soundsense/$SOUNDSENSE
fi
if [ -f $SOUNDSENSE ]; then
  echo Copying $SOUNDSENSE to LNP/utilities directory
  unzip -qq -o $SOUNDSENSE  -d ./$DEST_DIR/LNP/utilities/
  chmod +x ./$DEST_DIR/LNP/utilities/soundsense/soundSense.sh
  dos2unix -q ./$DEST_DIR/LNP/utilities/soundsense/soundSense.sh
  #Create manifest.json for SoundSense
  echo "{" > ./$DEST_DIR/LNP/utilities/soundsense/manifest.json
  echo "    \"author\": \"zweistein\"," >> ./$DEST_DIR/LNP/utilities/soundsense/manifest.json
  echo "    \"content_version\": \"2016-1\"," >> ./$DEST_DIR/LNP/utilities/soundsense/manifest.json
  echo "    \"title\": \"Soundsense\"," >> ./$DEST_DIR/LNP/utilities/soundsense/manifest.json
  echo "    \"tooltip\": \"Reads gamelog.txt and plays the appropriate sounds, as well as music for each season\"," >> ./$DEST_DIR/LNP/utilities/soundsense/manifest.json
  echo "    \"linux_exe\": \"soundSense.sh\"" >> ./$DEST_DIR/LNP/utilities/soundsense/manifest.json
  echo "}" >> ./$DEST_DIR/LNP/utilities/soundsense/manifest.json
  # pre-configure SoundSense to point to the right location for the gamelog and sound packs
  find ./$DEST_DIR/LNP/utilities/soundsense -name configuration.xml -exec sed -i "s/..\/gamelog.txt/..\/..\/..\/df_linux\/gamelog.txt/g" {} \;
  find ./$DEST_DIR/LNP/utilities/soundsense -name configuration.xml -exec sed -i "s/.\/packs\//..\/..\/..\/df_linux\/sounds\/packs/g" {} \;
fi

#Get DF Announcement Filter
if [ ! -f DFAnnouncementFilter.zip ]; then
  echo Downloading DFAnnouncementFilter.zip
  wget -qnc http://dffd.bay12games.com/download.php?id=7905\&f=DFAnnouncementFilter.zip -O DFAnnouncementFilter.zip
fi
if [ -f DFAnnouncementFilter.zip ]; then
  echo Copying DF Announcement Filter to LNP/utilities directory
  unzip -qq -o DFAnnouncementFilter.zip -d ./$DEST_DIR/LNP/utilities/df_announcement_filter
  #Create manifest.json for Legends Browser
  echo "{" > ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"author\": \"TheGazelle\"," >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"content_version\": \"1.01\"," >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"title\": \"DF Announcement Filter\"," >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"tooltip\": \"This utility gives you a live feed of announcements without having to pause the game to check the announcement page\"," >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"linux_exe\": \"DFAnnouncementFilter.jar\"" >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "}" >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
fi

#Get Legends Browser
if [ ! -f $LEGENDS_BROWSER ]; then
  echo Downloading $LEGENDS_BROWSER
  wget -qnc $GH/robertjanetzko/LegendsBrowser/releases/download/$LEGENDS_BROWSER_VER/$LEGENDS_BROWSER
fi
if [ -f $LEGENDS_BROWSER ]; then
  mkdir ./$DEST_DIR/LNP/utilities/legends_browser
  echo Copying Legends Browser to LNP/utilities directory
  cp $LEGENDS_BROWSER ./$DEST_DIR/LNP/utilities/legends_browser
  #Create manifest.json for Legends Browser
  echo "{" > ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"author\": \"robertjanetzko\"," >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"content_version\": \"$LEGENDS_BROWSER_VER\"," >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"title\": \"Legends Browser\"," >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"tooltip\": \"Legends Browser is a multi-platform, open source, java-based legends viewer for dwarf fortress\"," >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"linux_exe\": \"$LEGENDS_BROWSER\"" >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "}" >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  #Exclude the .jar file from showing up on the list of utilities in LNP
  echo 'Legends Browser Exclusions' >> ./$DEST_DIR/LNP/utilities/exclude.txt
  echo '['$LEGENDS_BROWSER']' >> ./$DEST_DIR/LNP/utilities/exclude.txt

fi

#Get Old Pack (for qfconvert only)
if [ ! -d qfconvert ]; then
  if [ ! -f 04024r3-x64.zip ]; then
    echo Downloading old pack to retreive qfconvert utility
    wget http://dffd.bay12games.com/download.php?id=8936\&f=04024r3-x64.zip -O 04024r3-x64.zip
  fi
  if [ -f 04023r3-x64.zip ]; then
    echo Extracting old pack to retreive qfconvert utility
    unzip -qq -o 04024r3-x64.zip
    mv 04024r3-x64/LNP/utilities/qfconvert ./
    mv qfconvert/community_bluepritns/ qfconvert/community_blueprints
    rm -rf 04024r3-x64
    echo Copying QFconvert to LNP/utilities directory
    cp qfconvert ./$DEST_DIR/LNP/utilities -r
    rm -rf 04024r3-x64
  fi
fi

#Copy  baseline art to tilesets directory
echo Copying baseline art to LNP/tilesets directory
cp ./baselines/$DF_BASELINES_VER/data/art/* ./$DEST_DIR/LNP/tilesets
#echo ./$DEST_DIR/LNP/graphics/*/data/art/ | xargs -n 1 cp ./$DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/art/curses_640x300.png

#Set sane defaults for all graphics packs
echo  Setting sane defaults for all graphics packs and vanilla
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[AUTOSAVE\:\(.*\)\]/\[AUTOSAVE\:SEASONAL\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[AUTOSAVE_PAUSE\:NO\]/\[AUTOSAVE_PAUSE\:YES\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[AUTOBACKUP\:\(.*\)\]/\[AUTOBACKUP\:YES\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[SHOW_FLOW_AMOUNTS\:NO\]/\[SHOW_FLOW_AMOUNTS\:YES\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[POPULATION_CAP\:\(.*\)\]/\[POPULATION_CAP\:120\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[STRICT_POPULATION_CAP\:\(.*\)\]/\[STRICT_POPULATION_CAP\:220\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[BABY_CHILD_CAP\:\(.*\)\:\(.*\)\]/\[BABY_CHILD_CAP\:10\:20\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[VISITOR_CAP\:\(.*\)\]/\[VISITOR_CAP\:100\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[INVASION_SOLDIER_CAP\:\(.*\)\]/\[INVASION_SOLDIER_CAP\:120\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[INVASION_MONSTER_CAP\:\(.*\)\]/\[INVASION_MONSTER_CAP\:40\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name init.txt -exec sed -i "s/\[FPS\:NO\]/\[FPS\:YES\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name init.txt -exec sed -i "s/\[INTRO\:YES\]/\[INTRO\:NO\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name init.txt -exec sed -i "s/\[SOUND\:YES\]/\[SOUND\:NO\]/g" {} \;
if [ -f ./$DEST_DIR/df_linux/hack/plugins/twbt.plug.so ]; then
  find ./$DEST_DIR/LNP/graphics -name init.txt -exec sed -i "s/\[PRINT_MODE\:\(.*\)\]/\[PRINT_MODE\:TWBT\]/g" {} \;
fi
#Set Phoebus as the default graphics pack
echo Setting Phoebus as the default graphics pack
cp $DEST_DIR/LNP/graphics/Phoebus/* $DEST_DIR/df_linux/ -R
cp $DEST_DIR/LNP/graphics/Phoebus/data/init/colors.txt $DEST_DIR/LNP/colors/\ Current\ graphics\ pack.txt
find ./$DEST_DIR/df_linux/data/init -name init.txt -exec sed -i "s/\[FONT\:\(.*\)\]/\[FONT\:curses_640x300.png\]/g" {} \;
find ./$DEST_DIR/df_linux/data/init -name init.txt -exec sed -i "s/\[FULLFONT\:\(.*\)\]/\[FULLFONT\:curses_640x300.png\]/g" {} \;

#Manually create installed_raws.txt
echo '# List of raws merged by PyLNP:' > $DEST_DIR/df_linux/raw/installed_raws.txt
echo 'baselines/'$DF_BASELINES_VER >> $DEST_DIR/df_linux/raw/installed_raws.txt
echo 'graphics/Phoebus' >> $DEST_DIR/df_linux/raw/installed_raws.txt

#Copy Baselines to ASCII folder in LNP/graphics
mkdir $DEST_DIR/LNP/graphics/ASCII
mkdir $DEST_DIR/LNP/graphics/ASCII/data
mkdir $DEST_DIR/LNP/graphics/ASCII/data/art
mkdir $DEST_DIR/LNP/graphics/ASCII/data/init

cp ./baselines/$DF_BASELINES_VER/data/art/* $DEST_DIR/LNP/graphics/ASCII/data/art
cp ./baselines/$DF_BASELINES_VER/data/init/colors.txt $DEST_DIR/LNP/graphics/ASCII/data/init
cp ./baselines/$DF_BASELINES_VER/data/init/d_init.txt $DEST_DIR/LNP/graphics/ASCII/data/init
cp ./baselines/$DF_BASELINES_VER/data/init/init.txt $DEST_DIR/LNP/graphics/ASCII/data/init

echo '{' > $DEST_DIR/LNP/graphics/ASCII/manifest.json
echo '    "author": "ToadyOne",' >> $DEST_DIR/LNP/graphics/ASCII/manifest.json
echo '    "tooltip": "Default graphics for DF, exactly as they come.",' >> $DEST_DIR/LNP/graphics/ASCII/manifest.json
echo '    "content_version": "'$DF_VER'",' >> $DEST_DIR/LNP/graphics/ASCII/manifest.json
echo '    "title": "ASCII Default"' >> $DEST_DIR/LNP/graphics/ASCII/manifest.json
echo '}' >> $DEST_DIR/LNP/graphics/ASCII/manifest.json

#Finalize the pack and create the tar.gz file for DFFD
cd $DEST_DIR
find . | grep .git | xargs rm -rf
find . -type f -name curses*.bmp -print0 | xargs -0 rm
find ./LNP/graphics -type f -name mouse.bmp -print0 | xargs -0 rm
find ./LNP -name README.* -print0| xargs -0 rm
find ./LNP -name read* -print0 | xargs -0 rm

#update PyLNP.json with current pack version and revision number (for auto-update notifications)
find ./LNP -name PyLNP.json -exec sed -i "s/\"packVersion\": \"\(.*\)\"/\"packVersion\": \"$LNP_VER\"/g" {} \;
find ./LNP -name PyLNP.json -exec sed -i "s/\"dffdID\": \"\(.*\)\"/\"dffdID\": \"$dffdID\"/g" {} \;
find ./LNP -name PyLNP.json -exec sed -i "s/\"updateMethod\": \"\(.*\)\"/\"updateMethod\": \"dffd\"/g" {} \;
find ./LNP -name PyLNP.json -exec sed -i 's/\["Donate for Dwarf Fortress","http:\/\/www\.bay12games\.com\/support\.html"\],/\["Donate for Dwarf Fortress","http:\/\/www\.bay12games\.com\/support\.html"\],\n                \["This Packs homepage","http:\/\/www\.bay12forums\.com\/smf\/index\.php\?topic=156011"\],'/g {} \; 

touch df_linux/gamelog.txt
mkdir df_linux/data/save
echo Creating $LNP_VER.tar.gz
tar cfz LinuxLNP-$LNP_VER.tar.gz *
mv *.tar.gz ../../
cd ../../
echo Finished!


