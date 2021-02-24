# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=aspell-en
pkgver=2020.12.07
pkgrel=1
pkgdesc="English dictionary for aspell"
arch=('x86_64')
url="http://aspell.net/"
license=('custom')
depends=('aspell')
source=("https://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-$pkgver-0.tar.bz2")
sha512sums=('9ed4e64891242e5e5e7d6ac82a0d1fda3bdc5116bd9d926e787b8f381080b357915f0c9b39cae04c1da0f2ec6e47ffe30a584f7f3bf7d455a46e8518a7858547')

build() {
  cd "$srcdir/aspell6-en-$pkgver-0"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell6-en-$pkgver-0"
  make DESTDIR="$pkgdir" install

  install -D -m644 Copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
