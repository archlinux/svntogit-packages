# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Low Kian Seong <fastmail_low@speedymail.org>

pkgname=bogofilter
pkgver=1.1.6
pkgrel=1
pkgdesc="A fast Bayesian spam filtering tool"
arch=(i686 x86_64)
license=(GPL3)
url="http://bogofilter.sourceforge.net"
depends=('db>=4.6' 'perl' 'gsl')
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('35ec52e5d2c58de04a1e02ddcc8d0252')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc/bogofilter  \
              --localstatedir=/var \
              --enable-transcations
  make || return 1
  make DESTDIR=$startdir/pkg install
}
