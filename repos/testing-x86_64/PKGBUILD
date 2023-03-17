# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Lucy <lucy@luz.lu>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=pkgconf
pkgver=1.8.1
pkgrel=1
pkgdesc="Package compiler and linker metadata toolkit"
url="https://gitea.treehouse.systems/ariadne/pkgconf"
license=(custom:ISC)
arch=(x86_64)
depends=(glibc sh)
makedepends=(git meson)
provides=(pkg-config pkgconfig libpkgconf.so)
conflicts=(pkg-config)
replaces=(pkg-config)
_commit=5436648cd4c890fa1e99be82adc333dad4f50eff  # tags/pkgconf-1.8.1
source=("git+$url#commit=$_commit"
        i686-pc-linux-gnu.personality
        x86_64-pc-linux-gnu.personality)
sha256sums=('SKIP'
            '6697c6db7deaae269ea75624a70e80949241f2cf59a537f31ecfcac726d90bc1'
            'c8297817ba0b57d003878db247ff34b4c47a7594c9f67dcfe8ff8d6567956cd5')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^pkgconf-//;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -D tests=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

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
