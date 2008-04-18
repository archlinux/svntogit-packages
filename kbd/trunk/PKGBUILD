# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kbd
pkgver=1.14.1.20080309
pkgrel=2
pkgdesc="Keytable files and keyboard utilities"
arch=('i686' 'x86_64')
url="ftp://ftp.altlinux.org/pub/people/legion/kbd/"
license=('GPL')
groups=('base')
depends=('glibc')
source=(ftp://ftp.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz
        #ftp://ftp.altlinux.org/pub/people/legion/kbd/${pkgname}-${pkgver}.tar.gz
        rename-duplicates.patch)
md5sums=('76e817f11c6ec80d9fc9f3f7ace79b4a'
         'bd2d9f88141a8e78baaa4982f1d1f6c5')

build() {
  cd ${startdir}/src
  #cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i rename-duplicates.patch || return 1

  autoconf
  ./configure --prefix=/usr --datadir=/usr/share/kbd --mandir=/usr/share/man
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes || return 1
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes DESTDIR=${startdir}/pkg install

  # this is needed because initscripts call /bin/loadkeys
  # remove this when next versions of kbd
  # and initscripts with /usr/bin/loadkeys usage will be released
  mkdir ${startdir}/pkg/bin
  ln -s /usr/bin/loadkeys ${startdir}/pkg/bin/loadkeys
}
