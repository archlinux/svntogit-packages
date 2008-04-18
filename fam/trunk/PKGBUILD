# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=fam
pkgver=2.7.0
pkgrel=10
pkgdesc="File Alteration Monitor - used by KDE, GNOME and others"
arch=(i686 x86_64)
license=('LGPL' 'GPL')
depends=('portmap' 'gcc-libs')
url="http://oss.sgi.com/projects/fam/"
backup=(etc/fam/fam.conf)
options=('!makeflags')
source=(ftp://oss.sgi.com/projects/fam/download/stable/${pkgname}-${pkgver}.tar.gz
	fam-2.7.0-dnotify.patch
	fam-2.7.0-largefiles.patch
	include_fam_h.patch
	fam
	fam-2.7.0-noc++.patch)
md5sums=('1bf3ae6c0c58d3201afc97c6a4834e39'
         '073d1763318344635ea316293390205c'
         '47b41e0b0498793af004696a096d7da1'
         '2638b8ffacb9f03b6e438e08ea7b290a'
         '45b648907ba1c7edec17fb544f1f4a13'
         '0274cd113d3dcb015653b5606c7714ac')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/fam-2.7.0-dnotify.patch || return 1
  patch -Np1 -i ${startdir}/src/fam-2.7.0-largefiles.patch || return 1
  patch -Np0 -i ${startdir}/src/include_fam_h.patch || return 1
  patch -Np1 -i ${startdir}/src/fam-2.7.0-noc++.patch || return 1

  chmod 755 configure || return 1

  autoheader || return 1
  aclocal || return 1
  automake -a -c || return 1
  autoconf || return 1
  libtoolize --copy --force || return 1

  ./configure --prefix=/usr --sysconfdir=/etc/fam
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m755 ../fam ${startdir}/pkg/etc/rc.d/fam
  # Don't libtoolslay fam, gamin shouldn't be slayed either
}
