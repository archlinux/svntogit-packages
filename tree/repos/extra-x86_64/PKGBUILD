# $Id$
# Maintainer: juergen <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
#

pkgname=tree
pkgver=1.5.1.1
pkgrel=1
pkgdesc="A directory listing program displaying a depth indented list of files"
arch=(i686 x86_64)
license=('GPL')
depends=('glibc')
source=(ftp://mama.indstate.edu/linux/tree/$pkgname-$pkgver.tgz)
md5sums=('f8fc70a9260b50bf8b4613e9d5f5e589')
url="http://mama.indstate.edu/users/ice/tree/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make prefix=$startdir/pkg/usr install
}
# vim: ts=2 sw=2 et ft=sh
