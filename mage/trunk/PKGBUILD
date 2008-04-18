# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=mage
pkgver=6.44.060606
pkgrel=1
pkgdesc="Mage is a 3D vector display program which shows kinemage graphics. Used in both teaching and research, in applications ranging from estuary ecology to X-ray crystallography model quality assessments."
arch=(i686 x86_64)
url="http://kinemage.biochem.duke.edu/software/mage.php"
depends=('libxmu' 'lesstif')
#source=(ftp://kinemage.biochem.duke.edu/pub/software/mage/$pkgname.$pkgver.src.tgz)
source=(http://kinemage.biochem.duke.edu/downloads/software/mage/mage.$pkgver.src.tgz)

build() {
  cd $startdir/src/$pkgname.$pkgver
  make -f Makefile.linux dynamic || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp mage $startdir/pkg/usr/bin
}

md5sums=('aa49ae2cd466d718891391f593202f97')
