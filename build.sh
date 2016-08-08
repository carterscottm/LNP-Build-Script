#!/bin/bash

# TODO:

#Variable declarations
LNP_VER="0.43.03-r03"                                   # used to set the version in PyLNP.json (for automatic update checks when launching LNP)

ARMOK_VISION_VER="v0.10.1"                              # part of the download URL
ARMOK_VISION="Armok.Vision.0.10.1.Linux.zip"            # file name to download

DF_VER="0.43.03"                                        # part of the download URL, and used to allow graphics pack compatibility
DF="df_43_03_linux.tar.bz2"                             # file name to download

DF_BASELINES_VER="df_43_03"															# part of the file path in LNP directory
DF_BASELINES="df_43_03_win_s.zip"												# file name to download

DFHACK_VER="0.43.03-r1"                                 # part of the download URL
DFHACK="dfhack-0.43.03-r1-Linux-gcc-4.8.1.tar.bz2"      # file name to download

LEGENDS_BROWSER_VER="1.0.12"                            # part of the download URL
LEGENDS_BROWSER="legendsbrowser-1.0.12.jar"             # file name to download

PYLNP="PyLNP_0.11-linux-x64.tar.xz"                     # part of the download URL
SOUNDSENSE="soundSense_2016-1_196.zip"                  # file name to download

TWBT_VER="v5.65"                                        # part of the download URL
TWBT="twbt-5.65-linux.zip"                              # file name to download

DEST_DIR="df_$DF_VER"                                   # folder name where everything will be copied to

GH="https://github.com"                                 # because why not?


# Begin
if [ ! -d $DF_VER ]; then
	mkdir $DF_VER
	if [ ! -d $DF_VER/$DEST_DIR ]; then
		mkdir $DF_VER/$DEST_DIR
	fi
fi
cd $DF_VER

#Get PyLNP
if [ ! -f $PYLNP ]; then
	echo Downloading $PYLNP
	wget -qnc https://bitbucket.org/Pidgeot/python-lnp/downloads/$PYLNP
fi
echo Extracting $PYLNP
tar -xf $PYLNP -C ./$DEST_DIR/

#Get LNP shared components
if [ ! -d Lazy-Newb-Pack-Linux ]; then
	git clone -q $GH/carterscottm/Lazy-Newb-Pack-Linux.git
	cd Lazy-Newb-Pack-Linux
	git submodule update  -q --init --recursive
	cd ../
