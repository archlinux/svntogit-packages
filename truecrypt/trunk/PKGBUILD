# $Id: PKGBUILD,v 1.18 2008/01/25 17:48:42 tpowa Exp $
# Maintainer: Tom K <tom@archlinux.org>

pkgname=truecrypt
pkgver=5.1a
pkgrel=1
pkgdesc="Free open-source cross-platform disk encryption software"
arch=('i686' 'x86_64')
depends=('fuse' 'gtk2' 'libsm')
# N.B. Truecrypt's web-based source download is incompatible with
# makepkg. Source has been placed on ftp.archlinux.org instead
source=(http://ftp.archlinux.org/other/truecrypt/TrueCrypt-$pkgver-Source.tar.gz
	http://prdownloads.sourceforge.net/wxwindows/wxWidgets-2.8.7.tar.bz2
	gcc-4.3.patch)
url="http://www.truecrypt.org/"
license=('custom')
conflicts=('truecrypt-utils')
replaces=('truecrypt-utils')
install=truecrypt.install
options=('force')

build() {
  cd $startdir/src/truecrypt-$pkgver-source
  patch -Np1 -i ../gcc-4.3.patch || return 1
  make WX_ROOT=$startdir/src/wxWidgets-2.8.7 wxbuild || return 1
  make || return 1
  install -Dm755 Main/truecrypt $startdir/pkg/usr/bin/truecrypt
  install -Dm644 License.txt $startdir/pkg/usr/share/licenses/truecrypt/License.txt
}
md5sums=('bf8363f2bb3a24c2fcea588b210b3a16'
         'e3455083afdf6404a569a8bf0701cf13'
         '3ac33867555479f6b935daa32ee7889b')
