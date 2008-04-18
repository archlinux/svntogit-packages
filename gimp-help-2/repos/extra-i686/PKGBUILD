# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>

pkgname=gimp-help-2
pkgver=2.4.1
pkgrel=1
pkgdesc="A GIMP help system designed for use with the internal GIMP help browser, external web browser and HTML renderers"
arch=('i686' 'x86_64')
url="http://docs.gimp.org/"
license=('FDL')
depends=('gimp>=2.4.0')
makedepends=('docbook-xsl')
options=('!makeflags')
source=(ftp://ftp.gimp.org/pub/gimp/help/gimp-help-${pkgver}.tar.bz2)
md5sums=('da505d7532b6e14713e04b6e79a11379')
sha1sums=('d875a73de4afd0fc134cb73b428b90868ddeb32c')

build() {
  cd ${startdir}/src/gimp-help-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
