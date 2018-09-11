# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=bubblewrap
pkgver=0.3.0
pkgrel=1
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64)
license=(GPL)
depends=(glibc libcap)
makedepends=(libxslt docbook-xsl)
source=($url/releases/download/v$pkgver/bubblewrap-${pkgver}.tar.xz)
sha256sums=('c8e52870b54a10235174775e03164b2a9253e19cb3a95b3e4bd9e2d84b9eaf2c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --with-priv-mode=setuid
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
