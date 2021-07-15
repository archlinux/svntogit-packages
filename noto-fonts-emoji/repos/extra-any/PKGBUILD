# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-emoji
pkgver=20210625
_commit=6f11c8db698594bd982b90b5a07b2c0ee62bb145
pkgrel=1
pkgdesc='Google Noto emoji fonts'
arch=(any)
url='https://www.google.com/get/noto/'
license=(custom:OFL)
provides=(emoji-font)
source=(https://github.com/googlefonts/noto-emoji/archive/$_commit/$pkgname-$pkgver.zip)
sha256sums=('57219d868c295415414d846da78e542215f44653b6735aa4946b6165414516e2')

package() {
  cd noto-emoji-*
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 fonts/NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
