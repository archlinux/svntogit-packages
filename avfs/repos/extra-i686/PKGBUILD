# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=avfs
pkgver=0.9.8
pkgrel=1
pkgdesc="A virtual filesystem which enables programs to look inside archived or compressed files, or access remote files"
arch=(i686 x86_64)
license=('GPL')
url="http://avf.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/avf/$pkgname-$pkgver.tar.bz2)
options=(NOEMPTYDIRS NOLIBTOOL)
depends=('fuse')
md5sums=('5281b990251c8c3a15366ad40e4818db')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-library --enable-fuse
  make || return 1
  make DESTDIR=$startdir/pkg install
}
