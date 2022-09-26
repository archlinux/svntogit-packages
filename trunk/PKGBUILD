# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-emoji
pkgver=20220920
_commit=c79f4f80c53034c3d50a0ed90447ec4903cb5683
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
