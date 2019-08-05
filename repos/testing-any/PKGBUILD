# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=archlinux-keyring
pkgver=20190805
pkgrel=1
pkgdesc='Arch Linux PGP keyring'
arch=(any)
url='https://projects.archlinux.org/archlinux-keyring.git/'
license=(GPL)
install=$pkgname.install
source=(https://sources.archlinux.org/other/$pkgname/${pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('8744354a14e0e8f39f0b8973bc4fcecc649232f152ef75d03dd85b3ed61336c0'
            'SKIP')
validpgpkeys=('4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'  # Pierre Schmitz <pierre@archlinux.de>
              'A314827C4E4250A204CE6E13284FC34C8E4B1A25'  # Thomas Bächler <thomas@bchlr.de>
              '86CFFCA918CF3AF47147588051E8B148A9999C34'  # Evangelos Foutras <evangelos@foutrelis.com>
              'F3691687D867B81B51CE07D9BBE43771487328A9'  # Bartlomiej Piotrowski <bpiotrowski@archlinux.org>
              'BD84DE71F493DF6814B0167254EDC91609BC9183'  # Christian Hesse <Christi@n-Hes.se>
              'CFA6AF15E5C74149FC1D8C086D1655C14CE1C13E'  # Florian Pritz <bluewind@xinu.at>
              'E499C79F53C96A54E572FEE1C06086337C50773E')  # Jelle van der Waa <jelle@archlinux.org>

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
