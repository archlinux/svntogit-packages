# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=devtools
pkgver=20220207
pkgrel=2
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://gitlab.archlinux.org/archlinux/devtools'
depends=('bash' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
         'git' 'bzr' 'mercurial' 'diffutils' 'util-linux' 'awk')
makedepends=('asciidoc')
optdepends=('btrfs-progs: btrfs support')
source=(${url}/uploads/1b4a7f5876d24a4d26370f4f81d8f636/devtools-${pkgver}.tar.gz
        ${url}/uploads/070f070114e57b8111f0afe72f2c1585/devtools-${pkgver}.tar.gz.sig
        makepkg.conf-set-LTOFLAGS-flto-auto.patch)
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'
              '4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'
              '86CFFCA918CF3AF47147588051E8B148A9999C34'
              '8FC15A064950A99DD1BD14DD39E4B877E62EB915'
              '8218F88849AAC522E94CF470A5E9288C4FA415FA'
              'B81B051F2D7FC867AAFF35A58DBD63B82072D77A'
              'F3691687D867B81B51CE07D9BBE43771487328A9'
              '6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'
              'E240B57E2C4630BA768E2F26FC1B547C8D8172C8')
sha256sums=('189716b7041057554d6d7ffed0cd05184f5fb03c67c8d12b74b0771df2dbf828'
            'SKIP'
            '1bd579ad29943b54c3a60b93369c5185bdac670cd01440a3ca7b43f64145230c')
b2sums=('334c434868f3769765b8e05cde1b825433322725247d6cb1509993cca980a2f02a55c763b0e4d6bd53988bb4630d86785ccbe636b842e7103c93a43d1036e36f'
        'SKIP'
        '4eea243b9152c38d1e82f0f6abd02fdbb69c9640fd7bef528532ccb0b978a1f0e39d0e2c985a9bd2dd26d2d8242ecb6b5b7f2085f0c62f521e65d487b7d1452d')

prepare() {
  cd ${pkgname}-${pkgver}
  # https://gitlab.archlinux.org/archlinux/devtools/-/merge_requests/92
  patch -Np1 -i ../makepkg.conf-set-LTOFLAGS-flto-auto.patch
}

build() {
  cd ${pkgname}-${pkgver}
  make BUILDTOOLVER="${pkgver}-${pkgrel}-${arch}" PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
