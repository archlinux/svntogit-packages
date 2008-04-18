# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=qsynth
pkgver=0.3.2
pkgrel=1
pkgdesc="Qt GUI for fluidsynth"
license=("GPL")
arch=("i686" "x86_64")
url="http://qsynth.sourceforge.net/qsynth-index.html"
depends=('fluidsynth' 'qt>=4.3')
source=(http://mesh.dl.sourceforge.net/sourceforge/qsynth/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}


md5sums=('be744e4898d05d1b2db89875abac10ba')
