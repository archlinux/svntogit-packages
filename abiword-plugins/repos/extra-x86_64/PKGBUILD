# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=abiword-plugins
pkgver=2.6.2
pkgrel=1
pkgdesc="Various plugins for Abiword"
arch=(i686 x86_64)
license=('GPL')
url="http://www.abisource.com"
options=('!libtool' '!makeflags')
depends=("abiword>=${pkgver}" 'aiksaurus>=1.2.1' 'libgnomedb>=1.2.2'
         'gtkmathview>=0.7.7' 'link-grammar>=4.2.4' 'libwmf>=0.2.8.4'
         'librsvg>=2.18.1' 'libwpd>=0.8.7' 'psiconv>=0.9.8' 'boost')
source=(http://www.abisource.com/downloads/abiword/${pkgver}/source/abiword-plugins-${pkgver}.tar.gz
        http://www.abisource.com/downloads/abiword/${pkgver}/source/abiword-${pkgver}.tar.gz)
md5sums=('8e3f0717327b712c6d091128709f5599'
         '8e756c0529880fbe6ea3aaef8d5df0b5')

build() {
  cd "${startdir}/src/abiword-plugins-${pkgver}"
  ./configure --prefix=/usr --with-abiword="${startdir}/src/abiword-${pkgver}/"
  make || return 1
  make DESTDIR="${startdir}/pkg" install
}
