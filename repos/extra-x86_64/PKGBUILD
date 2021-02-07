# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=mpdecimal
pkgver=2.5.1
pkgrel=1
pkgdesc="Package for correctly-rounded arbitrary precision decimal floating point arithmetic"
arch=('x86_64')
url="https://www.bytereef.org/mpdecimal/index.html"
license=('BSD')
depends=('gcc-libs')
source=("https://www.bytereef.org/software/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha512sums=('710cb5cb71dbcf3e170ca15869c148df0547b848400c6b6dd70c67d9961dbe1190af8fb4d1623bfb0ca2afe44f369a42e311ab5225ed89d4031cb49a3bd70f30')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
