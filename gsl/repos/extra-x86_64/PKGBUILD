# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gsl
pkgver=1.10
pkgrel=1
pkgdesc="The GNU Scientific Library (GSL) is a modern numerical library for C and C++ programmers"
arch=(i686 x86_64)
source=(http://ftp.belnet.be/mirror/ftp.gnu.org/gnu/gsl/$pkgname-$pkgver.tar.gz)
md5sums=('d67be4f2e5560d6cf907e18a428becdc')
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
