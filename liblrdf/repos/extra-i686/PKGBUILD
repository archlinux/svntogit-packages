# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=liblrdf
pkgver=0.4.0
pkgrel=5
pkgdesc="liblrdf allows categorizing LADSPA plugins"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/lrdf"
depends=('raptor>=1.4.15-2' 'ladspa')
makedepends=('pkgconfig')
license=('GPL')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/lrdf/liblrdf-${pkgver}.tar.gz)
groups=('ladspa-plugins')
md5sums=('327a5674f671c4b360c6353800226877')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

