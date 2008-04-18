# $Id$
# Maintainer: damir <damir@archlinux.org>
# TUR: Ben <ben@benmazer.net>
# Contributor: Elia Yehuda <z4ziggy@user-contributions.org>

pkgname=ddcxinfo-arch
pkgver=0.8
pkgrel=1
pkgdesc="utility to probe non/ddc monitors - used by hwd"
url="http://user-contributions.org/projects/ddcxinfo-arch/"
depends=('glibc')

source=(http://user-contributions.org/projects/ddcxinfo-arch/source/$pkgname-$pkgver.tar.gz)

md5sums=('ca734d958a54bef03a543479f7ab8b00')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make ddcxinfo-arch || return 1
  install -D -m755 ddcxinfo-arch $startdir/pkg/usr/sbin/ddcxinfo-arch
}
