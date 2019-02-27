* Lazy-Newb-Pack-Linux v0.44.12-r02 x64
A small package to get people started with Dwarf Fortress on linux. Please take time to check out the [Official thread](http://www.bay12forums.com/smf/index.php?topic=163211.0). There are a few help documents in the [Wiki](https://github.com/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux/wiki) if you should get stuck.

If you like the work I've put into assembling this pack, please feel free to head over to my ** [Patreon](https://www.patreon.com/enay) ** page and buy me a coffee.  Or a beer.  Or a sammich.  I'm really not picky.

## Download Location
The Linux LNP Can be downloaded at the below location:

**[Dwarf Fortress File Depot](http://dffd.bay12games.com/file.php?id=12762)**

## Usage Instructions
Navigate to the extracted directory and run
```
$ ./startlnp
```

##### Terminal Configuration
When first launching a new version of the LNP, you'l be asked to select the terminal emulator used to launch Dwarf Fortress.  PyLNP will automatically detect several of the more popular terminal emulators, or you can specify a custom command.  Incorrectly configuring the terminal will result in Dwarf Fortress not launching properly.

If you run into troubles with this, consult the PyLNP documentation **[HERE](https://bitbucket.org/Pidgeot/python-lnp/overview#rst-header-platform-specific-notes)**

##### LNP Import Tips
When first launching a new version of the LNP, you'll be asked if you want to import files from a previous installation. If you select yes, open the previous version's df_linux folder in the file chooser dialog, then click ok. Selecting the LNP folder or the root of the pack will cause the import to fail. The import process will grab your DF saves, SoundSense and/or SoundCense sounds, gamelog, and dfhack history from the previous version.

## Included With This Package:
* [Pidgeot's PyLNP 0.13b Lazy Newb Pack Python interface](http://www.bay12forums.com/smf/index.php?topic=140808.0)
 * Utilities:
     * [DFHack Linux V0.44.12-r2 (gcc 4.8)](http://www.bay12forums.com/smf/index.php?topic=139553.0)
     * [TWBT 6.57](http://www.bay12forums.com/smf/index.php?topic=138754.0)
     * [Dwarf Therapist v41.0.3](https://github.com/Dwarf-Therapist/Dwarf-Therapist) (**compiled with qt5.5.1**)
     * [Soundsense r2016-1](http://df.zweistein.cz/soundsense/)
     * [SoundCenSe GTK 1.4.2](http://www.bay12forums.com/smf/index.php?topic=159567.0) (**Requires Mono, go [HERE](http://www.mono-project.com/download/#download-lin) for install instructions**)
     * [qfconvert 2.04](http://www.joelpt.net/quickfort/) (**See ./LNP/about/qfconvert.md for usage instructions**)
     * [DF Announcement Filter 1.01](http://www.bay12forums.com/smf/index.php?topic=130030.0) (**Requires Java**)
     * [Legends Browser 1.17.1](http://www.bay12forums.com/smf/index.php?topic=155307.0) (**Requires Java 8**)
     * [Armok Vision 0.19.1](http://www.bay12forums.com/smf/index.php?topic=146473.0)
 * Graphics (Now using [fricy's Updated tilesets](http://www.bay12forums.com/smf/index.php?topic=155882)!)
     * [16x16] ASCII
     * [16x16] [Afro](https://github.com/DFgraphics/Afro-Graphics)
     * [20x20] [AutoReiv](https://github.com/DFgraphics/AutoReiv)
     * [18x18] [CLA](https://github.com/DFgraphics/CLA)
     * [24x24] [GemSet](https://github.com/DFgraphics/GemSet)
     * [16x16] [Ironhand](https://github.com/DFgraphics/Ironhand)
     * [12x12] [Jolly Bastion](https://github.com/DFgraphics/Jolly-Bastion)
     * [16x16] [Mayday](https://github.com/DFgraphics/Mayday)
     * [32x32] [Meph-lite](https://github.com/jecowa/Meph)
     * [16x16] [Obsidian](https://github.com/DFgraphics/Obsidian)
     * [16x16] [Phoebus](https://github.com/DFgraphics/Phoebus)
     * [16x16] [Rally Ho](https://github.com/DFgraphics/Rally-Ho)
     * [16x16] [Spacefox](https://github.com/DFgraphics/Spacefox)
     * [20x20] [Taffer](https://github.com/DFgraphics/Taffer)
     * [16x16] [Tergel](https://github.com/DFgraphics/Tergel)
     * [16x16] [Wanderlust](https://github.com/DFgraphics/Wanderlust)


##   Dependencies
Install required packages

For Debian / Ubuntu
```
sudo apt-get install default-jre libsdl1.2debian libsdl-image1.2 libsdl-ttf2.0-0 libglu1-mesa libgtk2.0-0 libopenal1 libjpeg62 wget coreutils tar xterm sed python bzip2 qtchooser libqt4-script libqt4-scripttools libqt5script5 libqt5scripttools5 libqxt-core0 libqxt-gui0
```

For Fedora (25)
```
yum install SDL SDL_image SDL_ttf mesa-libGLU gtk2 zlib openal-soft xterm python qt qt-x11 bzip2 xorg-x11-fonts-Type1
```

## Tested On
* Debian Stretch - With deps listed above installed.

## Common Issues
See [the LNP Linux WIKI](https://github.com/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux/wiki/Common-Errors).

Also see [the DF Wiki](http://dwarffortresswiki.org/index.php/DF2014:Installation#Linux) for additional assistance.

***
## Linux LNP Changelog

### Release notes for 0.44.12-r03 ( TBD )
More DT compatability improvements

#### Major changes over previous version
* Updated TWBT to 6.57
* Included new lib that eliminates the need to launch DT with sudo or grant the executable additional capabilities

#### Minor changes over previous version
* Phoebus graphics pack updated

### Release notes for 0.44.12-r02 ( October 22, 2018 )
Updates to the LNP launcher, TWBT and Dwarf Therapist.

#### Major changes over previous version
* Updated PyLNP to 0.13b
* Updated Dwarf Therapist to 41.0.3
* Updated TWBT to 6.54

#### Minor changes over previous versions
* Manually updated manifest.json on the gprachics packs to allow them to show up in PyLNP.  The graphics pack repo I pull from hasn't been updated in a while, so I can't guarantee that every pack will work without issue.
* Dwarf Therapist is now provided as a single appImage file.  This should hopefully be more compatible on a wider range of systems.
* Various bugfixes

### Release notes for 0.44.12-r01 ( July 15, 2018 )
Dwarf Fortress has been updated to 0.44.12, so here you go!

#### Major changes over previous version
* Updated Dwarf Fortress to 0.44.12
* Updated DFHack to 0.44.12-r1
* Updated TWBT to 6.53
* Updated Dwarf Therapist to 40.1.2
  * removed memory layouts for DF 0.42.05 and older
  * fixed unit list during embark and fortress mode
  * fixed "Armor (any)" and "Clothing (any)" preferences
  * Custom roles or columns created since 40.0.0 using "Armor (any)" or "Clothing (any)" preferences are broken. Delete the preference from the role or grid view and re-add it again to fix them.

### Release notes for 0.44.10-r1 ( May 20, 2018 )
A new version has been pushed out, and now that all the utilities have been updated I'm able to create a pack for you!

#### Major changes over previous version
* Updated Dwarf Fortress to 0.44.10
* Updated DFHack to 0.44.10-r1
* Updated TWBT to 6.46
* Updated Armok Vision to 0.19.01
* Updated Dwarf Therapist to 40.0.0
  * Config file location has changed.  To keep your old settings, move ``~/.config/UDP Software/Dwarf Therapist.ini`` to ``~/.config/dwarftherapist/dwarftherapist.ini``
* Updated Legends Browser to 1.17.1

#### Minor changes over previous version
* Updated graphics packs
  * At the time of this release, not all of the graphics packs have been officially updated for this version, but I've manually set manifest.json for those packs to allow them to be used.  I believe they should all be compatible with this version, but please let me know if this is not the case.  I'll keep an eye on the DFGraphics repo and release a new revision when they've all been brought up-to-date.

### Release notes for 0.44.09-r1 ( Apr 8, 2018 )
A few updates have been pushed out the last few weeks, and I'm now getting caught up.

#### Major changes over previous version
* Updated Dwarf Fortress to 0.44.09
* Updated DFHack to 0.44.09-r1
* Updated TWBT to 6.41
* Updated Armok Vision to 0.19.01
* Updated Dwarf Therapist to 39.3.1
* Updated Legends Browser to 1.17.1

#### Minor changes over previous revision
* Updated graphics packs

### Release notes for 0.44.05-r02 ( Mar 3, 2018 )
DFHack 0.44.05-r2 has been released.

#### Major changes over previous revision
* Updated DFHack to 0.44.05-r2
* Updated Dwarf Therapist to 39.2.1
* Updated Legends Browser to 1.17
* Updated TWBT to 6.35


#### Minor changes over previous revision
* Updated graphics packs


### Release notes for 0.44.05-r01 ( Feb 06, 2018 )
DFHack is now out of beta testing, so here's a new pack!

#### Major changes over previous revision
* Updated DFHack to 0.44.05-r1
* Updated TWBT to 6.34


### Release notes for 0.44.05-rc1 ( Jan 17, 2018 )
I discovered after releasing the last revision that the graphics packs I've been including had undergone a change to the directory structure to seperate the TWBT portions from the rest.  I've accounted for that change in this revision and the packs should now be TWBT-ready out of the box (as long as you play with DFHack enabled)

#### Major changes over previous revision
* Updated Dwarf Fortress to 0.44.05
* Updated DFHack to 0.44.05-alpha1
* Updated TWBT to 6.33
* Updated Meph-lite to 2.2
* Updated Dwarf Therapist to 39.2.0


### Release notes for 0.44.04-rc1 ( Jan 13, 2018 )
A new Dwarf Fortress update calls for a new revision of the LNP!

#### Major changes over previous revision
* Dwarf Fortress updated to 0.44.04
* Updated DFHack to 0.44.04-alpha1
* Updated TWBT to 6.32
* Updated Meph-lite tileset to 2.1

#### Minor changes over previous revision
* Included EXPERIMENTAL memory layout for Dwarf Therapist

### Release notes for 0.44.03-rc2 ( Jan 3, 2018 )
TWBT has been updated to work with the latest DFHack beta.  Also, the pack now includes the most up-to-date version of Meph's tileset.  I originally intended to put this in the rc1, but accidentally included an older version instead.

#### Major changes over previous revision
* Updated DFHack to 0.44.03-beta1
* Updated TWBT to 6.31
* Updated Meph's tileset to 1.7.5

#### Minor changes over previous revision
* Update graphics packs

### Release notes for 0.44.03-rc1 ( Dec 31, 2017 )
A new version of Dwarf Fortress has been released, and DFHack was quickly updated to support it.  Also Dwarf Therapist now comes in an AppImage package to improve cpmpatability (at the cost of a slightly larger download)

#### Major changes over previous revision
* Updated DF to 0.44.03
* Updated DFHack to 0.44.03-alpha1
* Updated TWBT to 6.28
* Updated Dwarf Therapist to 39.1.2
* Added an LNP-friendly version of Meph's tileset

#### Minor changes over previous revision
* Updated graphics packs
* moved _VanillaDF*.png, white1px.png, and transparent1px.png to LNP/tilesets

### Release notes for 0.44.02-rc4 ( Dec 10, 2017 )

TWBT has been updated to work with the prerelease version of DFHack.  As a result, GemSet has also been added back into the pack.

#### Major changes over previous revision
* Updated TWBT to 6.23

#### Minor changes over previous revision
* Updated graphics packs to latest versions
* Re-included GemSet graphics pack


### Release notes for 0.44.02-rc3 (Dec 8, 2017)

A prerelease build of DFHack has been released and is being included in this revision.  At the time of this writing, TWBT hasn't yet been updated and is therefore still excluded for the time being.

#### Minor changes over previous revision
* Updated graphics packs to include latest changes

#### Major changes over previous revision
* Updated DFHack to 0.44.02-alpha1
* Dwarf Therapist updated to v39.0.0
* Legends Browser updated to v1.15
* Armok Vision updated to v0.18.0

### Release notes for 0.43.05-r07 (Nov 21, 2017)
This is the final update for the 0.43.05 Linux LNP.  0.44 has alredy dropped for Windows and Mac.  Just waiting for Toady to get his Linux build uploaded and I'll start working on that!
Other than updates to a few of the utilities, I have configured the LNP importer to be grab custom stock settings from previous versions.

##### Major changes over previous revision:
* Updated DFHack to 0.43.05-r3.1
* Updated Armok Vision to 0.18.0
* Updated Dwarf Therapist to 38.1.0
* Updated Legends Browser to 1.14
* Updated TWBT to 6.22
* Updated SoundCenSe GTK to 1.4.4

### Release notes for 0.43.05-r06 (July 20, 2017)

A bug was found (Thanks [Bulwersator](http://www.bay12forums.com/smf/index.php?topic=163211.msg7507158#msg7507158)!) with the version of Dwarf Therapist I was distributing with the LNP that caused it to crash when a squad is present.  I replaced it with Hello71's fork built with Qt5.5.1.

##### Major changes over previous revision:
* Updated DFHack to v043.05-r2
* Updated Armok Vision to v0.17.0
* Updated Legends Browser to v1.13
* Updated TWBT to v5.85

##### Minor changes over previous revision:
* Reduced default visitor cap from 100 down to 50 to reduce possible FPS death
* Temporarily including baseline files (PyLNP baseline downloader bugged for the moment)
* Replaced deprecated `realpath` with `readlink -f` in a the wrapper scripts for DF Announcement filter, Dwarf Therapist, and Legends Browser
* Removed error-causing comma from PyLNP.user (Thanks [@Tymewalk](http://www.bay12forums.com/smf/index.php?topic=163211.msg7503284#msg7503284))
* Replaced Dan Fritz's fork of Dwarf Therapist with Hello71's fork due to a crash when reading dwarves while a military is in place (Thanks [@Bulwersator](http://www.bay12forums.com/smf/index.php?topic=163211.msg7507158#msg7507158)
)
##### Utilities included:
* PyLNP 0.12b
* DF 0.43.05
* DFHack 0.43.05-r2
* Dwarf Therapist 37.0.0 (Hello71's fork built with Qt 5.5.1)
* TWBT 5.85
* Soundsense r2016-1
* SoundCenSe GTK 1.4.2
* Armok Vision 0.17.0
* Legends Browser 1.13

***
### Release notes for 0.43.05-r05 (July 3, 2017)

##### Minor changes over previous revision:
* Fixed wrapper scripts for Legends Browser and DF Announcement Filter
* Turned on PyLNP update check at launch

##### Utilities included:
* PyLNP 0.12b
* DF 0.43.05
* DFHack 0.43.05-r1
* Dwarf Therapist 37.0.0 (DanFritz's fork built with Qt 4.8.7)
* TWBT 5.84
* Soundsense r2016-1
* SoundCenSe GTK 1.4.2
* Armok Vision 0.16.2
* Legends Browser 1.12.2

***
### Release notes for 0.43.05-r04 (July 3, 2017)
##### Major changes over previous revision:
* Fixed missing DFHack libs due to improper .tar creation

##### Minor changes over previous revision:
* Refreshed embark profiles.  Not sure how it happened, but there were minor discrepancies between the embark profiles in PeridexisErrant's LNP and my own.  This is no longer the case.
* Fixed EMBARK_RECTANGLE typo in d_init.txt
* Fixed dwarftherapist script causing potential issues with finding the memory layouts

##### Utilities included:
* PyLNP 0.12b
* DF 0.43.05
* DFHack 0.43.05-r2
* Dwarf Therapist 38.1.0 (Qt 5.5.1)
* TWBT 6.21
* Soundsense r2016-1
* SoundCenSe GTK 1.4.2
* Armok Vision 0.18.0
* Legends Browser 1.13

***
### Release notes for 0.43.05-r03 (June 27, 2017)
##### Major changes over previous revision:

##### Minor changes over previous revision:
* Fixed duplicate axes in some embark profiles
* Began placing README and/or help files for various utilities in ./LNP/about folder
* Fixed PyLNP auto-import path for sounds
* Reset EMBARK_RECTANGLE from 4:4 to 3:3

##### Utilities included:
* PyLNP 0.12b
* DF 0.43.05
* DFHack 0.43.05-r1
* Dwarf Therapist 37.0.0 (DanFritz's fork built with Qt 4.8.7)
* TWBT 5.84
* Soundsense r2016-1
* SoundCenSe GTK 1.4.2
* Armok Vision 0.16.2
* Legends Browser 1.12.2

***
### Release notes for 0.43.05-r02 (June 23, 2017):
##### Major changes over previous revision:

* Compiled Dwarf Therapist with Qt4 for better compatability
* Updated Legends Browser to 1.12.2
* Updated PyLNP to 0.12b

##### Minor changes over previous revision:
* Began distributing with a README file for version history, release notes, troubleshooting tips, etc
* Reverted Phoebus font back to default setting of Jecobus_10x16
* Removed problematic onLoad.init from graphics packs (known to cause issues, see report **[HERE](http://www.bay12forums.com/smf/index.php?topic=126076.msg7486347#msg7486347)**)
* Changed macro key delay from from 15 ms to 0 ms to speed up macros (As PeridexisErrant pointed out with the Windows LNP)
* Fixed Dwarf Therapist script to better detect its location
* Changed Legends Browser to call a script rather than the .jar file directly.  Some distros (Fedora at least) don't allow the launching of .jar files directly

##### Utilities included:
* PyLNP 0.12b
* DF 0.43.05
* DFHack 0.43.05-r1
* Dwarf Therapist 37.0.0 (DanFritz's fork built with Qt 4.8.7)
* TWBT 5.84
* Soundsense r2016-1
* SoundCenSe GTK 1.4.2
* Armok Vision 0.16.2
* Legends Browser 1.12.2

***
### Release notes for 0.43.05-r01 (June 8, 2017):
##### Major changes over previous revision:
* Updated DFHack to 0.43.05-r1.
* Updated TWBT to 5.84.
* Updated Legends Browser to 1.12.1.

##### Minor changes over previous revision:
* Added extra color schemes from wiki
* Removed Western Rust color scheme (incomplete scheme, caused issues with PyLNP)
* Added ```export LD_LIBRARY_PATH=""``` to the beginning of distro_fixes script for improved compatibility
* Tweaked DT launcher script to work better with LNP directory structure
* Included outdated (but still very useful) DT Manual
* Fixed gui/manager-quantity keybind
* Replaced obsolete references of autolabor with labormanager
* Other general cleanup/housekeeping

##### Utilities included:
* PyLNP 0.12a
* DF 0.43.05
* DFHack 0.43.05-r1
* Dwarf Therapist 37.0.0 (Hello71's fork built with Qt 5.7.1)
* TWBT 5.84
* Soundsense r2016-1
* SoundCenSe GTK 1.4.2
* Armok Vision 0.16.2
* Legends Browser 1.12.1

***
## Dwarf Fortress Changelog
### Release notes for 0.43.05 (July 5, 2016):
Here are the first official 64-bit releases!  This would not be possible without help from our community -- you can view the exciting and sometimes late-night discussion over in the 0.43.04 release thread if you want to see how the cake was baked.  This release should also make worlds generated with the same seed more consistent, and it has a few other minor fixes we managed to sneak in.

##### New stuff
* 64-bit support, pulling the game from the distant past into the previous decade

##### Major bug fixes
* Fixed problem with artistic skill assignment causing world histories to diverge
* Fixed problem with worldgen trade causing world histories to diverge

##### Other bug fixes/tweaks
* Stopped babies/children from competing in w.g. events
* Made gorlaks able to open doors, stopped desizing of their heads
* Fixed some mem leaks

***

### Release notes for 0.43.04 (June 20, 2016):
Here's another bug-fix release.  Assuming no issues crop up immediately, we'll now dive into 64-bit land for next time!

##### Major bug fixes
* Fixed error deciding when patients should be moved
* Fixed initialization problem with tools causing stone axes to be thought of as ranged
* Stopped completed work order jobs from checking off every matching order
* Stopped masterpiece trades in containers from triggering artwork defacement
* Stopped storage from always failing in the second tavern/library/temple you define
* Stopped broken crash-prone entry from appearing at the end of the stocks list

##### Other bug fixes/tweaks
* Attackers will remove armor from unconscious opponents if it is blocking attacks
* Made people wear more armor according to their roles again
* Allowed new citizens with some previously site-wide occupations to be reassigned
* Allowed some site-wide occupations for dwarves
* Made combat damage weapon and armors depending on material differences etc.
* Made dwarves prefer undamaged equipment during the periodic uniform upgrades
* Allowed strong attacks/shakes to translate some force to joints and parent parts even if blocked by armor
* Reduced clothing stopping power based on penetration depth
* Made paper slurries stockpile-able (won't work without updated raws)
* Fixed problem with adv mode tribute demand check
* Fixed ghost initial positioning problem
* Made macros save correctly even if the macro directory is deleted

***

### Release notes for 0.43.03 (May 22, 2016):
Here are some more bug fixes.

##### Major bug fixes
* Made customized magma forge jobs use metal instead of making things out of coal
* Adjusted conflict code to stop taverngoers from joining siegers over petty grievances
* Fixed material overcount in adv site work menu

##### Other bug fixes/tweaks
* Made pain from broken tissues depend on relative part size
* Made embark profiles load fish properly
* Made assigning an animal to a restraint remove it from pasture assignments properly
* Made pasturing jobs respect connectivity in creation and in seeing if they should continue
* Made dwarves remove animals assigned to pastures from cages/chains that are in the pasture
* Fixed display error causing creature to be described as gigantic too often
* Allowed metal mechanisms to be made from the job manager
* Made dragonfire affect metal items and generally amplified fire effects a bit
* Stopped veins in large mineral clusters from being improperly restricted
* Stopped placement issue with minerals that had more than one specific environment
* Stopped woodcutters from using axes without edges (like training axes)
* Allowed soil critters to live in wider temperature ranges
* Fixed problem with temperature checks on certain wilderness populations
* Made construct mechanisms job show material
* Made mountain travel restriction not affect other actions
* Allowed adventure mode divers to move through deep water properly
* Made placing items on tables remove item from your inventory properly
* Made improvement reactions increase and apply skill properly
* Reported site of adventurer masterpieces correctly
* Stopped manually-set low frame rate cap from being stuck

***

### Release notes for 0.43.02 (May 11, 2016):
Smoothed out some rough areas in the adventure part of the release.  We'll be continuing on with bug fix releases.

##### Major bug fixes
* Stopped zone corruption problem from adventure sites (caused crashes)
* Stopped adventure camps from being aged by the age of the world repeatedly
* Stopped certain site build orders from skipping the collapse check
* Stopped prisoners in goblin sites from starting no quarter fights with their rescuers
* Made people that join you stop personal/shared activities that might interfere them from following you

##### Other bug fixes/tweaks
* Stopped felling of trees in the arena, so you wouldn't be teleported to a weird hidden region map
* Indicated child/baby state of prisoners during look etc.

***

### Release notes for 0.43.01 (May 9, 2016):
A new version number!  With the work order additions and adventurer-created sites, this one ended up with more new stuff and fewer bug fixes than expected, and my version calculator just tipped over at 0.43.  You can use the new 'b' site building option in adventure mode to create a site (outside the bounds of other sites).  For dwarf mode work orders, you can set conditions and details from the manager.  You can also create orders tied to specific shops from their workshop profiles.

A miscellaneous note: in order to retire at the adventurer sites you create, you'll need to name the site, create a main hall zone, and claim the hall during conversation (or while shouting to yourself).

Next up we'll be doing more bug fix releases to make sure we have a vaguely presentable DF before we disappear into a new compiler and 64 bits.

##### New stuff
* Ability to build up new sites in adv mode, either yourself or by assigning companions
* Ability to do carpentry in adv mode
* Ability to chop down trees in adv mode
* Ability to make stone axes in adv mode
* Ability to pull branches from trees in adv mode
* Can put start conditions on work orders (by amount of resources or dependence on other work orders)
* Can specify materials/images/etc. in work orders
* Can create work order from profile which is tied to specific workshop
* Can set maximum number of shops that a general work order can task at once
* Can set maximum number of general work orders per shop or disallow them by profession or altogether (note: this won't work for active old-save jobs)
* Allowed perpetual work orders
* Repeatable work orders, ability to set restart frequencies

##### Major bug fixes
* Stopped masterpiece trading from causing artisans to suffer effects of art defacement

##### Other bug fixes/tweaks
* Got rid of work order limit of 30 jobs
* Improved work order filtering (respect partial vs. full results etc.)
* Stopped work orders from taking more than one slot per workshop
* Stopped non-citizens from being charged for violating production orders
* Stopped mother from getting both her and spouse's miscarriage thought
* Refreshed material list when deleting uniform item
* XML export now has the exact site rectangle

## Credits & Special Thanks
 * [@algorithman](https://github.com/Algorithman/SoundCenSe/releases) Writer and maintainer of SoundCenSe GTK, the C#/GTK port of @Zweistein's SoundSense utility
 * [@andrewd18](https://github.com/andrewd18/) Andrew Dorney made the awesome linux LNP installer script
 * [@amfournda](https://github.com/amfournda/) Created a great gentoo fix script included in the pack
 * [@beaubouchard](https://github.com/BeauBouchard) Previous maintainer of this package
 * [@Captain Duck](https://www.youtube.com/playlist?list=PL0sBhCMFBvPlF7wG7OH-NFQKMeCQiS8aM) Just all around great guy, watch his Dwarf Fortress Tutorial series and subscribe!
 * [@CarterScottM](https://www.github.com/CarterScottM) Current maintainer of the Linux Pack
 * [@Clément](http://www.bay12forums.com/smf/index.php?topic=168411.0)Current Maintainer of Dwarf Therapist
 * [@DanFritz](https://github.com/DanFritz/) His fork of Dwarf Therapist was used to compile DT with Qt4
 * [@Daveralph](https://github.com/daveralph1234/LazyNewbPack/) continued working on LNP after Dricus
 * [@Dricus](https://github.com/Dricus)   Dirk Groot is the creator of the cross platform LNP port
 * [@Dwimenor](https://github.com/Dwimenor/) Created a workaround for LNP, as well as providing linux support
 * [@fricy](https://github.com/fricy/) Maintains the MacNewbie pack Reborn as well as supporting essential gaphic repo
 * [@Hello71](https://github.com/Hello71) Hello71's fork of Dwarf Therapist was used to compile DT with Qt5
 * [@Japa](http://www.bay12forums.com/smf/index.php?topic=146473.0) Creator/maintainer of Armok Vision
 * [@Jecowa](http://http://www.bay12forums.com/smf/index.php?action=profile;u=106607)Provided LNP-friendly version of Meph's tileset, and other contributions to the graphics packs
 * [@joelpt](http://www.joelpt.net/quickfort/) Joel Thornton Created Quickfort 2.x
 * [@lethosor](https://github.com/lethosor) Works on DFhack, DFwiki, and many other Dwarf Fortress related projects
 * [@LucasUP](https://github.com/LucasUP/) Lucas Paquette made the original Windows LNP
 * [@Mechanixm](https://www.reddit.com/r/MechGuides/) for writing an incredible set of guides for stockpiles, pressure plates and levers, among other things
 * [@Meph](http://www.bay12forums.com/smf/index.php?topic=161047.0) Creator of Meph's tileset
 * [@miffedmap](https://github.com/miffedmap) Actively perfecting cross distro compatibility
 * [@mifki](https://github.com/mifki) Text Will Be Text dfmultiscroll and webfort
 * [@PeridexisErrant](http://www.bay12forums.com/smf/index.php?topic=126076.0) Maintains the Windows Pack
 * [@Pidgeot](https://bitbucket.org/Pidgeot/python-lnp/) Michael is a Founding developer of PyLNP
 * [@splintermind](https://github.com/splintermind/) Josh, part time wizard works dilligently on Dwarf Therapist
 * [@Zweistein](http://zweistein.cz/) Created Soundsense, enriching the game with awesome sound packages!


If I forgot people, please let me know and I'll include them in the list.
