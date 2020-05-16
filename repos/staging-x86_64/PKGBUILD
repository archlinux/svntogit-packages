# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=portsmf
pkgver=234
pkgrel=2
pkgdesc="Portable library for reading/writing Standard MIDI Files"
arch=('x86_64')
url="https://sourceforge.net/p/portmedia/wiki/portsmf/"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('subversion')
provides=('libportSMF.so')
options=('!staticlibs')
source=("portsmf::svn+https://svn.code.sf.net/p/portmedia/code/portsmf/trunk#revision=$pkgver"
        portsmf-shared.patch)
sha512sums=('SKIP'
            'f2961c2da2e5b08e60cbbf7c3d47687ce75ad4f6d7ee1c4f4a5ef1212ef928fe1c61212dc11081155117e2adf51c9ac280e21f791f1da87f69a0dec00605426a')

pkgver() {
  cd $pkgname
  printf "%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
  cd $pkgname
  patch -Np1 -i "${srcdir}/portsmf-shared.patch"
  autoreconf -vfi
  chmod 755 configure
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --includedir=/usr/include/portsmf
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" includedir=/usr/include/portsmf install
  install -vDm 644 portSMF.pc -t "${pkgdir}/usr/lib/pkgconfig/"
  install -vDm 644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
