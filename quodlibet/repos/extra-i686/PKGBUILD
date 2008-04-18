#$Id$
#Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=quodlibet
pkgver=1.0
pkgrel=2
pkgdesc="An audio player written in pygtk"
license=('GPL')
arch=(i686 x86_64)
url="http://www.sacredchao.net/quodlibet/"
depends=('gstreamer0.10-python>=0.10.6-2' gstreamer0.10-mad gstreamer0.10-vorbis
         gstreamer0.10-alsa gstreamer0.10-gconf gstreamer0.10-gnomevfs \
         'pymad>=0.5.4-4' 'pyvorbis>=1.4-1' mutagen pygtk 'python>=2.5')
makedepends=(intltool)
install=quodlibet.install
source=(http://www.sacredchao.net/~piman/software/$pkgname-$pkgver.tar.gz)
md5sums=('5c925b754bd8505a7a66f2ffcc5b5fe4')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  sed -i "s|/share/man/|/man/|g" Makefile

  make extensions || return 1
  make DESTDIR=$startdir/pkg PREFIX=/usr INTLTOOL_EXTRACT=$(which intltool-extract) install
}
