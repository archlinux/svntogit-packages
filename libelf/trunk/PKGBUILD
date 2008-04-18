# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libelf
pkgver=0.8.10
pkgrel=3
pkgdesc="libelf is a free ELF object file access library"
arch=(i686 x86_64)
license=('GPL')
source=(http://www.mr511.de/software/$pkgname-$pkgver.tar.gz)
url="http://directory.fsf.org/libs/misc/libelf.html"
depends=('glibc')
md5sums=('9db4d36c283d9790d8fa7df1f4d7b4d9')

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr --enable-shared --enable-gnu-names
    make || return 1
    make prefix=$startdir/pkg/usr install
}
