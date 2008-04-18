# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=qtparted
pkgver=0.4.5
pkgrel=11
depends=('parted>=1.8.8' 'qt3' 'progsreiserfs' 'ntfsprogs' 'jfsutils' 'xfsprogs')
arch=(i686 x86_64)
pkgdesc="A Partition Magic clone written in C++ using the Qt toolkit"
license=(GPL)
source=(http://heanet.dl.sourceforge.net/sourceforge/qtparted/${pkgname}-${pkgver}.tar.bz2
	parted-1.7-fix.patch)
url="http://qtparted.sourceforge.net"
md5sums=('4541c0aa5475ba38d3cc518c921c8a34' '4ddfadf95e26c81e31a1200dde90da2e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  [ -z "${QTDIR}" ] && . /etc/profile.d/qt3.sh

  # Distribution was rigged for unsermake - re-work for normal make,
  # and support autotools 2.6.  Also fix version identifier (this is
  # a full release, not just cvs).
  sed -i -e 's:0.4.5-cvs:0.4.5:' configure.ac || die "sed configure.ac failed for version id"
  sed -i -e 's:KDE_AUTOCONF_VERS=\":KDE_AUTOCONF_VERS=\"-2.61 :
	s:KDE_AUTOMAKE_VERS=\":KDE_AUTOMAKE_VERS=\"-1.10 :' \
	admin/detect-autoconf.sh || die "sed admin/detect-autoconf.sh for autoconf/automake failed"

  sed -i -e 's:autoconf\*2.5\*:autoconf\*2.5\* | autoconf\*2.6\*:
	s:autoheader\*2.5\*:autoheader\*2.5\* | autoheader\*2.6\*: 
	s:automake\*1.6.\*:automake\*1.10\* | automake\*1.6.\* | automake\*1.7\* | automake\*1.8\* | automake\*1.9\*:'  \
	admin/cvs.sh 

  make -f admin/Makefile.common || return 1
  patch -Np0 -i ${startdir}/src/parted-1.7-fix.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 ${startdir}/pkg/usr/share/applnk/System/qtparted.desktop \
	${startdir}/pkg/usr/share/applications/qtparted.desktop
  rm -r ${startdir}/pkg/usr/share/applnk/
}
