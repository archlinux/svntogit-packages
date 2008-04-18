# $Id$
# Maintainer: juergen <juergen@archlinux.org>

pkgname=xemacs-sumo
pkgver=20070427
pkgrel=1
pkgdesc="XEmacs Packages"
depends=('xemacs')
source=(http://ftp.xemacs.org/pub/xemacs/packages/$pkgname-${pkgver:0:4}-${pkgver:4:2}-${pkgver:6:2}.tar.bz2)
md5sums=('735fd204c1939f76704b7ba770f59b8c')
arch=(i686 x86_64)
url="ftp://ftp.xemacs.org/pub/xemacs/packages/"
        
build() {
  mkdir -p $startdir/pkg/usr/lib/xemacs
  mv xemacs-packages $startdir/pkg/usr/lib/xemacs/
  chown -R root.root $startdir/pkg
}
