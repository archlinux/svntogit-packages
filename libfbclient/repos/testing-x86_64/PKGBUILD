# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Carlier Laurent <lordheavym@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=libfbclient
pkgver=4.0.0.2496
pkgrel=1
pkgdesc="Client library for Firebird"
arch=('x86_64')
url="https://www.firebirdsql.org/"
license=('custom')
depends=('gcc-libs' 'libtommath')
makedepends=('editline' 'libtomcrypt' 're2' 'unzip')
source=(https://github.com/FirebirdSQL/firebird/releases/download/v4.0.0/Firebird-$pkgver-0.tar.xz
        shared-re2.patch update-re2.patch
        LICENSE)
sha512sums=('110f1e9b245631ba04fb1f3f3fe16209e432157615c5c23046a277f3e6a164a2142c6732e793d9cc6650d65239a0da8bf37a74329134bd006b7d2cb070812bd6'
            '7d431b6662df6f35ddd4d850de646adc4e10f6963ab5b73595de3de9a4465b5e32d28cebb68934d83e105671505de171924c6ba6539bfa5b98d8be3d7f7fab7f'
            'eb61d677461c80366d1458e9d98387f139f71fd0f49e3cf538a3656223d61470336d51afdd3d7929593ab8666ccbf95e11cb80275ba8d5588771592b0f70346c'
            '1e4c24f60d2cdc1a89b52b45f778ed264ae14428a940b0509ca5c50182aed6149b7a6a546e7d08b0f264bafde81a210abe20db204c20db596f5fc2ec205ac37e')

prepare() {
  patch -d Firebird-$pkgver-0 -p1 < shared-re2.patch
  patch -d Firebird-$pkgver-0 -p1 < update-re2.patch

  # Ensure system libs are used
  rm -r Firebird-$pkgver-0/extern/{editline,libtommath,libtomcrypt,zlib}
}

build() {
  cd Firebird-$pkgver-0

  ./configure --prefix=/usr \
    --without-fbsbin --without-fbconf --without-fbdoc --without-fbsample \
    --without-fbsample-db --without-fbintl --without-fbmisc --without-fbhelp \
    --without-fbsecure-db --with-fbmsg=/usr/share/firebird --without-fblog \
    --without-fbglock --without-fbplugins --without-fbtzdata --with-system-editline

  make
}

package() {
  cd Firebird-$pkgver-0

  mkdir -p "$pkgdir"/usr/{bin,share/{firebird,licenses/$pkgname}}

  cp -R gen/Release/firebird/{lib,include} "$pkgdir"/usr
  rm -f "$pkgdir"/usr/lib/{libdecFloat.a,libedit.a}

  install -m644 gen/Release/firebird/*.msg "$pkgdir"/usr/share/firebird
  install -m755 gen/Release/firebird/bin/fb_config "$pkgdir"/usr/bin
  install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Add libgds support FS#30062 FS#30282
  cd "$pkgdir"/usr/lib
  ln -s libfbclient.so libgds.so.0
  ln -s libfbclient.so libgds.so
}
