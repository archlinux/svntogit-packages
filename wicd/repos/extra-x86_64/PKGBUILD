# Maintainer: Varun Acharya <varun@archlinux.org>
# Contributor: Rashif "Don Ray" Rahman <rayrashif@gmail.com>

pkgname=wicd
pkgver=1.4.1
pkgrel=4
pkgdesc="New and alternative wireless/wired network management utility"
arch=('i686' 'x86_64')
url="http://wicd.sourceforge.net/"
license=('GPL')
depends=('dbus-python' 'pygtk' 'dhclient' 'wpa_supplicant' 'ethtool')
conflicts=('wicd-svn')
install=wicd.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/wicd_$pkgver-src.tar.bz2 \
        wicd-daemon wicd.desktop wicd_in_usr.patch wicd-locale.patch)
options=(emptydirs)
md5sums=('c5dccf8df6d3995ad0aae0324af2302d' \
         '8835ed1d4aba7effe3f157eeb0b66443' \
         'a37f63a6c82491116d5b69540ae13d25' \
         '97736bc03057542e4184fe1bd33cbd20' \
         'b8edd56cf084347b0ae6dc0e02d1b747')         
                       
  
build() {
   
  #Change default location to /usr/lib
   patch -Np1 -i ${startdir}/wicd_in_usr.patch
   patch -Np1 -i ${startdir}/wicd-locale.patch
  
  #Create Directories
  mkdir -p ${startdir}/pkg/usr/lib
  mkdir -p ${startdir}/pkg/usr/share/locale
  mkdir -p ${startdir}/pkg/usr/share/wicd
  
  #Copying 
  cp -R ${startdir}/src/opt/wicd ${startdir}/pkg/usr/lib
  cp -R ${startdir}/src/usr/share/* ${startdir}/pkg/usr/share/
 
  #Moving stuff around to the right locations
  mv ${startdir}/pkg/usr/lib/wicd/translations/* ${startdir}/pkg/usr/share/locale/
  mv ${startdir}/pkg/usr/lib/wicd/images/ ${startdir}/pkg/usr/share/wicd
  rm -rf ${startdir}/pkg/usr/lib/wicd/translations
  ln -sf /usr/share/wicd/images/no-signal.png ${startdir}/pkg/usr/share/wicd/images/idle-signal.png
  
  
  #Remove unwanted .desktop file/broken symlinks
  rm ${startdir}/pkg/usr/share/applications/hammer-00186ddbac.desktop || return 1
  rm ${startdir}/pkg/usr/share/wicd/images/wicd.png
  rm ${startdir}/pkg/usr/share/pixmaps/wicd.png 
  rm ${startdir}/pkg/usr/lib/wicd/data/wicd.png

  # Leave init.d pseudo-daemon and add custom rc.d script
  cd ${startdir}
  install -D -m755 wicd-daemon pkg/etc/rc.d/wicd
    
  # Copy other system files
  cd $startdir/src/etc
  install -D -m644 dbus-1/system.d/wicd.conf \
  ${startdir}/pkg/etc/dbus-1/system.d/wicd.conf
  install -D -m755 acpi/resume.d/80-wicd-connect.sh \
  ${startdir}/pkg/etc/acpi/resume.d/80-wicd-connexct.sh
  install -D -m644 ${startdir}/src/opt/wicd/images/wicd-purple.png \
  ${startdir}/pkg/usr/share/pixmaps/wicd.png
  install -D -m644 ${startdir}/src/opt/wicd/images/wicd-purple.png \
  ${startdir}/pkg/usr/share/wicd/images/wicd.png
  install -D -m644 ${startdir}/src/opt/wicd/images/wicd-purple.png \
  ${startdir}/pkg/usr/lib/wicd/data/wicd.png
  install -D -m644 ${startdir}/wicd.desktop \
  ${startdir}/pkg/usr/share/applications/wicd.desktop


  #Fix permissions
  chmod -R 755 ${startdir}/pkg/usr/lib/wicd
  find ${startdir}/pkg/usr/share -type d -exec chmod 755 {} \;
  find ${startdir}/pkg/usr/share -type f -exec chmod 644 {} \;

}
