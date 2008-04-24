# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=zim
_realname=Zim
pkgver=0.24
pkgrel=1
pkgdesc="A WYSIWYG text editor that aims at bringing the concept of a wiki to the desktop"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://zim-wiki.org/"
source=(http://www.zim-wiki.org/downloads/${_realname}-${pkgver}.tar.gz)
depends=('gtk2-perl' 'librsvg' 'perl-file-mimeinfo')
md5sums=('42f5ec2206eecd892bcfc84f42623540')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  perl Build.PL destdir=${startdir}/pkg installdirs=vendor
  perl Build
  perl Build install
}
