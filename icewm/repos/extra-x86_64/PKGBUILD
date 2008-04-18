# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=icewm
pkgver=1.2.35
pkgrel=1
pkgdesc="A Window Manager designed for speed, usability, and consistency"
arch=('i686' 'x86_64')
url="http://www.icewm.org/"
license=('LGPL')
depends=('gcc-libs' 'imlib' 'libxrandr' 'libxft' 'libsm' 'libxinerama')
options=('docs')
source=(http://downloads.sourceforge.net/sourceforge/icewm/$pkgname-$pkgver.tar.gz icewm.desktop)
md5sums=('a2adc53ab4c0c7ca6daa1ca4c697ffe9' 'a3ed467f0199792205b04272402a9945')
sha1sums=('a0174901ca89aa091a58efedfec1536c5e477210' '7dcb1f2c89792a35b687182584ed9baa0d34cc80')

build() {
   cd $startdir/src/$pkgname-$pkgver || return 1
   ./configure --prefix=/usr --sysconfdir=/etc --with-imlib \
     --enable-shaped-decorations --enable-gradients || return 1
   make || return 1
   make DESTDIR=$startdir/pkg install install-man install-docs || return 1
   install -D -m644 ../$pkgname.desktop $startdir/pkg/etc/X11/sessions/$pkgname.desktop
}
