# $Id: PKGBUILD,v 1.1 2007/04/28 18:05:18 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=mime-types
pkgver=1.0
pkgrel=1
pkgdesc="Provides /etc/mime.types"
arch=(i686 x86_64)
backup=(etc/mime.types)
source=(mime.types)
md5sums=('aa90248272ba2e9dca0a243746686739')

build() {
  cd ${startdir}/src
  mkdir ${startdir}/pkg/etc
  install -m644 mime.types ${startdir}/pkg/etc/
}
