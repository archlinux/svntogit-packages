# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>

pkgname=gettext-mono
pkgver=0.17
pkgrel=2
pkgdesc="mono assemblies for GNU internationalization library"
arch=(i686 x86_64)
url="http://www.gnu.org/software/gettext"
depends=('gcc' 'mono>=1.9')
source=(ftp://ftp.gnu.org/pub/gnu/gettext/gettext-$pkgver.tar.gz)
md5sums=('58a2bc6d39c0ba57823034d55d65d606')

build() {
  # get rid of that .wapi errors; thanks to brice
  mkdir -p $startdir/pkg/weird
  export MONO_SHARED_DIR=$startdir/pkg/weird
            
  cd $startdir/src/gettext-$pkgver
  ./configure --prefix=/usr --enable-csharp=mono
  make || return 1
 # libraries are installed manually
  install -Dm644 gettext-runtime/intl-csharp/GNU.Gettext.dll \
    $startdir/pkg/usr/lib/GNU.Gettext.dll
  install -Dm644 gettext-tools/src/msgfmt.net.exe \
    $startdir/pkg/usr/lib/gettext/msgfmt.net.exe
  install -Dm644 gettext-tools/src/msgunfmt.net.exe \
    $startdir/pkg/usr/lib/gettext/msgunfmt.net.exe
  rm -rf $startdir/pkg/weird
}
# vim: ft=sh ts=2 et
