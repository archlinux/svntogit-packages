# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=devtools
pkgver=20210202
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
sha256sums=('ad1a65f0f349093b557bd6f45fd5f84ba2be246702908193ae7351457a218d6e'
            'SKIP')
b2sums=('b3f388b928f91a230e0fbc406cdeccd81d3688d5f5a6e9c7928994c680f22b4162e0cce07bb7d84e0c5bb2850cd92b35a531ca5bc8ca9b7d97a278e9f3787f45'
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
