# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Ben <ben@benmazer.ner>

pkgname=fluxter
pkgver=0.1.0
pkgrel=3
pkgdesc="A workspace pager for fluxbox"
url="http://benedict.isomedia.com/homes/stevencooper/projects/fluxter.html"
depends=('gcc' 'libx11' 'libsm')
source=(http://benedict.isomedia.com/homes/stevencooper/files/$pkgname-$pkgver.tar.gz)
md5sums=('6d18553220e8fc33c54762d2e7d31528')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  /usr/bin/make || return 1
  /usr/bin/make prefix=$startdir/pkg/usr install
}
# vim: ts=2 sw=2 et ft=sh
