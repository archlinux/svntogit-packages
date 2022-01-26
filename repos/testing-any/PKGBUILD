# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=devtools
pkgver=20220126
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://gitlab.archlinux.org/archlinux/devtools'
depends=('bash' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
         'git' 'bzr' 'mercurial' 'diffutils' 'util-linux' 'awk')
makedepends=('asciidoc')
optdepends=('btrfs-progs: btrfs support')
source=(${url}/uploads/70fd9a0e53816981adc8886fe7122624/devtools-${pkgver}.tar.gz
        ${url}/uploads/598ef01fa062ad558a9b45524494a4dd/devtools-${pkgver}.tar.gz.sig)
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'
              '4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'
              '86CFFCA918CF3AF47147588051E8B148A9999C34'
              '8FC15A064950A99DD1BD14DD39E4B877E62EB915'
              '8218F88849AAC522E94CF470A5E9288C4FA415FA'
              'B81B051F2D7FC867AAFF35A58DBD63B82072D77A'
              'F3691687D867B81B51CE07D9BBE43771487328A9'
              '6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'
              'E240B57E2C4630BA768E2F26FC1B547C8D8172C8')
sha256sums=('8eb40c8243499a3fcd28452038b277f0b9706812a041af9572f354a7c8a34674'
            'SKIP')
b2sums=('712230fa99637482150f5cacbc730be856210bcdae60002b0d3552eefc620cab634cc1a339a86dade08da2ae8fc6627ae3f39d1d2312e9c328d6d31cc10996bc'
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
