# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lua
pkgver=5.4.2
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc='Powerful lightweight programming language designed for extending applications'
arch=('x86_64')
url='https://www.lua.org/'
depends=('readline')
license=('MIT')
options=('!emptydirs')
source=(https://www.lua.org/ftp/lua-$pkgver.tar.gz
        liblua.so.patch
        lua.pc
        LICENSE)
sha1sums=('96d4a21393c94bed286b8dc0568f4bdde8730b22'
          'cdfa66057f43aaf4b5914496aa6a4556f3a6e7a0'
          '1aee8d1a219639d0efc534e483ffa1ee236fb393'
          '05f5f3b7bef0258bd617c505b8992de639af4551')

prepare() {
  cd lua-$pkgver
  patch -p1 -i ../liblua.so.patch

  sed "s/%VER%/$_majorver/g;s/%REL%/$pkgver/g" ../lua.pc > lua.pc
}

build() {
  cd lua-$pkgver

  make MYCFLAGS="$CFLAGS -fPIC" MYLDFLAGS="$LDFLAGS" linux-readline
}

package() {
  cd lua-$pkgver

  make \
    TO_LIB="liblua.a liblua.so liblua.so.$_majorver liblua.so.$pkgver" \
    INSTALL_DATA='cp -d' \
    INSTALL_TOP="$pkgdir"/usr \
    INSTALL_MAN="$pkgdir"/usr/share/man/man1 \
    install
  ln -sf /usr/bin/lua "$pkgdir"/usr/bin/lua$_majorver
  ln -sf /usr/bin/luac "$pkgdir"/usr/bin/luac$_majorver
  ln -sf /usr/lib/liblua.so.$pkgver "$pkgdir"/usr/lib/liblua$_majorver.so

  install -Dm644 lua.pc "$pkgdir"/usr/lib/pkgconfig/lua54.pc
  ln -sf lua54.pc "$pkgdir"/usr/lib/pkgconfig/lua.pc
  ln -sf lua54.pc "$pkgdir"/usr/lib/pkgconfig/lua5.4.pc
  ln -sf lua54.pc "$pkgdir"/usr/lib/pkgconfig/lua-5.4.pc

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/*.{gif,png,css,html} "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
