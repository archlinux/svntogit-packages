# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-cjk
pkgver=20190409
_commit=cf29231ab8029678af4bbc1a9480e2b296a5b2d3
pkgrel=2
pkgdesc="Google Noto CJK fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
source=($pkgname-$pkgver.zip::"https://github.com/googlei18n/noto-cjk/archive/$_commit.zip" 70-noto-cjk.conf)
sha256sums=('02b5de2cb3a4141fcbd92dd63e2df0d5c9ded3b5986ff41cf40644aebc519fc3'
            '357e9ed6553087567ec5a28f835db5c43d3cd68a688e4677f759cca465379a32')

package() {
  install -Dm644 noto-cjk-*/*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 noto-cjk-*/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 70-noto-cjk.conf -t "$pkgdir"/etc/fonts/conf.avail
}
