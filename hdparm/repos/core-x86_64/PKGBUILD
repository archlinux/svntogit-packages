# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=hdparm
pkgver=8.6
pkgrel=1
pkgdesc="A shell utility for manipulating Linux IDE drive/driver parameters"
arch=(i686 x86_64)
depends=('glibc')
groups=('base')
source=(http://heanet.dl.sourceforge.net/sourceforge/hdparm/${pkgname}-${pkgver}.tar.gz)
license=('BSD')
url="http://sourceforge.net/projects/hdparm/"
md5sums=('237fbceeeba6318b987983fd858994df')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver} || return 1

  # build
  make || return 1

  # install
  mkdir -p ${startdir}/pkg/{usr,sbin} || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -m755 contrib/idectl ${startdir}/pkg/sbin || return 1
  install -m755 contrib/ultrabayd ${startdir}/pkg/sbin || return 1

  # installs empty /usr/share, which we let it do since it causes
  # no harm and it might put something there someday
}
