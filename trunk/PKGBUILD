# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-emoji
pkgver=20211101
_commit=9a5261d871451f9b5183c93483cbd68ed916b1e9
pkgrel=1
pkgdesc='Google Noto emoji fonts'
arch=(any)
url='https://www.google.com/get/noto/'
license=(custom:OFL)
provides=(emoji-font)
makedepends=(git)
source=(git+https://github.com/googlefonts/noto-emoji.git#commit=$_commit)
sha256sums=('SKIP')

package() {
  cd noto-emoji
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 fonts/NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
