# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-emoji
pkgver=20180810
_commit=3ffd20ec7504657aa17c84f9aa475ad09b20c362
pkgrel=1
pkgdesc="Google Noto emoji fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:OFL)
depends=(fontconfig)
source=($pkgname-$pkgver.zip::"https://github.com/googlei18n/noto-emoji/archive/$_commit.zip")
sha256sums=('96d41cee5017eee62546bc589db66d602b771b9cff32add59c2f969c2a62cac9')

package() {
  cd noto-emoji-*
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 fonts/NotoColorEmoji.ttf "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
