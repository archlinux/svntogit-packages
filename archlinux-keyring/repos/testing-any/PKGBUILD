# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=archlinux-keyring
_tag='b46634eb71ac12dc11fea45beb5aae96d76c4fa1' # git rev-parse ${pkgver}
pkgver=20220423
pkgrel=1
pkgdesc='Arch Linux PGP keyring'
arch=('any')
url='https://gitlab.archlinux.org/archlinux/archlinux-keyring/'
license=('GPL3')
install=$pkgname.install
makedepends=('git' 'python' 'sequoia-sq')
checkdepends=('python-coverage' 'python-pytest')
source=("archlinux-keyring::git+https://gitlab.archlinux.org/archlinux/archlinux-keyring.git#tag=${_tag}?signed")
sha256sums=('SKIP')
validpgpkeys=('4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'  # Pierre Schmitz <pierre@archlinux.de>
              'A314827C4E4250A204CE6E13284FC34C8E4B1A25'  # Thomas Bächler <thomas@bchlr.de>
              '86CFFCA918CF3AF47147588051E8B148A9999C34'  # Evangelos Foutras <evangelos@foutrelis.com>
              'F3691687D867B81B51CE07D9BBE43771487328A9'  # Bartlomiej Piotrowski <bpiotrowski@archlinux.org>
              'BD84DE71F493DF6814B0167254EDC91609BC9183'  # Christian Hesse <Christi@n-Hes.se>
              'CFA6AF15E5C74149FC1D8C086D1655C14CE1C13E'  # Florian Pritz <bluewind@xinu.at>
              'E499C79F53C96A54E572FEE1C06086337C50773E') # Jelle van der Waa <jelle@archlinux.org>

build() {
  cd archlinux-keyring/

  make build
}

check() {
  cd archlinux-keyring/

  make check
}

package() {
  cd archlinux-keyring/

  make PREFIX='/usr' DESTDIR="${pkgdir}" install
}
