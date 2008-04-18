# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>
# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>

pkgname=ode
pkgver=0.9
pkgrel=1
pkgdesc="An open source, high performance library for simulating rigid body dynamics"
arch=('i686' 'x86_64')
url="http://www.ode.org"
license=('LGPL' 'BSD')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/sourceforge/opende/${pkgname}-src-${pkgver}.zip)
md5sums=('4c03759b76a0649a6d5108c8e172e1e4')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -Dm0644 $startdir/src/${pkgname}-${pkgver}/LICENSE-BSD.TXT \
 		  $startdir/pkg/usr/share/licenses/${pkgname}/LICENSE-BSD.TXT
}

