# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-cjk
pkgver=20170601
_commit=32a5844539f2e348ed36b44e990f9b06d7fb89fe
pkgrel=2
pkgdesc="Google Noto CJK fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
source=($pkgname-$pkgver.zip::"https://github.com/googlei18n/noto-cjk/archive/$_commit.zip" 70-noto-cjk.conf)
sha256sums=('31e53af3f5e97ae021f24f960608e98f64aaa12804eda7fb583dcfaa8d496ebf'
            '5a5fa764efaca13a326998499d026b89e22217c12011074bf301ef8aa4a9bb37')

package() {
  install -Dm644 noto-cjk-*/*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 noto-cjk-*/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 70-noto-cjk.conf -t "$pkgdir"/etc/fonts/conf.avail
}
