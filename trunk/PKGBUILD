# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-emoji
pkgver=20191016
_commit=f3b9faa83dedf51cd4d9d8ff30e13c17b8073211
pkgrel=6
pkgdesc="Google Noto emoji fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:OFL)
provides=(emoji-font)
source=($pkgname-$pkgver.zip::"https://github.com/googlei18n/noto-emoji/archive/$_commit.zip")
sha256sums=('50d3ae08c7ca4718774d6b04d50d788c7b6b858220792a2fc69ef9c24ed092c5')

package() {
  cd noto-emoji-*
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 fonts/NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
