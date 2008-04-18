# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Rouslan Solomakhin <rouslan@localnet.com>

pkgname=prelink
pkgver=20060213
pkgrel=1
pkgdesc="ELF prelinking utility to speed up dynamic linking."
arch=(i686 x86_64)
url="http://people.redhat.com/jakub/prelink/"
depends=(libelf)
backup=(etc/prelink.conf)
source=($url/$pkgname-$pkgver.tar.bz2 prelink.conf)
md5sums=('a3ee7d324ecdf2f1a7b8b95c01ee75fa' '0793ed49e9b31c125cba4d936c333cf6')


build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr
  /usr/bin/make || return 1
  /usr/bin/make prefix=$startdir/pkg/usr install
  /bin/install -D -m 0644 $startdir/src/prelink.conf \
      $startdir/pkg/etc/prelink.conf
}
# vim: ts=2 sw=2 et ft=sh
