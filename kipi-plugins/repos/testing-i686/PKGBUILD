# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

# 0.1.3-1 -> 0.1.3-2 : rebuild against exiv2=0.13, libnamechange 0.12 -> 0.13 - damir 
# 0.1.4-2: rebuild for libgpod 0.5.2 upgrade, aaron

pkgname=kipi-plugins
pkgver=0.1.5beta1
pkgrel=3
pkgdesc="libkipi plugins for digikam and kde apps"
arch=("i686" "x86_64")
license=('GPL')
url="http://www.kipi-plugins.org"
depends=('libkexiv2>=0.1.6' 'libkipi' 'libgphoto2' 'exiv2>=0.16' 'libgpod>=0.6.0' 'libkdcraw>=0.1.2')
makedepends=('kdepim')
install=('kipi-plugins.install')
source=("http://dl.sourceforge.net/sourceforge/kipi/$pkgname-0.1.5-beta1.tar.bz2")

build() {
  cd $startdir/src/$pkgname-0.1.5-beta1

  source /etc/profile.d/qt3.sh

  #make -f admin/Makefile.common
  ./configure --prefix=/opt/kde --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
 }
md5sums=('3fa1bae5de043dc92cfdadc7dd9e00bc')
