# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lucy <lucy@luz.lu>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=pkgconf
pkgver=1.6.3
pkgrel=2
pkgdesc="Package compiler and linker metadata toolkit"
url="https://github.com/pkgconf/pkgconf"
license=(custom:ISC)
arch=(x86_64)
depends=(glibc sh)
makedepends=(git)
provides=(pkg-config pkgconfig)
conflicts=(pkg-config)
replaces=(pkg-config)
groups=(base-devel)
_commit=c862e030cf83447f679e4f49876f5298f0fc9691  # tags/pkgconf-1.6.3
source=("git+https://git.dereferenced.org/pkgconf/pkgconf#commit=$_commit"
        i686-pc-linux-gnu.personality
        x86_64-pc-linux-gnu.personality)
sha256sums=('SKIP'
            '6697c6db7deaae269ea75624a70e80949241f2cf59a537f31ecfcac726d90bc1'
            'c8297817ba0b57d003878db247ff34b4c47a7594c9f67dcfe8ff8d6567956cd5')

_pcdirs=/usr/lib/pkgconfig:/usr/share/pkgconfig
_libdir=/usr/lib
_includedir=/usr/include

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^pkgconf-//;s/-/+/g'
}

prepare() {
  mkdir build
  cd $pkgname
  ./autogen.sh
}

build() {
  cd build
  ../$pkgname/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-pkg-config-dir="$_pcdirs" \
    --with-system-libdir="$_libdir" \
    --with-system-includedir="$_includedir" \
    --disable-static
  make
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dt "$pkgdir/usr/share/pkgconfig/personality.d" -m644 \
    i686-pc-linux-gnu.personality \
    x86_64-pc-linux-gnu.personality
  ln -s pkgconf "$pkgdir/usr/bin/i686-pc-linux-gnu-pkg-config"
  ln -s pkgconf "$pkgdir/usr/bin/x86_64-pc-linux-gnu-pkg-config"
  ln -s pkgconf "$pkgdir/usr/bin/pkg-config"

  ln -s pkgconf.1 "$pkgdir/usr/share/man/man1/pkg-config.1"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgname/COPYING
}

# vim:set sw=2 et:
