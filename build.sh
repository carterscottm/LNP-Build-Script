#!/bin/bash
# TODO:
#			* add additional documentation

# Variable declarations ########################################################
LNP_VER="0.44.12-r03"                                       # used to set the version in PyLNP.json (for automatic update checks when launching LNP)

ARMOK_VISION_VER="v0.19.1"                                  # part of the download URL
ARMOK_VISION="Armok.Vision.0.19.1.Linux.zip"                # file name to download

DF_VER="0.44.12"                                            # part of the download URL, and used to allow graphics pack compatibility
DF="df_44_12_linux.tar.bz2"                                 # file name to download

DF_BASELINES_VER="df_44_12"                                 # part of the file path in LNP directory
DF_BASELINES="df_44_12_win_s.zip"                           # file name to download

DFHACK_VER="0.44.12-r2"                                     # part of the download URL
DFHACK="dfhack-0.44.12-r2-Linux-64-gcc-4.8.tar.bz2"         # file name to download

LEGENDS_BROWSER_VER="1.17.1"                                # part of the download URL
LEGENDS_BROWSER="legendsbrowser-1.17.1.jar"                 # file name to download

PYLNP="PyLNP_0.13b-linux-x64.tar.xz"                        # part of the download URL

SOUNDCENSE="SoundCenSe.GTK.v1.4.2.Win32.zip"                # file name to download
SOUNDCENSE_VER="1.4.2"

SOUNDSENSE="soundSense_2016-1_196.zip"                      # file name to download

TWBT_VER="v6.57"                                            # part of the download URL
TWBT="twbt-6.57-linux.zip"                                  # file name to download

DT_VER="v41.0.3"
DT="DwarfTherapist-v41.0.3-linux-x86_64.AppImage"

DEST_DIR="dist"                                             # folder name where everything will be copied to

GH="https://github.com"                                     # because why not?

dffdID="13244"                                              # added for portability

PACK_HOMEPAGE="\"http:\/\/www\.bay12forums\.com\/smf\/index\.php\?topic=163211\""   # used for inserting the link into PyLNP.json via sed

# Begin ########################################################################
if [ ! -d $DF_VER ]; then
  mkdir $DF_VER
fi
if [ -d $DF_VER/$DEST_DIR ]; then
  echo Removing old $DF_VER/$DEST_DIR directory structure
  rm $DF_VER/$DEST_DIR -rf
fi
mkdir $DF_VER/$DEST_DIR
cd $DF_VER

# Get LNP files and directory structure #########################################
if [ ! -d Lazy-Newb-Pack-Linux ]; then
  echo Cloning $GH/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux.git
  git clone -q $GH/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux.git
fi
if [ ! -f Lazy-Newb-Pack-Linux/pack/LNP/PyLNP.json ]; then
  echo Cloning $GH/Lazy-Newb-Pack/LNP-shared-core.git
  git clone -q $GH/Lazy-Newb-Pack/LNP-shared-core.git ./Lazy-Newb-Pack-Linux/pack/LNP
fi

