# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-cjk
pkgver=20201206
_commit=782eab531e724779772302b835661b7b12a6b3a8
pkgrel=3
pkgdesc="Google Noto CJK fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
source=($pkgname-$pkgver.zip::https://github.com/googlefonts/noto-cjk/archive/$_commit.zip 70-noto-cjk.conf)
sha256sums=('d27c4e636364b5d8e51fce001247e95cf466be520db93c2251ed773990da60f3'
            '528e2bd75c6c9b5931e9c3d381c2056501a5ef4bd80488fdce3a6491f56b2844')

package() {
  install -Dm644 noto-cjk-*/*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 noto-cjk-*/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 70-noto-cjk.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
