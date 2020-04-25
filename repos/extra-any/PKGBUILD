# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=devtools
pkgver=20200407
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://git.archlinux.org/devtools.git/'
depends=('bash' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
         'git' 'bzr' 'mercurial' 'diffutils' 'util-linux' 'awk')
makedepends=('asciidoc')
optdepends=('btrfs-progs: btrfs support')
source=(https://sources.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'
              '4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'
              '86CFFCA918CF3AF47147588051E8B148A9999C34'
              '8FC15A064950A99DD1BD14DD39E4B877E62EB915'
              '8218F88849AAC522E94CF470A5E9288C4FA415FA'
              'B81B051F2D7FC867AAFF35A58DBD63B82072D77A'
              'F3691687D867B81B51CE07D9BBE43771487328A9'
              '6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'
              'E240B57E2C4630BA768E2F26FC1B547C8D8172C8')
sha256sums=('313d48136b5f518ccd3d108c1f16de6938da83d12b083b8ec32ff381ee5b008e'
            'SKIP')
b2sums=('01ff4d17a9502df468d545e273e94ab7d7b6817efa6d7f2fe661b4a978a5051a03a8a04ea1e82902b30988413f32f65afdf49a234d82ab05fa510ffc52f62e02'
        'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
