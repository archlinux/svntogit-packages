# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=avogadro-crystals
pkgver=1.0.1
pkgrel=1
pkgdesc='Crystallographic files of common materials, elements, oxides, for visualization in Avogadro'
arch=(any)
url='https://openchemistry.org/'
license=(BSD)
source=(https://github.com/OpenChemistry/crystals/archive/$pkgver/crystals-$pkgver.tar.gz)
sha256sums=('f93377965979dfab6f6119e34db5e9c0e749f38bd664ac033c54dc415d3777c8')

package() {
  mkdir -p "$pkgdir"/usr/share/avogadro2
  cp -ar crystals-$pkgver "$pkgdir"/usr/share/avogadro2/crystals
}
