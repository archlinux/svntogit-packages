# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-emoji
pkgver=20190810
_commit=d741d07e86a28b722d49d774c0040b71b0f97163
pkgrel=1
pkgdesc="Google Noto emoji fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:OFL)
provides=(emoji-font)
source=($pkgname-$pkgver.zip::"https://github.com/googlei18n/noto-emoji/archive/$_commit.zip")
sha256sums=('7b96faa488050842ef1c31264912b64fe3555bdbe03ec6c0e56ce02c8c4abba0')

package() {
  cd noto-emoji-*
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
