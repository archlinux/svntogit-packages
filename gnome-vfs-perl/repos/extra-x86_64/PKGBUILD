# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-vfs-perl
_realname=Gnome2-VFS
pkgver=1.080
pkgrel=2
pkgdesc="Gnome2-VFS perl bindings for gnome-vfs"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk2-perl.sourceforge.net/"
makedepends=('perl-extutils-pkgconfig' 'perl-extutils-depends')
depends=('gtk2-perl>=1.160' 'gnome-vfs>=2.20.0' 'perl>=5.10.0')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/gtk2-perl/${_realname}-${pkgver}.tar.gz)
md5sums=('a01ce775f19040276eae4f9e5ca6a59c')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  find ${startdir}/pkg -name '.packlist' -delete
  find ${startdir}/pkg -name 'perllocal.pod' -delete
}
