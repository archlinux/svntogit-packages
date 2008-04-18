# $Id$
# Maintainer Tobias Powalowski <tpowa@archlinux.org>
# Contributed: eliott <eliott@solarblue.net>, Andre Naumann <anaumann@SPARCed.org>
pkgname=nxserver
pkgver=3.1.0
pkgrel=1
pkgdesc="NoMachine NX is the next-generation X compression and roundtrip suppression scheme."
arch=(i686 x86_64)
url="http://nomachine.com/"
license=('GPL')
depends=('nx-common>=3.1.0' 'libxaw' 'libxrender' 'libxp' 'gcc-libs' 'libjpeg' \
	 'libxpm' 'libpng' 'libxdamage' 'libxrandr' 'libxcomposite' 'libxtst' 'freetype2')
makedepends=('imake')
source=(\
#X11 support programs and libraries
http://64.34.161.181/download/3.1.0/sources/nx-X11-3.1.0-1.tar.gz \
http://64.34.161.181/download/3.1.0/sources/nxwin-3.1.0-1.tar.gz \
http://64.34.161.181/download/3.1.0/sources/nxauth-3.1.0-1.tar.gz \
http://64.34.161.181/download/3.1.0/sources/nxcomp-3.1.0-4.tar.gz \
#X11 Agent sources
http://64.34.161.181/download/3.1.0/sources/nxagent-3.1.0-2.tar.gz \
http://64.34.161.181/download/3.1.0/sources/nxcompsh-3.1.0-1.tar.gz \
#Compression libs and proxy sources
http://64.34.161.181/download/3.1.0/sources/nxproxy-3.1.0-2.tar.gz \
http://64.34.161.181/download/3.1.0/sources/nxcompext-3.1.0-2.tar.gz \
http://64.34.161.181/download/3.1.0/sources/nxcompshad-3.1.0-2.tar.gz \
#64bit fixes
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

  cd $startdir/src/nxcompshad
  ./configure --prefix=/opt/NX
  make || return 1
  cp -a libXcompshad.so* $startdir/pkg/opt/NX/lib

  cd $startdir/src/nxcompsh
  ./configure --prefix=/opt/NX
  make || return 1
  cp -a libXcompsh.so* $startdir/pkg/opt/NX/lib

  cd $startdir/src/nxproxy
  ./configure --prefix=/opt/NX
  make || return 1
  make prefix=$startdir/pkg/opt/NX install || return 1

  cd $startdir/src/nx-X11
  make World || return 1
  cp -a lib/X11/libX11.so* $startdir/pkg/opt/NX/lib
  cp -a lib/Xext/libXext.so* $startdir/pkg/opt/NX/lib
  cp -a lib/Xrender/libXrender.so* $startdir/pkg/opt/NX/lib
  install -D -m755 programs/Xserver/nxagent $startdir/pkg/opt/NX/bin/nxagent
  install -D -m755 programs/nxauth/nxauth $startdir/pkg/opt/NX/bin/nxauth

  cd $startdir/src/nxcompext 
  ./configure --prefix=/opt/NX
  make || return 1
  cp -a libXcompext.so* $startdir/pkg/opt/NX/lib

  # fix libXcompext linking
  cd $startdir/pkg/opt/NX/lib
  ln -s libXcompext.so.3 libXcompext.so.1
}

md5sums=('e3abbf75152037ac02b61bf991a2dfcc'
         '5a06b0a0b4f8b82cfb00d4005d8e6cfc'
         '75ee1a4140322645fcd2a8303cd306c7'
         '83b1d33085b04b338ec46f0c86ed5c1e'
         'e14977404b8abeb5de137bf16bf234a2'
         '64e52068bf83caaae831e059c8c077df'
         '6e2abffa850d89586c8df922e2f218bd'
         '746c2a65978a622d301eb2c5bea0b94c'
         '167af862593a494237a1a0b4adbbb600'
         '58341ba70dfab92ff38570071fbbf88a')
