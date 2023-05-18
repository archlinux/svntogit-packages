# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lua
pkgver=5.4.6
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
sha256sums=('7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88'
            'a8a7f89ab0c03b4bc1d58a935c54df792ad628edb4d1788c5ac66e4fc2d9f800'
            'ca9252633e782b8f85d6a94ea4f6babd4fe30bd759085b373160b1878e36ff78'
            '142fb08b41a807b192b4b2c166696a1830a1c97967e5099ad0e579bf500e1da4')

prepare() {
  patch -d lua-$pkgver -p1 -i ../liblua.so.patch
  cp -r lua-$pkgver lua++-$pkgver

  sed "s/%VER%/$_majorver/g;s/%REL%/$pkgver/g" lua.pc > lua-$pkgver/lua.pc
  sed "s/%VER%/$_majorver/g;s/%REL%/$pkgver/g;s/-llua/-llua++/g" lua.pc > lua++-$pkgver/lua++.pc
}

build() {
  cd lua-$pkgver

  make MYCFLAGS="$CFLAGS -fPIC" MYLDFLAGS="$LDFLAGS" linux-readline

  cd ../lua++-$pkgver

  make MYCFLAGS="$CXXFLAGS -fPIC" MYLDFLAGS="$LDFLAGS" CC=g++ LUA_A=liblua++.a LUA_SO=liblua++.so linux-readline
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

  cd ../lua++-$pkgver
  make \
    TO_LIB="liblua++.a liblua++.so liblua++.so.$_majorver liblua++.so.$pkgver" \
    INSTALL_BIN=null INSTALL_INC=null INSTALL_MAN=../null \
    INSTALL_DATA='cp -d' \
    INSTALL_TOP="$pkgdir"/usr \
    install
  ln -sf /usr/lib/liblua++.so.$pkgver "$pkgdir"/usr/lib/liblua++$_majorver.so

  install -Dm644 lua++.pc "$pkgdir"/usr/lib/pkgconfig/lua++54.pc
  ln -sf lua++54.pc "$pkgdir"/usr/lib/pkgconfig/lua++.pc
  ln -sf lua++54.pc "$pkgdir"/usr/lib/pkgconfig/lua++5.4.pc
  ln -sf lua++54.pc "$pkgdir"/usr/lib/pkgconfig/lua++-5.4.pc
}
