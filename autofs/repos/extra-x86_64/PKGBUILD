# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=autofs
pkgver=4.1.4
pkgrel=4
pkgdesc="A kernel-based automounter for Linux."
arch=(i686 x86_64)
url="ftp://ftp.kernel.org/pub/linux/daemons/autofs"
depends=('libldap')
backup=(etc/autofs/auto.master etc/conf.d/autofs)
source=($url/v4/${pkgname}-${pkgver}.tar.bz2
        ${pkgname}
        ${pkgname}.conf.d
        auto.master
        auto.misc
        auto.net)
md5sums=('7e3949114c00665b4636f0c318179657' '80b77182aa957646a2074433d3890518'\
         'ddd69346754419faee15fc4c7edeb8b8' '0543a0d172eaec300e8d08708440dd4b'\
         '0be409ef0cdf0255ce701ed4ba9e46b5' 'e4d945d63abc0488a47a5e2a750e8c3b')

build() {
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/${pkgname}-${pkgver}
  /bin/sed -i "s:-O3 -fomit-frame-pointer -Wall:${CFLAGS}:" \
      Makefile.rules
  /bin/sed -i "s:SUBDIRS = lib daemon modules man samples:SUBDIRS = lib daemon modules man:" \
      Makefile.rules
  ./configure --prefix=/usr --sysconfdir=/etc/autofs
  /usr/bin/make || return 1
  /usr/bin/make INSTALLROOT=${startdir}/pkg install
  
  local conf_file
  for conf_file in auto.{master,misc}; do
    /bin/install -D -m 644 ${startdir}/$conf_file \
        ${startdir}/pkg/etc/autofs/$conf_file
  done

  /bin/install -m 755 ${startdir}/auto.net \
      ${startdir}/pkg/etc/autofs/auto.net
  /bin/sed -i "s:/etc:/etc/autofs:g" \
      ${startdir}/pkg/usr/man/man5/auto.master.5
  /bin/install -D -m 755 ${startdir}/autofs ${startdir}/pkg/etc/rc.d/autofs
  /bin/install -D -m 644 ${startdir}/autofs.conf.d \
      ${startdir}/pkg/etc/conf.d/autofs
}
# vim: ts=2 sw=2 et ft=sh
