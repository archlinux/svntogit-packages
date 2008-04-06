==========================
Cold/Hotplugging with Udev
==========================
Version 1.1.5
written by Tobias Powalowski <tpowa@archlinux.org>

---------------
* Requirements:
---------------
- recommended kernel >=2.6.18 for this udev to work properly.
- No more DevFS device paths!  If you have them, update /etc/fstab:
  /dev/discs/... etc. has been deprecated in favor of the old style:
    /dev/discs/disc0/part1 -> /dev/hda1
    /dev/discs/disc1/part2 -> /dev/hdb2
- /etc/modprobe.conf should be cleaned from old install entries (see below).

---------------
* Udev Changes:
---------------
- The syntax of udev rules has been changed in >=098 release, please update your rules.
  --- Snip Changelog Udev 098
  Renaming of some key names:
  BUS -> SUBSYSTEMS 
  ID -> KERNELS
  SYSFS -> ATTRS 
  DRIVER -> DRIVERS
  ATTR{file}="value" can be used now, to write to a sysfs file of the
  event device. Instead of:
    ..., SYSFS{type}=="0|7|14", RUN+="/bin/sh -c 'echo 60 > /sys$$DEVPATH/timeout'"
  we now can do:
    ..., ATTR{type}=="0|7|14", ATTR{timeout}="60"
  All the PHYSDEV* keys are deprecated and will be removed from a
  future kernel:
    PHYDEVPATH -    is the path of a parent device and should not be
                    needed at all.
    PHYSDEVBUS -    is just a SUBSYSTEM value of a parent, and can be
                    matched with SUBSYSTEMS==
    PHYSDEVDRIVER - for bus devices it is available as ENV{DRIVER}.
                    Newer kernels will have DRIVER in the environment,
                    for older kernels udev puts in. Class device will
                    no longer carry this property of a parent and
                    DRIVERS== can be used to match such a parent value.
  Note that ENV{DRIVER} is only available for a few bus devices, where
  the driver is already bound at device event time. On coldplug, the
  events for a lot devices are already bound to a driver, and they will have
  that value set. But on hotplug, at the time the kernel creates the device,
  it can't know what driver may claim the device after that, therefore
  in most cases it will be empty.
  --- snap Changelog Udev 098
- optional udev >= 099 Persistent rules generator for network and cd/dvd devices was added.

---------------
* How it works:
---------------
- Udev replaces the functionality of hotplug and hwdetect scripts.
- Udev does autoloading of modules and coldplugging.
- Udev loads the modules simultaneously, which is much faster, 
  but can cause some troubles with multiple network/sound/etc devices
  (see below).
- To reload your rules please use /etc/start_udev.

======================
* Autoloading modules:
======================

-------------------------------------------------------------------------
* Module autoloading is controlled by MOD_AUTOLOAD="" in /etc/rc.conf
-------------------------------------------------------------------------
MOD_AUTOLOAD="yes" in /etc/rc.conf is necessary: 
- if you want module autodetection
- if you want modules be loaded by udev (hotplugging and coldplugging)

MOD_AUTOLOAD="no" is necessary:
- if you want to load modules strictly using 'modprobe <module>'
- if you want to load only the modules listed in the MODULES=() array
  in /etc/rc.conf

---------------
* Blacklisting:
---------------
- means udev will never try to load the module, even if MOD_AUTOLOAD="yes"
  is set.

You can do this in 2 ways:
- MOD_BLACKLIST=(moduleA moduleB)
- MODULES=(!moduleA !moduleB)

Both entries mean the same thing to udev.  MOD_BLACKLIST was used by hwdetect.
hwdetect does not understand the MODULES= syntax, but it doesn't have to -- it
is only used in mkinitrd now.

==================================
* Boot parameter: load_modules=off
==================================

- No modules are loaded during boot using udev autoloading or the MODULES array
- Useful for repairing your system if something goes wrong during udev startup
  and/or during loading modules

==================================
* Boot parameter: disablemodules=
==================================

- list modules there that shouldn't be loaded by udev
- Syntax: disablemodules=module1,module2,module3,...
- Useful for repairing your system if something goes wrong during udev startup
  and/or during loading modules and you know the module that causes the trouble.

========================================
* Persistent CD/DVD symlinks (optional):
========================================

- To enable this feature copy in /etc/udev/rules.d
  75-cd-aliases-generator.rules.optinal
  to 75-cd-aliases-generator.rules
  Also disable this part in /etc/udev/rules.d/40-arch.rules by putting a # in front:
  --- snip
  ACTION=="add", SUBSYSTEMS=="ide", KERNEL=="hd[a-z]", ATTR{removable}=="1", ATTRS{media}=="cdrom*", RUN+="/lib/udev/cdsymlinks.sh"
  ACTION=="add", SUBSYSTEMS=="scsi", KERNEL=="sr[0-9]*", ATTRS{type}=="5", RUN+="/lib/udev/cdsymlinks.sh"
  ACTION=="add", SUBSYSTEMS=="scsi", KERNEL=="sg[0-9]*", ATTRS{type}=="5", RUN+="/lib/udev/cdsymlinks.sh"
  ACTION=="remove", SUBSYSTEMS=="block", KERNEL=="hd[a-z]", RUN+="/lib/udev/cdsymlinks.sh"
  ACTION=="remove", SUBSYSTEMS=="block", KERNEL=="sr[0-9]*", RUN+="/lib/udev/cdsymlinks.sh"
  ACTION=="remove", SUBSYSTEMS=="block", KERNEL=="sg[0-9]*", RUN+="/lib/udev/cdsymlinks.sh"
