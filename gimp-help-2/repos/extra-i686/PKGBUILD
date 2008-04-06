# $Id: PKGBUILD,v 1.12 2007/12/01 02:34:25 eric Exp $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>

pkgname=gimp-help-2
pkgver=2.4.0
pkgrel=1
pkgdesc="A GIMP help system designed for use with the internal GIMP help
browser, external web browser and HTML renderers"
arch=('i686' 'x86_64')
url="http://docs.gimp.org/"
license=('FDL')
depends=('gimp>=2.4.0')
makedepends=('docbook-xml')
source=(ftp://ftp.gimp.org/pub/gimp/help/gimp-help-${pkgver}.tar.bz2)
md5sums=('fb4402aabce1d7f4eccc1a8739cc7e56')
sha1sums=('a9d65ca8b4e54245d35db9f290f469a44710390d')

build() {
  cd ${startdir}/src/gimp-help-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
