# Maintainer: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lua
pkgver=5.3.5
_majorver=${pkgver%.*}
pkgrel=1
pkgdesc='Powerful lightweight programming language designed for extending applications'
arch=('x86_64')
url='http://www.lua.org/'
depends=('readline')
license=('MIT')
options=('!emptydirs')
source=(https://www.lua.org/ftp/lua-$pkgver.tar.gz
        liblua.so.patch
        lua.pc
        LICENSE)
sha1sums=('112eb10ff04d1b4c9898e121d6bdf54a81482447'
          'cb7b28999970358e03bffcb58578a651bf9b287e'
          '1aee8d1a219639d0efc534e483ffa1ee236fb393'
          '05f5f3b7bef0258bd617c505b8992de639af4551')

prepare() {
  cd lua-$pkgver
  patch -p1 -i ../liblua.so.patch

  sed "s/%VER%/$_majorver/g;s/%REL%/$pkgver/g" ../lua.pc > lua.pc

  # Lua 5.3.4 has wrong release version in its Makefile. Fix it.
  sed "s/^R= \$V.4/R= \$V.5/" -i Makefile
}

build() {
  cd lua-$pkgver

  # quite a lot of packages still use lua 5.1 API, enable 5.1 compat mode
  make MYCFLAGS="$CFLAGS -fPIC -DLUA_COMPAT_5_2 -DLUA_COMPAT_5_1" MYLDFLAGS="$LDFLAGS" linux
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

  install -Dm644 lua.pc "$pkgdir"/usr/lib/pkgconfig/${pkgname}53.pc
  ln -sf /usr/lib/pkgconfig/${pkgname}53.pc "$pkgdir"/usr/lib/pkgconfig/$pkgname.pc

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/*.{gif,png,css,html} "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
