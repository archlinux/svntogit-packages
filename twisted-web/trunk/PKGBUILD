# $Id$
# Maintainer: Mark Rosenstand <mark@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=twisted-web
pkgver=2.0.2.0
pkgrel=1
pkgdesc="An HTTP protocol implementation together with clients and servers."
arch=(i686 x86_64)
url="http://twistedmatrix.com/projects/web2/"
license=('MIT')
depends=('twisted')
source=("http://tmrc.mit.edu/mirror/twisted/Web2/TwistedWeb${pkgver/./-}.tar.bz2")
md5sums=('7d6dea006d7f1e004df9f6aad730fbee')

build() {
  cd $startdir/src/TwistedWeb${pkgver/./-}
  python setup.py install --prefix=/usr --root=$startdir/pkg
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
