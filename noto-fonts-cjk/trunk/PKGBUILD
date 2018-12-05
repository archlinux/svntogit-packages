# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-cjk
pkgver=20181130
_commit=9326451d9b4f32ec7f8640581c5053cc192039f2
pkgrel=1
pkgdesc="Google Noto CJK fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
source=($pkgname-$pkgver.zip::"https://github.com/googlei18n/noto-cjk/archive/$_commit.zip" 70-noto-cjk.conf)
sha256sums=('28d282497d78e15c77f346afcf81498bef1f98f168e97eeb5a1a288106b84ed2'
            'f83b652cabe6e95489f2f70e44f5288216d33a6132f24e8d074d6eee4e3d700b')

package() {
  install -Dm644 noto-cjk-*/*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 noto-cjk-*/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 70-noto-cjk.conf -t "$pkgdir"/etc/fonts/conf.avail
}
