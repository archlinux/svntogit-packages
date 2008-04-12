# $Id: PKGBUILD,v 1.9 2008/01/05 17:38:08 andyrtr Exp $
# Contributor: Tom K <tomk@runbox.com>

pkgname=epdfview
pkgver=0.1.6
pkgrel=6
pkgdesc="A free lightweight PDF document viewer."
license=(GPL)
arch=(i686 x86_64)
depends=('poppler-glib>=0.8.0')
makedepends=('pkgconfig')
source=(http://www.emma-soft.com/projects/epdfview/chrome/site/releases/epdfview-${pkgver}.tar.bz2
	epdfview-0.1.6-print-segfault.patch
	IDocumentLink.patch)
url="http://www.emma-soft.com/projects/epdfview/"
md5sums=('cce9edb41b4a8308e0ef0eea24b5a1ab'
         'c083ee8e0e226b308e1c38cb94ee42e7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ../epdfview-0.1.6-print-segfault.patch || return 1
  patch -Np0 -i ${startdir}/src/IDocumentLink.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
