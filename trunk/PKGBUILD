# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=hwdata
pkgver=0.358
pkgrel=1
pkgdesc="hardware identification databases"
makedepends=('git')
replaces=('hwids')
url=https://github.com/vcrhonek/hwdata
license=('GPL2')
arch=('any')
source=("git+https://github.com/vcrhonek/hwdata.git#tag=v${pkgver}?signed")
validpgpkeys=('3C40194FB79138CE0F78FD4919C2F062574F5403') # Vitezslav Crhonek
sha256sums=('SKIP')

package() {
  cd hwdata

  for ids in pci.ids pnp.ids usb.ids; do
    install -Dm644 "$ids" "${pkgdir}/usr/share/hwdata/${ids}"
  done
}
