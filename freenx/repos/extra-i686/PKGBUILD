# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
#Contributed: eliott <eliott@solarblue.net>, Andre Naumann <anaumann@SPARCed.org> 
pkgname=freenx
pkgver=0.7.1
pkgrel=3
pkgdesc="Free Software (GPL) Implementation of the NX Server"
arch=(i686 x86_64)
url="http://freenx.berlios.de"
license=('GPL')
depends=('nxserver' 'gnu-netcat' 'openssh' 'expect' 'xorg-xauth' 'xorg-apps' 'xorg-fonts-misc' 'coreutils')
backup=(opt/NX/etc/node.conf)
install=freenx.install
source=(http://download.berlios.de/freenx/$pkgname-$pkgver.tar.gz kde-config.patch nscd-fix.patch nxdialog-fix.patch vnc-startup-fix.patch)

build() {
  # patch and install nxserver
  cd $startdir/src/$pkgname-$pkgver
  # patch from inside nx
  patch < gentoo-nomachine.diff || return 1
  # fixed for archlinux
  patch -Np0 -i ../kde-config.patch || return 1
  patch -Np0 -i ../nscd-fix.patch || return 1
  patch -Np0 -i ../nxdialog-fix.patch || return 1
  patch -Np0 -i ../vnc-startup-fix.patch || return 1
  #sed -i -e 's,/usr/NX/bin/nxclient,/opt/NX/bin/nxclient-nomachine,g' nxdialog
  sed -i -e 's,authorized_keys2,authorized_keys,g' nxloadconfig
  sed -i -e 's,/usr/NX,/opt/NX,g' nxloadconfig
  sed -i 's,netcat,nc,g' nxloadconfig
  sed -i 's,/usr/X11R6/bin/xauth,/usr/bin/xauth,g' nxloadconfig
  #sed -i 's,COMMAND_MD5SUM=openssl md5,COMMAND_MD5SUM=md5sum,g' nxloadconfig
  sed -i 's,COMMAND_FOOMATIC="/usr/lib/cups/driver/foomatic-ppdfile",COMMAND_FOOMATIC="/usr/bin/foomatic-ppdfile",g' nxloadconfig
  sed -i 's|AGENT_EXTRA_OPTIONS_X=""|AGENT_EXTRA_OPTIONS_X="-co /usr/share/X11/rgb -fp /usr/share/fonts/misc,/usr/share/fonts/75dpi,/usr/share/fonts/100dpi,/usr/share/fonts/TTF,/usr/share/fonts/Type1 -xkbdir /usr/share/X11/xkb"|g' nxloadconfig
  sed -i 's,/etc/init.d/ssh,/etc/rc.d/sshd,g' nxsetup
  sed -i -e 's,#ENABLE_2_0_0_BACKEND="0",ENABLE_2_0_0_BACKEND="1",g' node.conf.sample 
  # fix key generation
  sed -i -e 's,AUTOMATIC="no",AUTOMATIC="yes",g' nxsetup
  install -D -m755 nxnode $startdir/pkg/opt/NX/bin/nxnode
  install -D -m755 nxserver $startdir/pkg/opt/NX/bin/nxserver
  install -D -m755 nxsetup $startdir/pkg/opt/NX/bin/nxsetup
  install -D -m755 nxkeygen $startdir/pkg/opt/NX/bin/nxkeygen
  install -D -m755 nxnode-login $startdir/pkg/opt/NX/bin/nxnode-login
  install -D -m755 nxloadconfig $startdir/pkg/opt/NX/bin/nxloadconfig
  install -D -m755 nxdialog $startdir/pkg/opt/NX/bin/nxdialog
  install -D -m755 nxviewer_helper $startdir/pkg/opt/NX/bin/nxviever_helper
  install -D -m755 nxcups-gethost $startdir/pkg/opt/NX/bin/nxcups-gethost
  install -D -m755 nxdesktop_helper $startdir/pkg/opt/NX/bin/nxdesktop_helper
  #install -D -m755 nxprint $startdir/pkg/opt/NX/bin/nxprint
  install -D -m755 node.conf.sample $startdir/pkg/opt/NX/etc/node.conf
  # install nxhelper
  cd nxserver-helper
  make
  install -D -m755 nxserver-helper $startdir/pkg/opt/NX/bin/nxserver-helper

  # create nxserver homedir
  mkdir -p $startdir/pkg/opt/NX/home/nx
}
md5sums=('80e7a57f787daabd0f80dfe8f58e67d3'
         '70788a41f6c965ce117e9f5a8809df2a'
         'a8548982d5bfa2f528dcb1dd76e0234b'
         '89476103e9795be3d6b7298317c0ce90'
         'bb999d23aa2005619385d0e8662e8967')
