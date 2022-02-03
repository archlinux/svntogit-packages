# Maintainer:  David Runge <dvzrv@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=ncurses
pkgver=6.3
pkgrel=2
pkgdesc='System V Release 4.0 curses emulation library'
arch=(x86_64)
url='https://invisible-island.net/ncurses/ncurses.html'
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(autoconf-archive)
optdepends=('bash: for ncursesw6-config')
provides=(libncurses++w.so libformw.so libmenuw.so libpanelw.so libncursesw.so)
replaces=(alacritty-terminfo)
options=(debug)
source=(
  "https://invisible-mirror.net/archives/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc}
  "${pkgname}-6.3-libs.patch"
  "${pkgname}-6.3-pkgconfig.patch"
)
sha512sums=('5373f228cba6b7869210384a607a2d7faecfcbfef6dbfcd7c513f4e84fbd8bcad53ac7db2e7e84b95582248c1039dcfc7c4db205a618f7da22a166db482f0105'
            'SKIP'
            'adb02b838c40f1e58a1b31c26d5cd0f2a1c43f3b6d68e839981764c0f6c905a9eb51dd36ff018628fdeb20747cc7467727d57135408ab4848259384077a52b28'
            '2d2c0ec3c880e638ab4aa3dbff5e28e4cd233153e24816bd87e077f848aa3edd5114cd0f2a7f6e8869dd1861a2746e512886c18264ff1676927dcc320c5ef958')
b2sums=('b2c174ac48d587b4d3aa054f04e4ec8bffd8a657a4aff5f090104965c741901e600712c8f8e5e98f3b8a26bc558996a1e14a746f113854832853b855e9d406c3'
        'SKIP'
        '31bb10e82dd018a75e57252052650d9f0f5eb5e7e887118c2ea40032b11f59ec6aa4d9bae804c615cbecdf3382f3434e0c9e9e8440fdefe66a507be020b8965c'
        'fb6cf606cf3db7f6b306272696a63bce83d52cfa91e850f9a7bdb9d3d8455a26943529a9cf79731dddc7f763c27211a9afab9c4c31dbb6d12fd720eb390eb0a3')
validpgpkeys=('19882D92DDA4C400C22C0D56CC2AF4472167BE03')  # Thomas Dickey <dickey@invisible-island.net>

prepare() {
  cd $pkgname-$pkgver
  # do not link against test libraries
  patch -Np1 -i ../"${pkgname}-6.3-libs.patch"
  # do not leak build-time LDFLAGS into the pkgconfig files:
  # https://bugs.archlinux.org/task/68523
  patch -Np1 -i ../"${pkgname}-6.3-pkgconfig.patch"
  # NOTE: can't run autoreconf because the autotools setup is custom and ancient
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr \
    --enable-widec \
    --enable-pc-files \
    --mandir=/usr/share/man \
    --with-cxx-binding \
    --with-cxx-shared \
    --with-manpage-format=normal \
    --with-pkg-config-libdir=/usr/lib/pkgconfig \
    --with-shared \
    --with-versioned-syms \
    --without-ada
  make
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses ncurses++ form panel menu; do
    printf "INPUT(-l%sw)\n" "${lib}" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv ${lib}w.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  # some packages look for -lcurses during build
  printf 'INPUT(-lncursesw)\n' > "$pkgdir/usr/lib/libcursesw.so"
  ln -sv libncurses.so "$pkgdir/usr/lib/libcurses.so"

  # tic and ticinfo functionality is built in by default
  # make sure that anything linking against it links against libncursesw.so instead
  for lib in tic tinfo; do
    printf "INPUT(libncursesw.so.%s)\n" "${pkgver:0:1}" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv libncursesw.so.${pkgver:0:1} "$pkgdir/usr/lib/lib${lib}.so.${pkgver:0:1}"
    ln -sv ncursesw.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done
}
