# Maintainer:
# Contributor:  Ionut Biru <ibiru@archlinux.org>
# Contributor: Daniel Balieiro <daniel@balieiro.com>

pkgname=telepathy-salut
pkgver=0.8.1
pkgrel=7
pkgdesc="A link-local XMPP connection manager for Telepathy"
arch=('x86_64')
url="https://telepathy.freedesktop.org"
groups=('telepathy')
license=('LGPL')
depends=('telepathy-glib' 'avahi' 'libsoup' 'util-linux')
makedepends=('libxslt' 'python' 'xmldiff')
install=telepathy-salut.install
source=(https://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.gz
        telepathy-salut-0.8.1-python3.patch)
sha256sums=('70b9108ac8b511b7688e1b580de4ddb8981603c3cbde01f287ef8f9cb708618e'
            '04fb03cf1f085473712dbe3aa64285266dea88b1c423149e0540d7490dbb042b')

prepare() {
    cd "$pkgname-$pkgver"
    # patch for python3, taken from Fedora
    patch -Np1 -i ../telepathy-salut-0.8.1-python3.patch
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr \
    	--libexecdir=/usr/lib/telepathy \
        --disable-plugins --disable-Werror \
        --with-tls=gnutls \
        --enable-avahi-tests=no \
        --enable-static=no
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
