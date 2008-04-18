# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=zim
_realname=Zim
pkgver=0.23
pkgrel=1
pkgdesc="A WYSIWYG text editor that aims at bringing the concept of a wiki to the desktop"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://pardus-larus.student.utwente.nl/~pardus/projects/zim/"
source=(http://pardus-larus.student.utwente.nl/~pardus/downloads/${_realname}/${_realname}-${pkgver}.tar.gz)
depends=('gtk2-perl' 'librsvg' 'perl-file-mimeinfo')
makedepends=('perl-module-build')
md5sums=('84197b5d2e45898ddb67746c71cc3b1a')

build() {
  cd ${startdir}/src/${_realname}-${pkgver}
  eval `perl -V:archname`
  perl Build.PL destdir=${startdir}/pkg \
   --install_path lib=/usr/lib/perl5/site_perl/current \
   --install_path arch=/usr/lib/perl5/site_perl/current/${archname}
  perl Build
  perl Build install
}
