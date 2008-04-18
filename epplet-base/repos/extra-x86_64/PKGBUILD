# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=epplet-base
pkgver=0.10
pkgrel=1
pkgdesc="Addon plugins for the enlightenment windowmanager"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL')
depends=('esd' 'imlib2' 'libtiff' 'glut' 'mesa' 'libcdaudio')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/enlightenment/epplets-$pkgver.tar.gz)
md5sums=('19f881141e18a4f4402af16738ee5ae7')

build() {
  cd $startdir/src/epplets-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
