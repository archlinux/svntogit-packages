# $Id$
# Maintainer: simo <simo@archlinux.org>
pkgname=bzr
pkgver=1.3
pkgrel=1
pkgdesc="A decentralized revision control system"
arch=('i686' 'x86_64')
url="http://www.bazaar-vcs.org"
license=('GPL')
depends=('python')
source=(http://bazaar-vcs.org/releases/src/bzr-$pkgver.tar.gz)
md5sums=('1af233c6fa0a68851bc6155b2f563c30')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i 's|man/man1|share/man/man1|' setup.py
  python setup.py install --prefix=/usr --root=$startdir/pkg

  # bash-completion
  install -D -m644 contrib/bash/bzr \
    $startdir/pkg/etc/bash_completion.d/bzr
}