echo Creating the LNP directory structure
cp Lazy-Newb-Pack-Linux/pack/* $DEST_DIR/ -r
if [ ! -d $DEST_DIR/LNP/about ]; then
  mkdir ./$DEST_DIR/LNP/about
fi
mv ./$DEST_DIR/LNP/README.md $DEST_DIR/LNP/about/PyLNP.md

# Get PyLNP ####################################################################
if [ ! -f $PYLNP ]; then
  echo Downloading $PYLNP
  wget -qnc https://bitbucket.org/Pidgeot/python-lnp/downloads/$PYLNP
fi
if [ $PYLNP ]; then
  echo Extracting $PYLNP
  tar xf $PYLNP -C ./$DEST_DIR/
fi

# Get Dwarf Fortress ###########################################################
if [ ! -f $DF ]; then
  echo Downloading $DF
  wget -qnc http://bay12games.com/dwarves/$DF
fi
if [ -f $DF ]; then
  echo Extracting $DF
  tar jxf $DF -C $DEST_DIR/
  mv $DEST_DIR/df_linux/libs/libstdc++.so.6 $DEST_DIR/df_linux/libs/libstdc++.so.6.bak
fi

# Get DFHack ###################################################################
if [ ! -f $DFHACK ]; then
  echo Downloading $DFHACK
  wget -qnc $GH/DFHack/dfhack/releases/download/$DFHACK_VER/$DFHACK
fi
if [ -f $DFHACK ]; then
  echo Extracting $DFHACK
  tar jxf $DFHACK -C $DEST_DIR/df_linux
  mv ./$DEST_DIR/df_linux/dfhack.init-example ./$DEST_DIR/df_linux/dfhack.init
fi

# Get Text Will Be Text ########################################################
if [ ! -f $TWBT ]; then
  echo Downloading $TWBT
  wget -qnc $GH/mifki/df-twbt/releases/download/$TWBT_VER/$TWBT
fi
if [ -f  $TWBT ]; then
  echo Extracting $TWBT
  unzip -qq -o $TWBT -d twbt
  chmod 700 twbt/*.png
  cp twbt/*.png $DEST_DIR/df_linux/data/art
  cp twbt/realcolors.lua $DEST_DIR/df_linux/hack/scripts/
  cp twbt/$DFHACK_VER/* $DEST_DIR/df_linux/hack/plugins/
  cp twbt/transparent1px.png $DEST_DIR/LNP/tilesets
  cp twbt/white1px.png $DEST_DIR/LNP/tilesets
fi

# Get Graphics Packs ###########################################################
echo Downloading/Updating graphics packs
if [ ! -d $DEST_DIR/LNP/graphics ]; then
  mkdir $DEST_DIR/LNP/graphics
fi
if [ ! -d gfx ]; then
  mkdir gfx
  cd gfx
  git clone -q $GH/jecowa/Meph.git
  git clone -q $GH/DFgraphics/Afro-Graphics.git
  git clone -q $GH/DFgraphics/AutoReiv.git
  git clone -q $GH/DFgraphics/CLA.git
  git clone -q $GH/DFgraphics/GemSet.git
  git clone -q $GH/DFgraphics/IronHand.git
  git clone -q $GH/DFgraphics/Jolly-Bastion.git
  git clone -q $GH/DFgraphics/Mayday.git
  git clone -q $GH/DFgraphics/Obsidian.git
  git clone -q $GH/DFgraphics/Phoebus.git
  git clone -q $GH/DFgraphics/Rally-Ho.git
  git clone -q $GH/DFgraphics/Spacefox.git
  git clone -q $GH/DFgraphics/Taffer.git
  git clone -q $GH/DFgraphics/Tergel.git
  git clone -q $GH/DFgraphics/Wanderlust.git
  cd ..
fi
# Update gfx packs with latest commits
echo Afro...
cd gfx/Afro-Graphics
git reset HEAD --hard -q
git pull -q
cp -r ./data/twbt_art/* ./data/art
cp -r ./data/twbt_init/*  ./data/init
cp -r ./raw/twbt_objects/* ./raw/objects
cp -r ./raw/twbt_graphics/* ./raw/graphics
cd ..
echo AutoReiv...
cd AutoReiv
git pull -q
cd ..
echo CLA...
cd CLA
git pull -q
cd ..
echo GemSet...
cd GemSet
git pull -q
cd ..
echo IronHand...
cd IronHand
git reset HEAD --hard -q
git pull -q
cp -r ./data/twbt_art/* ./data/art
cp -r ./data/twbt_init/* ./data/init
cp -r ./raw/twbt_objects/* ./raw/objects
cp -r ./raw/twbt_graphics/* ./raw/graphics
cd ..
echo Jolly-Bastion...
cd Jolly-Bastion
git pull -q
cd ..
echo Mayday...
cd Mayday
git reset HEAD --hard -q
git pull -q
cp -r ./data/twbt_art/* ./data/art
cp -r ./data/twbt_init/* ./data/init
cp -r ./raw/twbt_objects/* ./raw/objects
cp -r ./raw/twbt_graphics/* ./raw/graphics
cd ..
echo Meph...
cd Meph
git pull -q
cd ..
echo Obsidian...
cd Obsidian
git reset HEAD --hard -q
git pull -q
cp -r ./data/twbt_art/* ./data/art
cp -r ./data/twbt_init/* ./data/init
cp -r ./raw/twbt_objects/* ./raw/objects
cp -r ./raw/twbt_graphics/* ./raw/graphics
cd ..
echo Phoebus...
cd Phoebus
git reset HEAD --hard -q
git pull -q
cp -r ./data/twbt_art/* ./data/art
cp -r ./data/twbt_init/* ./data/init
cp -r ./raw/twbt_objects/* ./raw/objects
cp -r ./raw/twbt_graphics/* ./raw/graphics
cd ..
echo Rally-Ho...
cd Rally-Ho
git pull -q
cd ..
echo Spacefox...
cd Spacefox
git reset HEAD --hard -q
git pull -q
cp -r ./data/twbt_art/* ./data/art
cp -r ./data/twbt_init/* ./data/init
cp -r ./raw/twbt_objects/* ./raw/objects
cp -r ./raw/twbt_graphics/* ./raw/graphics
cd ..
echo Taffer...
cd Taffer
git pull -q
cd ..
echo Tergel...
cd Tergel
git pull -q
cd ..
echo Wanderlust...
cd Wanderlust
git pull -q
cd ..
find ./ -type f -iname 'manifest.json' -exec sed -i 's/"df_max_version": "0.44.[[:digit:]]*",/"df_max_version": "0.44.12",/' "{}" +;
cd ..
echo Copying graphics packs to LNP/graphics directory
cp gfx/* $DEST_DIR/LNP/graphics/ -r

# Get DF Baselines #############################################################
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
mkdir $DEST_DIR/LNP/baselines/$DF_BASELINES_VER
cp $DEST_DIR/df_linux/data $DEST_DIR/LNP/baselines/$DF_BASELINES_VER -r
cp $DEST_DIR/df_linux/raw $DEST_DIR/LNP/baselines/$DF_BASELINES_VER -r

# Get Dwarf Therapist ##########################################################
if [ ! -f $DT ]; then
  echo Downloading pre-compiled Dwarf Therapist
  wget -qnc https://github.com/Dwarf-Therapist/Dwarf-Therapist/releases/download/$DT_VER/$DT
  chmod +x $DT
fi
mkdir $DEST_DIR/LNP/utilities/dwarf_therapist
echo Copying Dwarf Therapist to LNP/utilities directory
cp $DT $DEST_DIR/LNP/utilities/dwarf_therapist/dwarftherapist

# Get Armok Vision #############################################################
if [ ! -f $ARMOK_VISION ]; then
  echo Downloading $ARMOK_VISION
  wget -qnc $GH/JapaMala/armok-vision/releases/download/$ARMOK_VISION_VER/$ARMOK_VISION
fi
if [ -f $ARMOK_VISION ]; then
  mkdir ./$DEST_DIR/LNP/utilities/armok_vision
  echo Copying $ARMOK_VISION to LNP/utilities directory
  unzip -qq -o $ARMOK_VISION -d ./$DEST_DIR/LNP/utilities/armok_vision
  chmod +x ./$DEST_DIR/LNP/utilities/armok_vision/Armok\ Vision\ Linux*
  sed -i 's/Armok Vision.x86_64/Armok Vision Linux.x86_64/g' ./$DEST_DIR/LNP/utilities/armok_vision/manifest.json
  mv ././$DEST_DIR/LNP/utilities/armok_vision/Readme.txt  ./$DEST_DIR/LNP/about/Armok_Vision.txt
  find ./$DEST_DIR/LNP/utilities/armok_vision/ -name manifest.json -exec sed -i "s/Armok Vision.x86_64/Armok Vision Linux.x86_64/g" {} \;
fi

# Get SoundCenSe ###############################################################
if [ ! -f $SOUNDCENSE ]; then
  echo Downloading $SOUNDCENSE
  wget -qnc $GH/Algorithman/SoundCenSe/releases/download/$SOUNDCENSE_VER/$SOUNDCENSE
fi
if [ -f $SOUNDCENSE ]; then
  echo Copying $SOUNDCENSE to LNP/utilities directory
  mkdir ./$DEST_DIR/LNP/utilities/soundcense
  unzip -qq -o $SOUNDCENSE  -d ./$DEST_DIR/LNP/utilities/soundcense
  #cp -r ../SoundCenSe\ GTK/SoundCenSeGTK/bin/Release/* ./$DEST_DIR/LNP/utilities/soundcense
  #unzip -qq -o $SOUNDCENSE  -d ./$DEST_DIR/LNP/utilities/soundcense
  mv ./$DEST_DIR/LNP/utilities/soundcense/README.md ./$DEST_DIR/LNP/about/SoundCenSe.md
  echo '#!/bin/bash' > ./$DEST_DIR/LNP/utilities/soundcense/soundcense.sh
  echo 'mono SoundCenSeGTK.exe' >> ./$DEST_DIR/LNP/utilities/soundcense/soundcense.sh
  chmod +x ./$DEST_DIR/LNP/utilities/soundcense/soundcense.sh
  find ./$DEST_DIR/LNP/utilities/soundcense -name manifest.json -exec sed -i "s/\"win_exe\": \"\(.*\)\"/\"linux_exe\": \"soundcense.sh\"/g" {} \;
  # pre-configure SoundCenSe to point to the right location for the gamelog and sound packs
  find ./$DEST_DIR/LNP/utilities/soundcense -name Configuration.json -exec sed -i "s/..\/df_linux\/gamelog.txt/..\/..\/..\/df_linux\/gamelog.txt/g" {} \;
  find ./$DEST_DIR/LNP/utilities/soundcense -name Configuration.json -exec sed -i "s/.\/packs\//..\/..\/..\/df_linux\/sounds\//g" {} \;
fi

# Get SoundSense ###############################################################
if [ ! -f $SOUNDSENSE ]; then
  echo Downloading $SOUNDSENSE
  wget -qnc http://df.zweistein.cz/soundsense/$SOUNDSENSE
fi
if [ -f $SOUNDSENSE ]; then
  echo Copying $SOUNDSENSE to LNP/utilities directory
  unzip -qq -o $SOUNDSENSE  -d ./$DEST_DIR/LNP/utilities/
  mv ./$DEST_DIR/LNP/utilities/soundsense/readme.txt ./$DEST_DIR/LNP/about/SoundSense.txt
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

# Get DF Announcement Filter ###################################################
if [ ! -f DFAnnouncementFilter.zip ]; then
  echo Downloading DFAnnouncementFilter.zip
  wget -qnc http://dffd.bay12games.com/download.php?id=7905\&f=DFAnnouncementFilter.zip -O DFAnnouncementFilter.zip
fi
if [ -f DFAnnouncementFilter.zip ]; then
  echo Copying DF Announcement Filter to LNP/utilities directory
  unzip -qq -o DFAnnouncementFilter.zip -d ./$DEST_DIR/LNP/utilities/df_announcement_filter
  mv ./$DEST_DIR/LNP/utilities/df_announcement_filter/README.txt ./$DEST_DIR/LNP/about/DF_Announcement_Filter.txt

  #Create manifest.json for Announcement Filter
  echo "{" > ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"author\": \"TheGazelle\"," >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"content_version\": \"1.01\"," >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"title\": \"DF Announcement Filter\"," >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"tooltip\": \"This utility gives you a live feed of announcements without having to pause the game to check the announcement page\"," >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "    \"linux_exe\": \"df_announcement_filter.sh\"" >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json
  echo "}" >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/manifest.json


  #Create manifest.json for Dwarf Therapist
  echo "{" > ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
  echo "    \"author\": \"Splintermind, Dwarf-Therapist\"," >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
  echo "    \"content_version\": \"$DT_VER\"," >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
  echo "    \"title\": \"Dwarf Therapist\"," >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
  echo "    \"tooltip\": \"Makes managing your dwarves' jobs and psychology easy! (NB - DFHack '"labormanager"' must be disabled).\"," >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
  echo "    \"linux_exe\": \"dwarftherapist\"" >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json
  echo "}" >> ./$DEST_DIR/LNP/utilities/dwarf_therapist/manifest.json



  #Create launch script for DF Announcement Filter (some distros won't launch .jar files directly)
  echo "#!/bin/bash" > ./$DEST_DIR/LNP/utilities/df_announcement_filter/df_announcement_filter.sh
  echo "CWD=\`dirname \"\$(readlink -f \"\$0\")\"\`" >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/df_announcement_filter.sh
  echo "JAVA=\`which java\`" >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/df_announcement_filter.sh
  echo "\$JAVA -jar \"\$CWD/DFAnnouncementFilter.jar\"" >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/df_announcement_filter.sh
  echo "exit 0" >> ./$DEST_DIR/LNP/utilities/df_announcement_filter/df_announcement_filter.sh
  chmod +x ./$DEST_DIR/LNP/utilities/df_announcement_filter/df_announcement_filter.sh
fi

# Get Legends Browser ##########################################################
if [ ! -f $LEGENDS_BROWSER ]; then
  echo Downloading $LEGENDS_BROWSER
  wget -qnc $GH/robertjanetzko/LegendsBrowser/releases/download/$LEGENDS_BROWSER_VER/$LEGENDS_BROWSER
fi
if [ -f $LEGENDS_BROWSER ]; then
  mkdir ./$DEST_DIR/LNP/utilities/legends_browser
  echo Copying Legends Browser to LNP/utilities directory
  cp $LEGENDS_BROWSER ./$DEST_DIR/LNP/utilities/legends_browser
  wget -qnc https://raw.githubusercontent.com/robertjanetzko/LegendsBrowser/master/README.md
  mv README.md ./$DEST_DIR/LNP/about/Legends_Browser.md

  #Create manifest.json for Legends Browser
  echo "{" > ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"author\": \"robertjanetzko\"," >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"content_version\": \"$LEGENDS_BROWSER_VER\"," >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"title\": \"Legends Browser\"," >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"tooltip\": \"Legends Browser is a multi-platform, open source, java-based legends viewer for dwarf fortress\"," >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "    \"linux_exe\": \"legendsbrowser.sh\"" >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json
  echo "}" >> ./$DEST_DIR/LNP/utilities/legends_browser/manifest.json

  #Create launch script for Legends Browser (some distros won't launch .jar files directly)
  echo "#!/bin/bash" > ./$DEST_DIR/LNP/utilities/legends_browser/legendsbrowser.sh
  echo "CWD=\`dirname \"\$(readlink -f \"\$0\")\"\`" >> ./$DEST_DIR/LNP/utilities/legends_browser/legendsbrowser.sh
  echo "JAVA=\`which java\`" >> ./$DEST_DIR/LNP/utilities/legends_browser/legendsbrowser.sh
  echo "\$JAVA -jar \"\$CWD/$LEGENDS_BROWSER\"" >> ./$DEST_DIR/LNP/utilities/legends_browser/legendsbrowser.sh
  echo "exit 0" >> ./$DEST_DIR/LNP/utilities/legends_browser/legendsbrowser.sh
  chmod +x ./$DEST_DIR/LNP/utilities/legends_browser/legendsbrowser.sh

  #Exclude the .jar file from showing up on the list of utilities in LNP
  echo 'Legends Browser Exclusions' >> ./$DEST_DIR/LNP/utilities/exclude.txt
  echo '['$LEGENDS_BROWSER']' >> ./$DEST_DIR/LNP/utilities/exclude.txt
fi

# Get Old Pack (for qfconvert only) ############################################
if [ ! -d qfconvert ]; then
  if [ ! -f 04024r3-x64.zip ]; then
    echo Downloading old pack to retreive qfconvert utility
    wget -qnc http://dffd.bay12games.com/download.php?id=8936\&f=04024r3-x64.zip -O 04024r3-x64.zip
  fi
  if [ -f 04024r3-x64.zip ]; then
    echo Extracting old pack to retreive qfconvert utility
    unzip -qq -o 04024r3-x64.zip
    mv 04024r3-x64/LNP/utilities/qfconvert ./
    mv qfconvert/community_bluepritns/ qfconvert/community_blueprints
    rm -rf 04024r3-x64
  fi
fi
echo Copying QFconvert to LNP/utilities directory
cp qfconvert ./$DEST_DIR/LNP/utilities -r
mv ./$DEST_DIR/LNP/utilities/qfconvert/README.md ./$DEST_DIR/LNP/about/QFconvert.md

# Copy  baseline art to tilesets directory #####################################
echo Copying baseline art to LNP/tilesets directory
cp ./baselines/$DF_BASELINES_VER/data/art/* ./$DEST_DIR/LNP/tilesets

# Copy Baselines to ASCII folder in LNP/graphics ###############################
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

# Set sane defaults for all graphics packs #####################################
echo  Setting sane defaults for all graphics packs and vanilla
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[AUTOSAVE\:\(.*\)\]/\[AUTOSAVE\:SEASONAL\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[AUTOSAVE_PAUSE\:NO\]/\[AUTOSAVE_PAUSE\:YES\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[AUTOBACKUP\:\(.*\)\]/\[AUTOBACKUP\:YES\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[SHOW_FLOW_AMOUNTS\:NO\]/\[SHOW_FLOW_AMOUNTS\:YES\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[POPULATION_CAP\:\(.*\)\]/\[POPULATION_CAP\:120\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[STRICT_POPULATION_CAP\:\(.*\)\]/\[STRICT_POPULATION_CAP\:220\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[BABY_CHILD_CAP\:\(.*\)\:\(.*\)\]/\[BABY_CHILD_CAP\:10\:20\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[VISITOR_CAP\:\(.*\)\]/\[VISITOR_CAP\:50\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[INVASION_SOLDIER_CAP\:\(.*\)\]/\[INVASION_SOLDIER_CAP\:120\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[INVASION_MONSTER_CAP\:\(.*\)\]/\[INVASION_MONSTER_CAP\:40\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[ENGRAVINGS_START_OBSCURED\:NO\]/\[ENGRAVINGS_START_OBSCURED\:YES]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name d_init.txt -exec sed -i "s/\[EMBARK_RECTANGLE\:\(.*\)\]/\[EMBARK_RECTANGLE\:3\:3\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name init.txt -exec sed -i "s/\[FPS\:NO\]/\[FPS\:YES\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name init.txt -exec sed -i "s/\[INTRO\:YES\]/\[INTRO\:NO\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name init.txt -exec sed -i "s/\[SOUND\:YES\]/\[SOUND\:NO\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name init.txt -exec sed -i "s/\[MACRO_MS\:\(.*\)\]/\[MACRO_MS\:0\]/g" {} \;
if [ -f ./$DEST_DIR/df_linux/hack/plugins/twbt.plug.so ]; then
  find ./$DEST_DIR/LNP/graphics -name init.txt -exec sed -i "s/\[PRINT_MODE\:\(.*\)\]/\[PRINT_MODE\:TWBT\]/g" {} \;
fi
# Set Phoebus as the default graphics pack #####################################
echo Setting Phoebus as the default graphics pack
cp $DEST_DIR/LNP/graphics/Phoebus/* $DEST_DIR/df_linux/ -R
rm $DEST_DIR/df_linux/onLoad_gfx_Phoebus.init
cp $DEST_DIR/LNP/graphics/Phoebus/data/init/colors.txt $DEST_DIR/LNP/colors/\ Current\ graphics\ pack.txt
rm $DEST_DIR/df_linux/manifest.json

# Preserve Meph tileset compatability
cp gfx/Meph $DEST_DIR/LNP/graphics -rf

# Manually create installed_raws.txt ###########################################
echo '# List of raws merged by PyLNP:' > $DEST_DIR/df_linux/raw/installed_raws.txt
echo 'baselines/'$DF_BASELINES_VER >> $DEST_DIR/df_linux/raw/installed_raws.txt
echo 'graphics/Phoebus' >> $DEST_DIR/df_linux/raw/installed_raws.txt

# Cleanup git files and other misc. cleanup ####################################
cd $DEST_DIR
find . | grep .git | xargs rm -rf
find . -type f -name curses*.bmp -delete
find ./LNP/graphics -type f -name _VanillaDF* -print0 | xargs -0 -I {} mv {} ./LNP/tilesets
find ./LNP/graphics -type f -name mouse.bmp -delete
rm -rf LNP/graphics/**/**/twbt_*/
# find ./LNP/graphics -type f -name onLoad.init -delete
find ./LNP -type f -name README.* -delete
find ./LNP -type f -name readme.* -delete
find ./LNP -type f -name .travis* -delete
find ./LNP -type f -print0 | xargs -0 dos2unix -q
find ./df_linux/data/init -type f -print0 | xargs -0 dos2unix -q
rm ./LNP/travis -rf

