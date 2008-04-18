# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=perl-exiftool
_srcname=Image-ExifTool
pkgver=7.22
pkgrel=1
license=('GPL2')
pkgdesc="reader and rewriter of exif informations that supports raw files"
url="http://www.sno.phy.queensu.ca/~phil/exiftool/"
arch=(i686 x86_64)
depends=('perl>=5.10')
source=(http://www.sno.phy.queensu.ca/~phil/exiftool/${_srcname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('52f254cf58a96668ac05b77e5c3c8436')

build() {
  cd ${startdir}/src/${_srcname}-${pkgver}
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  # remove *.pod, .packlist, and empty dirs:
  find ${startdir}/pkg -name '.packlist' -delete
  find ${startdir}/pkg -name '*.pod' -delete
}
