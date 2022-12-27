# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lua
pkgver=5.4.4
_majorver=${pkgver%.*}
pkgrel=3
pkgdesc='Powerful lightweight programming language designed for extending applications'
arch=('x86_64')
url='https://www.lua.org/'
depends=('readline')
license=('MIT')
options=('!emptydirs' 'debug')
source=(https://www.lua.org/ftp/lua-$pkgver.tar.gz
        liblua.so.patch
        lua.pc
        LICENSE)
sha256sums=('164c7849653b80ae67bec4b7473b884bf5cc8d2dca05653475ec2ed27b9ebf61'
            'a8a7f89ab0c03b4bc1d58a935c54df792ad628edb4d1788c5ac66e4fc2d9f800'
            'ca9252633e782b8f85d6a94ea4f6babd4fe30bd759085b373160b1878e36ff78'
            '142fb08b41a807b192b4b2c166696a1830a1c97967e5099ad0e579bf500e1da4')

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
