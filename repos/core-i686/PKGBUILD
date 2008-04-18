# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=dash
pkgver=0.5.4
pkgrel=4
pkgdesc="A POSIX compliant shell that aims to be as small as possible"
arch=('i686' 'x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
groups=('base')
makedepends=('klibc>=1.5')
#provides=('sh')
source=("http://gondor.apana.org.au/~herbert/dash/files/dash-$pkgver.tar.gz")
md5sums=('bc457e490a589d2f87f2333616b67931')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man --exec-prefix="" CC=klcc LD=klcc LDFLAGS="-static"
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # license
  install -m644 -D COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING

  #static dash is our default /bin/sh
  #cd ${startdir}/pkg/bin
  #ln -s dash sh
}
