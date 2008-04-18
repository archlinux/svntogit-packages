# $Id$
# Maintainer: damir <damir@archlinux.org>
# TU:  Lukas Sabota <punkrockguy318@comcast.net>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=scons
pkgver=0.97
pkgrel=1
pkgdesc="SCons is an open source software contruction tool that is a substitute for make."
arch=("i686" "x86_64")
url="http://scons.org"
license=("custom")
depends=('python')
mirror="switch"
#mirror="switch"
source=("http://$mirror.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --standard-lib --prefix=/usr --root=$startdir/pkg
  install -D -m644 $startdir/src/$pkgname-$pkgver/LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('de530fa29e83f3b6efb618873398fa31')
