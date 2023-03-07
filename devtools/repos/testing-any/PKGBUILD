# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=devtools
pkgver=20230307
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://gitlab.archlinux.org/archlinux/devtools'
depends=('bash' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
         'git' 'bzr' 'mercurial' 'diffutils' 'util-linux' 'awk')
makedepends=('asciidoc')
optdepends=('btrfs-progs: btrfs support')
source=(${url}/uploads/dd8ad73d91417e228d94134e238b9043/devtools-${pkgver}.tar.gz
        ${url}/uploads/3b99e9787a1ccbaf0cd3b7f1380f9e2e/devtools-${pkgver}.tar.gz.sig)
validpgpkeys=(
  '4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC' # Pierre Schmitz <pierre@archlinux.org>
  '86CFFCA918CF3AF47147588051E8B148A9999C34' # Evangelos Foutras <foutrelis@archlinux.org>
  '8FC15A064950A99DD1BD14DD39E4B877E62EB915' # Sven-Hendrik Haase <svenstaro@archlinux.org>
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30' # Jan Alexander Steffens (heftig) <heftig@archlinux.org>
  'B81B051F2D7FC867AAFF35A58DBD63B82072D77A' # Sébastien Luttringer <seblu@archlinux.org>
  '6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD' # Allan McRae (Developer) <allan@archlinux.org>
  'E240B57E2C4630BA768E2F26FC1B547C8D8172C8' # Levente Polyak <anthraxx@archlinux.org>
)
sha256sums=('0e1f8d7f37882cf18e79ab7e74581d79593e0f15f10b378b2443f0a2d557b523'
            'SKIP')
b2sums=('348ad392840f49a71f17b39bf71a3a18d3610293de29029c0dcacb7aa23cef437258ec2f9dd454ac782ece82656d75af55a669a2f42294cd7fb6b041a79d2259'
        'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  make BUILDTOOLVER="${pkgver}-${pkgrel}-${arch}" PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