# update PyLNP.json with current pack info #####################################
find ./LNP -name PyLNP.json -exec sed -i "s/\"packVersion\": \"\(.*\)\"/\"packVersion\": \"$LNP_VER\"/g" {} \;
find ./LNP -name PyLNP.json -exec sed -i "s/\"dffdID\": \"\(.*\)\"/\"dffdID\": \"$dffdID\"/g" {} \;
find ./LNP -name PyLNP.json -exec sed -i "s/\"updateMethod\": \"\(.*\)\"/\"updateMethod\": \"dffd\"/g" {} \;
find ./LNP -name PyLNP.json -exec sed -i 's/\["Donate for Dwarf Fortress","http:\/\/www\.bay12games\.com\/support\.html"\],/\["Donate for Dwarf Fortress","http:\/\/www\.bay12games\.com\/support\.html"\],\n        \["This Packs homepage",'$PACK_HOMEPAGE'\],'/g {} \;

# Create PyLNP.user to enable update check at every launch
echo "{" > PyLNP.user
echo "  \"updateDays\": 0" >> PyLNP.user
echo "}" >> PyLNP.user

# Create empty (but necessary) files/folders and create tarball ###############
touch df_linux/gamelog.txt
mkdir df_linux/data/save
mkdir df_linux/sounds/packs -p
mkdir LinuxLNP-$LNP_VER
cp ../../README.md ./
mv * LinuxLNP-$LNP_VER > /dev/null 2>&1
echo Creating $LNP_VER.tar.gz
tar cfz LinuxLNP-$LNP_VER.tar.gz *
mv *.tar.gz ../../
cd ../../
echo Finished!
