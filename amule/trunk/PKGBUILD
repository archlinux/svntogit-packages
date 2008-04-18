# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Henrik Ronellenfitsch <searinox@web.de>

pkgname=amule
pkgver=2.1.3
pkgrel=4
pkgdesc="aMule is a eMule-like client for ed2k p2p network"
arch=("i686" "x86_64")
license=('GPL')
url="http://www.amule.org"
depends=('wxgtk>=2.8.0.1' 'gd>=2.0.34' 'binutils>=2.17.50.0.18')
makedepends=('crypto++')
source=(http://heanet.dl.sourceforge.net/sourceforge/amule/aMule-${pkgver}.tar.bz2
	aMule-wx.patch)
md5sums=('0aafdd159edb8ad5f0064da87998b47d'
	  '7b61651b0abdee7dc577a03dad8025c1')
sha1sums=('dd47deb38e7a5b823550b85150f5a814c597b273'
	  'bd048f7b88ff4c19841f606d03c5a9750e6e6945')

build() {
  cd ${startdir}/src/aMule-${pkgver}
  patch -Np1 -i ${startdir}/src/aMule-wx.patch || return 1
  ./configure --prefix=/usr \
              --disable-embedded_crypto \
              --enable-utf8-systray \
              --enable-cas \
              --enable-wxcas \
              --enable-amule-daemon \
              --enable-amulecmd \
              --enable-amule-gui \
              --enable-alc \
              --enable-alcc \
	      --enable-webserver
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
