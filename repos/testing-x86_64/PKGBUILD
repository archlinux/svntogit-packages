# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=guile
pkgver=3.0.9
pkgrel=1
pkgdesc='Portable, embeddable Scheme implementation written in C'
url='https://www.gnu.org/software/guile/'
arch=(x86_64)
license=(GPL)
depends=(gmp ncurses libunistring gc libffi libxcrypt)
makedepends=(texinfo)
source=(https://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5' # Ludovic Courtès <ludo@gnu.org>
              'FF478FB264DE32EC296725A3DDC0F5358812F8F2' # Andy Wingo
              '4FD4D288D445934E0A14F9A5A8803732E4436885') # Andy Wingo <wingo@pobox.com>"
sha256sums=('18525079ad29a0d46d15c76581b5d91c8702301bfd821666d2e1d13726162811'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-static  \
    --disable-error-on-warning
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/lib/libguile-3.?.so.*-gdb.scm
}