fi
find ./Lazy-Newb-Pack-Linux/LNP -name PyLNP.json -exec sed -i "s/\"packVersion\": \"\(.*\)\"/\"packVersion\": \"$LNP_VER\"/g" {} \;
echo Creating the LNP directory structure
cp Lazy-Newb-Pack-Linux/* $DEST_DIR/ -r

#Get DF Baselines
if [ ! -f $DF_BASELINES.zip ]; then
	echo Downloading DF Baselines
	wget -qnc http://www.bay12games.com/dwarves/$DF_BASELINES
fi
echo Extracting DF Baselines
mkdir $DEST_DIR/LNP/baselines/$DF_BASELINES_VER
unzip -qq -o $DF_BASELINES -d $DEST_DIR/LNP/baselines/$DF_BASELINES_VER
rm -f $DEST_DIR/LNP/baselines/README 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/announcement/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/dipscript/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/dipscript/text/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/help/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/initial_movies/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/movies/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/sound/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/sdl/* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/init/a* 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/init/interface.txt 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/init/world_gen.txt 2> /dev/null
rm -f $DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/init/macros -r 2> /dev/null

#Get Graphics Packs
mkdir $DEST_DIR/LNP/graphics
if [ ! -d gfx ]; then
	echo Downloading the graphics packs
	mkdir gfx
	cd gfx
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

	# Roll back the graphics packs to a revision known to be compatible with this version of DF
	cd Afro-Graphics
	git reset --hard fccafc3f5099f645e0e82b2eee46cb2da9f578a9
	cd ..
	cd AutoReiv
	git reset --hard 2d1c10467c41e2f4840e9d9bb1158f9da1535e2b
	cd ..
	cd CLA
  git reset --hard 8e043019e94cad6b43a75a28342c17d5ec2348bb
	cd ..
  cd GemSet
  git reset --hard 0889c4cb79aa2a12ce3142ded0f2be76242adbe6
  cd ..
  cd IronHand
  git reset --hard aaf68412999e62e79c7ee37edcaf0e1d3492b76
  cd ..
  cd Jolly-Bastion
  git reset --hard 82506d6ddc9588865d7c0c66a13f1c773acac11f
  cd ..
	cd Mayday
	git reset --hard 4a64918e6f6b116d7a72e4de48a08aa1c7f497dd
	cd ..
  cd Obsidian
  git reset --hard 9bfdd377c7c4ad9a81b6fe69516f42142296e637
  cd ..
  cd Phoebus
  git reset --hard a8a8e3daa2c66f10a2d98386afc2f594c51ae36e
  cd ..
  cd Rally-Ho
  git reset --hard b342666cb3f39309f39e7a61d6b2f440b37035fb
  cd ..
	cd Spacefox
	git reset --hard f840e53652764021c3edb290b6ecb09f809b9e4b
	cd ..
	cd Taffer
	git reset --hard 70b57c5595b97c33f674cc7c746a8d4640f76f99
	cd ..
	cd Tergel
	git reset --hard 6772c2aafa72cf2647cb5aa24ee55969df698b72
	cd ..
	cd Wanderlust
	git reset --hard a105813b95e57a9e468c56c681afab819504814d
	cd ..
	cd ..
fi
echo Copying graphics packs into the LNP directory structure
cp gfx/* $DEST_DIR/LNP/graphics/ -r

#Get Dwarf Fortress
if [ ! -f $DF ]; then
	echo Downloading $DF
	wget -qnc http://bay12games.com/dwarves/$DF
fi
echo Extracting $DF
tar jxf $DF -C $DEST_DIR/
mv $DEST_DIR/df_linux/libs/libstdc++.so.6 $DEST_DIR/df_linux/libs/libstdc++.so.6.bak

#Get DFHack
if [ ! -f $DFHACK ]; then
	echo Downloading $DFHACK
	wget -qnc $GH/DFHack/dfhack/releases/download/$DFHACK_VER/$DFHACK
fi
echo Extracting $DFHACK
tar jxf $DFHACK -C $DEST_DIR/df_linux
mv ./$DEST_DIR/df_linux/dfhack.init-example ./$DEST_DIR/df_linux/dfhack.init

#get Text Will Be Text
if [ ! -f $TWBT ]; then
	echo Downloading $TWBT
	wget -qnc $GH/mifki/df-twbt/releases/download/$TWBT_VER/$TWBT
fi
echo Extracting $TWBT
unzip -qq -o $TWBT -d twbt
cd twbt
chmod 700 *.png
cp *.png ../$DEST_DIR/df_linux/data/art
cp realcolors.lua ../$DEST_DIR/df_linux/hack/scripts/
cp $DFHACK_VER/* ../$DEST_DIR/df_linux/hack/plugins/
cd ..

#Get Dwarf Therapist
mkdir $DEST_DIR/LNP/utilities/dwarf_therapist
if [ ! -d Dwarf-Therapist ]; then
	echo Downloading Dwarf Therapist
	git clone -q $GH/splintermind/Dwarf-Therapist.git
	echo compiling Dwarf Therapist, please be patient.
	cd Dwarf-Therapist
	qmake
  make > /dev/null 2>&1
	cd ..
fi
echo Copying Dwarf Therapist into LNP directory structure
cd Dwarf-Therapist
cp release/DwarfTherapist ../$DEST_DIR/LNP/utilities/dwarf_therapist
cp share ../$DEST_DIR/LNP/utilities/dwarf_therapist -r
cp hammer.* ../$DEST_DIR/LNP/utilities/dwarf_therapist
cp LICENSE.txt ../$DEST_DIR/LNP/utilities/dwarf_therapist
cp README.rst ../$DEST_DIR/LNP/utilities/dwarf_therapist
cp CHANGELOG.txt ../$DEST_DIR/LNP/utilities/dwarf_therapist
cp dist/dwarftherapist ../$DEST_DIR/LNP/utilities/dwarf_therapist
cd ..

#Get Armok Vision
if [ ! -f $ARMOK_VISION ]; then
	echo Downloading $ARMOK_VISION
	wget -qnc $GH/JapaMala/armok-vision/releases/download/$ARMOK_VISION_VER/$ARMOK_VISION
fi
mkdir ./$DEST_DIR/LNP/utilities/armok_vision
echo Extracting $ARMOK_VISION
unzip -qq -o $ARMOK_VISION -d ./$DEST_DIR/LNP/utilities/armok_vision

#Get SoundSense
if [ ! -f $SOUNDSENSE ]; then
	echo Downloading $SOUNDSENSE
	wget -qnc http://df.zweistein.cz/soundsense/$SOUNDSENSE
fi
echo Extracting $SOUNDSENSE
unzip -qq -o $SOUNDSENSE  -d ./$DEST_DIR/LNP/utilities/
chmod +x ./$DEST_DIR/LNP/utilities/soundsense/soundSense.sh
dos2unix -q ./$DEST_DIR/LNP/utilities/soundsense/soundSense.sh
find ./$DEST_DIR/LNP/utilities/soundsense -name configuration.xml -exec sed -i "s/..\/gamelog.txt/..\/..\/..\/df_linux\/gamelog.txt/g" {} \;
#Get DF Announcement Filter
if [ ! -f DFAnnouncementFilter.zip ]; then
	echo Downloading DFAnnouncementFilter.zip
	wget -qnc http://dffd.bay12games.com/download.php?id=7905\&f=DFAnnouncementFilter.zip -O DFAnnouncementFilter.zip
fi
echo Extracting DFAnnouncementFilter.zip
unzip -qq -o DFAnnouncementFilter.zip -d ./$DEST_DIR/LNP/utilities/df_announcement_filter

#Get Legends Browser
if [ ! -f $LEGENDS_BROWSER ]; then
  echo Downloading $LEGENDS_BROWSER
  wget -qnc $GH/robertjanetzko/LegendsBrowser/releases/download/$LEGENDS_BROWSER_VER/$LEGENDS_BROWSER
fi
mkdir ./$DEST_DIR/LNP/utilities/legends_browser
cp $LEGENDS_BROWSER ./$DEST_DIR/LNP/utilities/legends_browser
echo '#!/bin/bash' > ./$DEST_DIR/LNP/utilities/legends_browser/LegendsBrowser.sh
echo 'java -jar' $LEGENDS_BROWSER >> ./$DEST_DIR/LNP/utilities/legends_browser/LegendsBrowser.sh
chmod +x ./$DEST_DIR/LNP/utilities/legends_browser/LegendsBrowser.sh
echo 'Legends Browser Exclusions' >> ./$DEST_DIR/LNP/utilities/exclude.txt
echo '['$LEGENDS_BROWSER']' >> ./$DEST_DIR/LNP/utilities/exclude.txt

#Copy curses_640x300.png to all graphics packs
echo Copy curses_640x300.png to all graphics packs
echo ./$DEST_DIR/LNP/graphics/*/data/art/ | xargs -n 1 cp ./$DEST_DIR/LNP/baselines/$DF_BASELINES_VER/data/art/curses_640x300.png

