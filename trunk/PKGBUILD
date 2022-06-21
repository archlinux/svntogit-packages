# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=devtools
pkgver=20220621
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://gitlab.archlinux.org/archlinux/devtools'
depends=('bash' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
         'git' 'bzr' 'mercurial' 'diffutils' 'util-linux' 'awk')
makedepends=('asciidoc')
optdepends=('btrfs-progs: btrfs support')
source=(${url}/uploads/8217baae0afcdb540bde9f5b030f05a9/devtools-${pkgver}.tar.gz
        ${url}/uploads/8570458d06b07d5a3ff8d30a1fc392d4/devtools-${pkgver}.tar.gz.sig)
validpgpkeys=(
  '4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC' # Pierre Schmitz <pierre@archlinux.org>
  '86CFFCA918CF3AF47147588051E8B148A9999C34' # Evangelos Foutras <foutrelis@archlinux.org>
  '8FC15A064950A99DD1BD14DD39E4B877E62EB915' # Sven-Hendrik Haase <svenstaro@archlinux.org>
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30' # Jan Alexander Steffens (heftig) <heftig@archlinux.org>
  'B81B051F2D7FC867AAFF35A58DBD63B82072D77A' # Sébastien Luttringer <seblu@archlinux.org>
  '6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD' # Allan McRae (Developer) <allan@archlinux.org>
  'E240B57E2C4630BA768E2F26FC1B547C8D8172C8' # Levente Polyak <anthraxx@archlinux.org>
)
sha256sums=('0938d41b4bc469e62d86d2a287612a090640f6eebde92137b8bd7727b89e95dd'
            'SKIP')
b2sums=('007f62b6cb3f06904fcafec4869a43136643bd364a7f0f314c792c08fbdafafaf8a268f8a372f78402deaa1f87bfc3f2fc7099f78742c6776d4ac49fe4884d58'
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
