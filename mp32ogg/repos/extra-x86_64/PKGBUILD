# $Id$
# Maintainer: Roberto Carvajal <roberto@archlinux.org>
pkgname=mp32ogg
pkgver=0.11
pkgrel=3
pkgdesc="A perl script to convert MP3 files to Ogg Vorbis files."
url='http://faceprint.com/code/'
depends=('perl-mp3-info' 'perl-string-shellquote' 'mpg321' 'vorbis-tools')
source=(ftp://ftp.faceprint.com/pub/software/scripts/$pkgname)

build() {
  mkdir -p $startdir/pkg/usr/bin
  cp $startdir/src/$pkgname $startdir/pkg/usr/bin
  chmod +x $startdir/pkg/usr/bin/$pkgname
}