#Set sane defaults for all graphics packs
echo  Setting sane defaults for all graphics packs and vanilla
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[AUTOSAVE\:\(.*\)\]/\[AUTOSAVE\:SEASONAL\]/g" {} \;
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[AUTOSAVE_PAUSE\:NO\]/\[AUTOSAVE_PAUSE\:YES\]/g" {} \;
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[AUTOBACKUP\:\(.*\)\]/\[AUTOBACKUP\:YES\]/g" {} \;
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[SHOW_FLOW_AMOUNTS\:NO\]/\[SHOW_FLOW_AMOUNTS\:YES\]/g" {} \;
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[POPULATION_CAP\:\(.*\)\]/\[POPULATION_CAP\:120\]/g" {} \;
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[STRICT_POPULATION_CAP\:\(.*\)\]/\[STRICT_POPULATION_CAP\:220\]/g" {} \;
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[BABY_CHILD_CAP\:\(.*\)\:\(.*\)\]/\[BABY_CHILD_CAP\:10\:20\]/g" {} \;
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[VISITOR_CAP\:\(.*\)\]/\[VISITOR_CAP\:100\]/g" {} \;
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[INVASION_SOLDIER_CAP\:\(.*\)\]/\[INVASION_SOLDIER_CAP\:120\]/g" {} \;
find ./$DEST_DIR -name \d_init.txt -exec sed -i "s/\[INVASION_MONSTER_CAP\:\(.*\)\]/\[INVASION_MONSTER_CAP\:40\]/g" {} \;
find ./$DEST_DIR -name \init.txt -exec sed -i "s/\[FPS\:NO\]/\[FPS\:YES\]/g" {} \;
find ./$DEST_DIR -name \init.txt -exec sed -i "s/\[INTRO\:YES\]/\[INTRO\:NO\]/g" {} \;
find ./$DEST_DIR -name \init.txt -exec sed -i "s/\[SOUND\:YES\]/\[SOUND\:NO\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name \init.txt -exec sed -i "s/\[FONT\:\(.*\)\]/\[FONT\:curses_640x300.png\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name \init.txt -exec sed -i "s/\[FULLFONT\:\(.*\)\]/\[FULLFONT\:curses_640x300.png\]/g" {} \;
find ./$DEST_DIR/LNP/graphics -name \init.txt -exec sed -i "s/\[PRINT_MODE\:\(.*\)\]/\[PRINT_MODE\:TWBT\]/g" {} \;

#Set Phoebus as the default graphics pack
echo Setting Phoebus as the default graphics pack
cp $DEST_DIR/LNP/graphics/Phoebus/* $DEST_DIR/df_linux/ -R
echo '# List of raws merged by PyLNP:' > $DEST_DIR/df_linux/raw/installed_raws.txt
echo 'baselines/df_43_03' >> $DEST_DIR/df_linux/raw/installed_raws.txt
echo 'graphics/Phoebus' >> $DEST_DIR/df_linux/raw/installed_raws.txt

#Finalize the pack and create the tar.gz file for DFFD
cd $DEST_DIR
find . | grep .git | xargs rm -rf
find . -type f -name curses*.bmp | xargs rm
mkdir df_linux/data/save
echo Creating $LNP_VER.tar.gz
tar cfz LinuxLNP-$LNP_VER.tar.gz *
mv *.tar.gz ../../
cd ../../
echo Finished!