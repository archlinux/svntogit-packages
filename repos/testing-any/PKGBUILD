# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=devtools
pkgver=20221012
pkgrel=2
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://gitlab.archlinux.org/archlinux/devtools'
depends=('bash' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
         'git' 'bzr' 'mercurial' 'diffutils' 'util-linux' 'awk')
makedepends=('asciidoc')
optdepends=('btrfs-progs: btrfs support')
source=(${url}/uploads/58ff97503cfb70ddf8f90f3b73080166/devtools-${pkgver}.tar.gz
        ${url}/uploads/dc81469e5c8b1cb069c623a4e59f08ca/devtools-${pkgver}.tar.gz.sig
        devtools-mkarchroot-remove-deprecated-d-option.patch::https://gitlab.archlinux.org/archlinux/devtools/-/commit/a510331698bb13ca11ccd7db3f9beef75f87744c.patch)
validpgpkeys=(
  '4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC' # Pierre Schmitz <pierre@archlinux.org>
  '86CFFCA918CF3AF47147588051E8B148A9999C34' # Evangelos Foutras <foutrelis@archlinux.org>
  '8FC15A064950A99DD1BD14DD39E4B877E62EB915' # Sven-Hendrik Haase <svenstaro@archlinux.org>
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30' # Jan Alexander Steffens (heftig) <heftig@archlinux.org>
  'B81B051F2D7FC867AAFF35A58DBD63B82072D77A' # Sébastien Luttringer <seblu@archlinux.org>
  '6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD' # Allan McRae (Developer) <allan@archlinux.org>
  'E240B57E2C4630BA768E2F26FC1B547C8D8172C8' # Levente Polyak <anthraxx@archlinux.org>
)
sha256sums=('6e510b1d4f2a8b652d15b12a103e16e5ef8d496603597c10ec8bbcbf0e0b34b7'
            'SKIP'
            '074d1402a7472539ae26421da840a4555197c2069e15892729a40d5e898e06b1')
b2sums=('801814e553bb23f30a5f359219af30607e81935adee2f50ca0a00384da37fedc04bbf4245e78db712f16917a5910d1fd35a0f6963d1fa2079f6c5805c1b203c9'
        'SKIP'
        '8cf610d5478d214303971618eda9806ffa054545b402a580edd0a52c86477528664f89639070b28ed41fec376ca34cc98abb593cd4243278fcdba8108bcdf5bc')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 < ../devtools-mkarchroot-remove-deprecated-d-option.patch
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
