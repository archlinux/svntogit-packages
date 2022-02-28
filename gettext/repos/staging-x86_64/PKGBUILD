# Maintainer:

pkgname=gettext
pkgver=0.21
pkgrel=2
pkgdesc="GNU internationalization library"
url="https://www.gnu.org/software/gettext/"
arch=(x86_64)
license=(GPL)
groups=(base-devel)
depends=(gcc-libs acl sh libunistring libxml2)
makedepends=(gettext emacs git)
optdepends=('git: for autopoint infrastructure updates')
options=(!docs)
source=(https://ftp.gnu.org/pub/gnu/gettext/$pkgname-$pkgver.tar.gz{,.sig}
        gettext-0.21-disable-libtextstyle.patch)
sha256sums=('c77d0da3102aec9c07f43671e60611ebff89a996ef159497ce8e59d075786b12'
            'SKIP'
            '544ce0589e9c70f4f75d77c76fd36f88d009ac9cfecb4812a67f878e38ac6418')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871'  # Daiki Ueno
              '68D94D8AAEEAD48AE7DC5B904F494A942E4616C2'
              '9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D') # Bruno Haible (Open Source Development)


prepare() {
  cd $pkgname-$pkgver

  # Do not build libtextstyle, as it depends on libcroco
  # which is now unmaintained and has known security bugs.
  # patch from Fedora	
  patch -p1 -i $srcdir/gettext-0.21-disable-libtextstyle.patch
}

build() {
  cd $pkgname-$pkgver

  autoreconf --force

  ./configure \
    --prefix=/usr \
    --enable-csharp \
    --enable-nls \
    --with-xz \
    --without-included-gettext

  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i gettext-{tools,runtime,runtime/libasprintf}/libtool

  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
