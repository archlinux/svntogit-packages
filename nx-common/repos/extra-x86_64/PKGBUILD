# $Id$
# Maintainer Tobias Powalowski <tpowa@archlinux.org>
# Contributed: eliott <eliott@solarblue.net>, Andre Naumann <anaumann@SPARCed.org>
pkgname=nx-common
pkgver=3.1.0
pkgrel=1
pkgdesc="NoMachine NX common package for client and server"
arch=('i686' 'x86_64')
license=('GPL')
url="http://nomachine.com/"
depends=('libjpeg' 'libpng' 'openssl>=0.9.8g' 'gcc-libs' 'audiofile' 'alsa-lib' 'bash')
source=(\
#Compression libs and proxy sources
http://64.34.161.181/download/3.1.0/sources/nxcomp-3.1.0-4.tar.gz \
http://64.34.161.181/download/3.1.0/sources/nxssh-3.1.0-1.tar.gz \
# ESD Support
http://64.34.161.181/download/3.1.0/sources/nxesd-3.1.0-1.tar.gz
# 64bit fixes
NXproto.h.64bit.diff)
options=(!libtool)


build() {
  cd $startdir/src
 
  mkdir -p $startdir/pkg/opt/NX/bin
  mkdir -p $startdir/pkg/opt/NX/lib 

  cd $startdir/src/nxcomp
  if [ "$CARCH" = "x86_64" ]; then
    patch -Np1 -i ../NXproto.h.64bit.diff  || return 1
  fi
  ./configure --prefix=/opt/NX
  make || return 1
  cp -a libXcomp.so.* $startdir/pkg/opt/NX/lib
  cd $startdir/pkg/opt/NX/lib
  ln -s libXcomp.so.1 libXcomp.so

  cd $startdir/src/nxssh
  ./configure --prefix=/opt/NX
  make || return 1
  install -D -m755 nxssh $startdir/pkg/opt/NX/bin/nxssh
 
  cd $startdir/src/nxesd
  ./configure --prefix=/opt/NX
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  # fix libxcomp linking
  cd $startdir/pkg/opt/NX/lib
  ln -s libXcomp.so.3 libXcomp.so.1
}
md5sums=('83b1d33085b04b338ec46f0c86ed5c1e'
         '511b4b344d60e4574cad349c64c280ce'
         'd096eec52553cfe5927c8fc01fc37c4a'
         '58341ba70dfab92ff38570071fbbf88a')
