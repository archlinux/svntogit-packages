# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=procps-ng
pkgver=3.3.17
pkgrel=1
pkgdesc='Utilities for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=(GPL LGPL)
arch=(x86_64)
depends=(glibc ncurses libncursesw.so systemd-libs)
makedepends=(systemd)
conflicts=(procps sysvinit-tools)
provides=(procps sysvinit-tools libprocps.so)
replaces=(procps sysvinit-tools)
options=('!emptydirs')
source=(https://downloads.sourceforge.net/project/$pkgname/Production/${pkgname}-${pkgver}.tar.xz{,.asc})
sha256sums=('4518b3e7aafd34ec07d0063d250fd474999b20b200218c3ae56f5d2113f141b4'
            'SKIP')
b2sums=('43aa1a21d4f0725b1c02457f343cf1fc66bc1771b25c6eaf689c9775c190e90545bfac1729f027abc4d3d13de37ffac4828554b5b25e12bcf6af9540de1695f3'
        'SKIP')
validpgpkeys=(
  '5D3DF0F538B327C0AA7A77A2022166C0FF3C84E3' # Craig Small <csmall@debian.org>
  '5D2FB320B825D93904D205193938F96BDF50FEA5' # Craig Small <csmall@debian.org>
)

prepare() {
  cd procps-$pkgver
  sed 's:<ncursesw/:<:g' -i watch.c
}

build() {
  cd procps-$pkgver
  ./configure \
    --prefix=/usr \
    --exec-prefix=/ \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --enable-watch8bit \
    --with-systemd \
    --disable-modern-top \
    --disable-kill

  make
}

package() {
  cd procps-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
