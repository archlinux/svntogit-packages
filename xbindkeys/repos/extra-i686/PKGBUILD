# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=xbindkeys
pkgver=1.8.2
pkgrel=2
pkgdesc="xbindkeys allows you to launch shell commands with your keyboard or your mouse under X Window"
arch=(i686 x86_64)
url="http://hocwp.free.fr/xbindkeys"
depends=('libx11' 'guile>=1.8.1' 'tk')
source=($url/${pkgname}-${pkgver}.tar.gz)
md5sums=('ad1abd56e758bc108493ad0e5b862ad3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

