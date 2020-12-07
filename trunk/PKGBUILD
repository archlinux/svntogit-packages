# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-cjk
pkgver=20201206
_commit=782eab531e724779772302b835661b7b12a6b3a8
pkgrel=1
pkgdesc="Google Noto CJK fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
source=($pkgname-$pkgver.zip::"https://github.com/googlei18n/noto-cjk/archive/$_commit.zip" 70-noto-cjk.conf)
sha256sums=('d27c4e636364b5d8e51fce001247e95cf466be520db93c2251ed773990da60f3'
            '357e9ed6553087567ec5a28f835db5c43d3cd68a688e4677f759cca465379a32')

package() {
  install -Dm644 noto-cjk-*/*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 noto-cjk-*/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 70-noto-cjk.conf -t "$pkgdir"/etc/fonts/conf.avail
}
