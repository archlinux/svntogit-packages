# Maintainer: Thomas Arnhold <thomas at arnhold dot org>

pkgname=liborcus
pkgver=0.7.0
pkgrel=1
pkgdesc="File import filter library for spreadsheet documents."
arch=('i686' 'x86_64')
url="https://gitorious.org/orcus/"
license=('MPL')
depends=('zlib' 'mdds' 'libixion')
makedepends=('boost')
source=(http://kohei.us/files/orcus/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7681383be6ce489d84c1c74f4e7f9643')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=$pkgdir install
}
