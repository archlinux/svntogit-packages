# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=abiword-plugins
pkgver=2.4.6
pkgrel=2
pkgdesc="Various plugins for Abiword"
arch=(i686 x86_64)
license=('GPL')
url="http://www.abisource.com"
options=('!libtool' '!makeflags')
depends=("abiword>=${pkgver}" 'poppler>=0.6' 'aiksaurus>=1.2.1' 
         'libgnomedb>=1.2.2' 'gtkmathview>=0.7.7' 'link-grammar>=4.2.4'
	 'libwmf>=0.2.8.4' 'librsvg>=2.18.1' 'libwpd>=0.8.7' 'libots>=0.4.2'
	 'psiconv>=0.9.8')
source=(http://www.abisource.com/downloads/abiword/${pkgver}/source/abiword-${pkgver}.tar.bz2
	abiword-poppler.patch) 
md5sums=('8ed5fb282b9741aca75b9e47500d39a1' '41365ad59754954cb5cb776f7632bed2')

build() {
  cd ${startdir}/src/abiword-${pkgver}/abiword-plugins
  patch -Np1 -i ${startdir}/src/abiword-poppler.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
