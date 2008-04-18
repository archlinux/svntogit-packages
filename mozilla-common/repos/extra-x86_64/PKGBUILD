# $Id$
# Maintainer: dale <dale@archlinux.org>

pkgname=mozilla-common
pkgver=1.1
pkgrel=2
pkgdesc="Common Initialization Profile for Mozilla.org products"
arch=(i686 x86_64)
url="http://www.mozilla.org/"
source=(mozilla-common.sh)

build() {
  mkdir -p ${startdir}/pkg/etc/profile.d
  mkdir -p ${startdir}/pkg/opt/mozilla/lib/plugins
  mkdir -p ${startdir}/pkg/opt/mozilla/lib/pkgconfig
  install -m755 ${startdir}/src/mozilla-common.sh ${startdir}/pkg/etc/profile.d
}
md5sums=('909841d1f6c09bd8d3641abfc88bb20a')
