# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=sane-frontends
pkgver=1.0.14
pkgrel=2
pkgdesc="A set of frontends for SANE."
arch=(i686 x86_64)
depends=('sane' 'gimp')
source=(ftp://ftp.sane-project.org/pub/sane/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
url="http://www.sane-project.org"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
md5sums=('c63bf7b0bb5f530cf3c08715db721cd3')
