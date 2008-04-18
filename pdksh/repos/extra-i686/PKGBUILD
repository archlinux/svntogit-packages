# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=pdksh
pkgver=5.2.14
pkgrel=4
pkgdesc="A public domain clone of the AT&T Korn shell"
depends=('glibc')
install=$pkgname.install
source=(ftp://ftp.cs.mun.ca/pub/$pkgname/$pkgname-$pkgver.tar.gz $pkgname-$pkgver.patch)
url="http://www.cs.mun.ca/~michael/pdksh/"
md5sums=('871106b3bd937e1afba9f2ef7c43aef3' 'f11d1e711627d21a547c09e344e30dd3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/patch -Np1 -i ../$pkgname-$pkgver.patch
  ./configure --prefix=/usr
  /usr/bin/make || return 1
  /usr/bin/make prefix=$startdir/pkg/usr install
}
# vim: ts=2 sw=2 et ft=sh
