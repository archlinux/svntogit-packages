# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributors: John Proctor <jproctor@prium.net>
#               Jeramy Rutley <jrutley@gmail.com>
pkgname=ruby
pkgver=1.8.6_p114
_pkgver=1.8.6-p114
pkgrel=1
pkgdesc="An object-oriented language for quick and easy programming"
arch=(i686 x86_64)
license=('custom')
url="http://www.ruby-lang.org/en/"
depends=('gdbm' 'db>=4.6' 'openssl>=0.9.8g' 'zlib' 'readline' 'termcap-compat')
makedepends=('tk>=8.5')
source=(ftp://ftp.ruby-lang.org/pub/ruby/stable/${pkgname}-${_pkgver}.tar.bz2) 
force=y
md5sums=('b4d0c74497f684814bcfbb41b7384a71')
options=('!emptydirs')

build() {
  cd ${startdir}/src/${pkgname}-${_pkgver}
  ./configure --prefix=/usr --enable-shared --enable-pthread
  make || return 1
  make DESTDIR=${startdir}/pkg install
  #generate the ri docs
  make -j1 DESTDIR=${startdir}/pkg install-doc
  install -Dm644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}

