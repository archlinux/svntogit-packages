# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
pkgname=xemacs-base
pkgver=2.10
pkgrel=1
pkgdesc="Fundamental XEmacs support, you almost certainly need this"
arch=(i686 x86_64)
depends=('xemacs')
conflicts=('xemacs-sumo')
source=(http://ftp.xemacs.org/pub/xemacs/packages/$pkgname-$pkgver-pkg.tar.gz)
md5sums=('aeb02471310ce01a438a7409435410ad')

build() {
  cd $startdir/src
  for subdir in etc lisp; do 
      mkdir -p $startdir/pkg/usr/lib/xemacs/xemacs-packages/${subdir}
      cp -a ${subdir}/*  $startdir/pkg/usr/lib/xemacs/xemacs-packages/${subdir}
  done
}