# $Id$
#Maintainer: Damir Perisa <damir.perisa@bluewin.ch>
#Contributor: Robert Emil Berge

pkgname=swh-plugins
pkgver=0.4.15
pkgrel=1
pkgdesc="LADSPA Plugin-Collection from plugin.org.uk"
arch=(i686 x86_64)
url="http://plugin.org.uk/"
depends=('fftw' 'ladspa')
source=(http://plugin.org.uk/releases/$pkgver/$pkgname-$pkgver.tar.gz)
groups=('ladspa-plugins')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