--- snap

- To get the same device name for CD/DVD symlinks each time you boot,
  a rule will be generated during bootup or by executing /etc/start_udev.
- Examples: dvd, cdrom ,cdrw etc.
- If you want to change those links,
  modify '/etc/udev/rules.d/70-peristent-cd.rules' to your needs.

Known issues:
The symlink name is then bound to the hardware pci adress, 
if you change your CD/DVD device, you have to check the
/etc/udev/rules.d/70-peristent-net.rules file for correctness.

======================================
* Persistent Network names (optional):
======================================

- To enable this feature copy in /etc/udev/rules.d
  75-persistent-net-generator.rules.optional
  to 75-persistent-net-generator.rules
- To get the same network device name each time you boot,
  a rule will be generated during bootup or by executing /etc/start_udev.
- Examples: eth0, eth1, wlan0 etc.
- If you want to change those names, 
  modify '/etc/udev/rules.d/70-peristent-net.rules' to your needs.
- NAME= determines the name of your network card. Use these names in your
  network configuration in rc.conf as well.

Known issues:
The interface name is then bound to the hardware mac adress, 
if you change your network card, you have to check the
/etc/udev/rules.d/70-peristent-net.rules file for correctness.

====================================
* Known Problems Hardware:
====================================

- BusLogic devices are broken and will cause a freeze during startup
Solution:
This is a kernel bug and no fix has been provided yet.

- PCMCIA Card readers are not treated as removabel devices.
Solution:
To get access to them with hal's pmount backend add them to /etc/pmount.allow

====================================
* Known Problems MOD_AUTOLOAD="yes":
====================================

-----------------------------------------------------------------------------
* Sound is not working or modules (eg. parport) are not loaded automatically:
-----------------------------------------------------------------------------
Solution:
- Do you have a clean /etc/modprobe.conf?
  - A clean /etc/modprobe.conf is empty.  The stock modprobe.conf file
    contains nothing
- alsaconf can write output to modprobe.conf. Please keep that in mind.

---------------------------------------------
* Devices get mixed up eg. Network/Soundcards
---------------------------------------------
- Because udev loads all the modules at once, sometimes devices are initialized
  in different orders (eg. network cards switch eth0 and eth1, sound cards
  the same)

Solution:
- Load them in MODULES=() array in the order you need them
- eg: MODULES=(moduleA moduleB)

Second solution for network:
- The "proper" way to configure net interfaces to hold static names within
  udev rules.  Add lines like these to a custom rules file such as
  /etc/udev/rules.d/01-network.rules:
    SUBSYSTEM=="net", SYSFS{address}=="aa:bb:cc:dd:ee:ff", NAME="lan0"
    SUBSYSTEM=="net", SYSFS{address}=="ff:ee:dd:cc:bb:aa", NAME="wlan0"

- To get the right mac address use this command:
    udevinfo -a -p /sys/class/net/<yourdevice>
- Make sure you use lower-case hex values in your udev rules.
- NAME= determines the name of your network card.  Use these names in your
  network configuration in rc.conf as well.

Third solution for network:
- check Persistent Network part

-----------------------------------
* Network 8139too & 8139cp problem:
-----------------------------------
- Both modules have the same kernel entry, which can cause problems.
Solution:
- Enter the one you need in MODULES=() and blacklist the other one
- eg: MODULES=(!8139cp 8139too)
- The example tells udev to ignore 8139cp module and load 8139too afterwards.

--------------------------------------------------------
* You need a special loading order to get devices going:
--------------------------------------------------------
- Kernel loads modules in wrong order.
Solution:
- Load them in the correct order in MODULES=()

-----------------------------
* Module is not autodetected:
-----------------------------
- If your device does not provide a modalias in /sys it cannot be autodetected.
- If modalias is not combined to a kernel module it cannot be autodetected.
Known modules that are not autodetected:
- SCSI CONTROLLER:
  scsi_transport_sas ultrastor qlogicfas eata BusLogic pas16 wd7000 sym53c416
  g_NCR5380_mmio fdomain u14-34f dtc initio in2000 imm t128 aha1542 aha152x
  atp870u g_NCR5380 NCR53c406a qlogicfas408 megaraid_mm advansys
- NETWORK CARDS:
  hp ne de4x5 wd cs89x0 eepro smc9194 seeq8005 ni52 ni65 ac3200 smc-ultra 
  at1700 hp-plus depca eexpress 82596 de600 eth16i de620 lance ewrk3 e2100
  lp486e 3c501 3c503 3c505 3c507 3c509 3c515 myri10ge
Solution:
- Enter the one you need in MODULES=()

=======================================
* Known Problems with MOD_AUTOLOAD="no"
=======================================

-----------------------------------------------------------------
* Modules are not loaded anymore during coldplug or hotplug event
-----------------------------------------------------------------
- Udev is usually responsible for this, but the MOD_AUTOLOAD switch will
  now disable it.  If you want automatic hot/cold-plugging, turn on
  MOD_AUTOLOAD.  Otherwise you will have to load all your modules manually,
  either with /sbin/modprobe or entries in the MODULES=() array.
Solution: 
- For bootup (coldplug) enter this in rc.conf: MODULES=(moduleA moduleB)  
- After bootup (hotplug) use this: modprobe <moduleA>

=========================================
* Known problems for custom kernel users:
=========================================

----------------------------
* Udev doesn't start at all:
----------------------------
- Check Requirements list
