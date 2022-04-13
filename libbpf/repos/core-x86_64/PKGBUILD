# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor:  Adrian Bacircea <adrian.bacircea@gmail.com>

pkgname=libbpf
pkgver=0.7.0
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=('x86_64')
license=('LGPL2.1')
depends=('glibc' 'libelf' 'linux-api-headers')
makedepends=('rsync')
provides=('libbpf.so')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('9677cd42124766713d8d773ebef1fc1782a167f2469e48d83ad28a68f7f8fb5f840aad62ffe27c4cd5acba34dfa969c21e8cf6390d7832a378f87a63607eee76')
b2sums=('e35116d622f3bb7dda0d5f6fbcae776277a5154a3c75d26dec325dcd7795826cbe69344da7fd19f2ab60a54225d4a77e64d4d5a6cb14dfd20e6372ac16ebc868')

build() {
  cd ${pkgname}-${pkgver}
  make -C src
}

package() {
  cd ${pkgname}-${pkgver}
  make -C src DESTDIR="${pkgdir}" LIBSUBDIR=lib install install_headers
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
