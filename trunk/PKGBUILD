# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gsl
pkgver=1.11
pkgrel=1
pkgdesc="The GNU Scientific Library (GSL) is a modern numerical library for C and C++ programmers"
arch=(i686 x86_64)
source=(http://ftp.belnet.be/mirror/ftp.gnu.org/gnu/gsl/$pkgname-$pkgver.tar.gz)
md5sums=('f28f9de8bec867f3f4f436d3ed80680a')
license="GPL"
depends=('glibc')
options=('!libtool')
url="http://www.gnu.org/software/gsl/gsl.html"

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make prefix=$startdir/pkg/usr install
}
