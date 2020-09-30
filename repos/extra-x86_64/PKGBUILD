# Maintainer: 

pkgname=lua53
pkgver=5.3.6
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
sha512sums=('ccc380d5e114d54504de0bfb0321ca25ec325d6ff1bfee44b11870b660762d1a9bf120490c027a0088128b58bb6b5271bbc648400cab84d2dc22b512c4841681'
            '38fb153c0a12c2f6e93b728072d7c99f1776b9c25e48a06e3b6757a18fd7040002a935db2079723faa5eff86e50e15870257b1c3e69a9443001ac1d200d3d228'
            'a3ae5f5c63a27956a2c69464cf966512be7404aef72d49b0b3b17e35999ceed04ec7be12ef19269f4cac908141b98dd5d16df9c238823fe0c1e068212914657a'
            '7177faeef3d7699748d3523d7884f8037fc04be02a51bd3f0590de6ef074f723f2462a6fcc23c7625a7d8667247d62fa2b41cf94d0a8fd3f0df1e4a1b9ed336f')

prepare() {
  cd lua-$pkgver
  patch -p1 -i ../liblua.so.patch

  sed "s/%VER%/${pkgver%.*}/g;s/%REL%/$pkgver/g" ../lua.pc > lua.pc

  # Lua 5.3.4 has wrong release version in its Makefile. Fix it.
  sed "s/^R= \$V.4/R= \$V.5/" -i Makefile

  sed -e 's:llua:llua5.3:' -e 's:/include:/include/lua5.3:' -i lua.pc
  sed -r -e '/^LUA_(SO|A|T)=/ s/lua/lua5.3/' -e '/^LUAC_T=/ s/luac/luac5.3/' -i src/Makefile
}

build() {
  cd lua-$pkgver

  make MYCFLAGS="$CFLAGS -fPIC" MYLDFLAGS="$LDFLAGS" linux
}

package() {
  cd lua-$pkgver

  make \
    TO_BIN='lua5.3 luac5.3' \
    TO_LIB="liblua5.3.a liblua5.3.so liblua5.3.so.5.3 liblua5.3.so.$pkgver" \
    INSTALL_DATA='cp -d' \
    INSTALL_TOP="$pkgdir"/usr \
    INSTALL_INC="$pkgdir"/usr/include/lua5.3 \
    INSTALL_MAN="$pkgdir"/usr/share/man/man1 \
    install

  install -Dm644 lua.pc "$pkgdir"/usr/lib/pkgconfig/lua53.pc
  ln -sf lua53.pc "$pkgdir"/usr/lib/pkgconfig/lua5.3.pc
  ln -sf lua53.pc "$pkgdir"/usr/lib/pkgconfig/lua-5.3.pc

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/*.{gif,png,css,html} "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  ln -s liblua5.3.so "$pkgdir"/usr/lib/liblua.so.5.3
  ln -s liblua5.3.so "$pkgdir"/usr/lib/liblua.so.$pkgver
 
  cd "$pkgdir"/usr/share/man/man1
  mv lua.1 lua5.3.1
  mv luac.1 luac5.3.1
}
