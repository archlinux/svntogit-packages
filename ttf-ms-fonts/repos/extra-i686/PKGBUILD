# $Id$
# Maintainer: dale <dale@archlinux.org>
pkgname=ttf-ms-fonts
pkgver=2.0
pkgrel=1
pkgdesc="Un-extracted TTF Fonts from Microsoft"
arch=(i686 x86_64)
url="http://corefonts.sourceforge.net/"
sfpath="http://heanet.dl.sourceforge.net/sourceforge/corefonts/"
depends=(cabextract xorg-fonts-encodings xorg-font-utils fontconfig)
install=ttf-ms-fonts.install
source=($sfpath/andale32.exe $sfpath/arial32.exe $sfpath/arialb32.exe \
        $sfpath/comic32.exe $sfpath/courie32.exe $sfpath/georgi32.exe \
        $sfpath/impact32.exe $sfpath/times32.exe $sfpath/trebuc32.exe \
        $sfpath/verdan32.exe $sfpath/webdin32.exe $sfpath/wd97vwr32.exe)
md5sums=('cbdc2fdd7d2ed0832795e86a8b9ee19a' '9637df0e91703179f0723ec095a36cb5'\
         'c9089ae0c3b3d0d8c4b0a95979bb9ff0' '2b30de40bb5e803a0452c7715fc835d1'\
         '4e412c772294403ab62fb2d247d85c60' '4d90016026e2da447593b41a8d8fa8bd'\
         '7907c7dd6684e9bade91cff82683d9d7' 'ed39c8ef91b9fb80f76f702568291bd5'\
         '0d7ea16cac6261f8513a061fbfcdb2b5' '12d2a75f8156e10607be1eaa8e8ef120'\
         '230a1d13a365b22815f502eb24d9149b' 'efa72d3ed0120a07326ce02f051e9b42')

build() {
  mkdir -p $startdir/pkg/tmp/${pkgname}
  chmod 1777 $startdir/pkg/tmp
  install -m644 $startdir/src/*.exe $startdir/pkg/tmp/$pkgname
}
