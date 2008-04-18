# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
pkgname=wxgtk-2.6
pkgver=2.6.4
pkgrel=2
pkgdesc="wxGTK - GTK+ implementation of wxWidgets API for GUI"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.10.9' 'mesa')
replaces=('wxgtk-gtk1')
conflicts=('wxgtk-gtk1')
provides=('wxgtk-gtk1')
source=(http://downloads.sourceforge.net/wxwindows/wxGTK-${pkgver}.tar.bz2
	wxgtk-borderfree.patch)
url="http://wxwidgets.org"
md5sums=('ce0fd2b425bc98957cf70eea5f154b49' 'cffc3739d315e7d78299bd75f25ff5c4')

build() {
  cd ${startdir}/src/wxGTK-${pkgver}
  patch -Np0 -i ${startdir}/src/wxgtk-borderfree.patch || return 1
  ./configure --prefix=/usr \
              --with-gtk=2 \
              --with-opengl \
              --enable-unicode \
              --without-gnomeprint \
              --enable-optimize || return 1
  make || return 1
  make -C locale allmo
  make DESTDIR=${startdir}/pkg install || return 1
  cd contrib/src
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -f ${startdir}/pkg/usr/bin/wx-config
  rm -f ${startdir}/pkg/usr/bin/wxrc
  ln -sf /usr/lib/wx/config/gtk2-unicode-release-2.6 ${startdir}/pkg/usr/bin/wx-config-2.6

  rm -rf ${startdir}/pkg/usr/share/bakefile
  find ${startdir}/pkg/usr/share/locale -name wxmsw.mo | xargs rm -f

  for i in ${startdir}/pkg/usr/share/locale/*/LC_MESSAGES/wxstd.mo; do
    NEWNAME=${i/wxstd.mo/compat-wxstd26.mo}
    mv $i $NEWNAME;
  done
  mv ${startdir}/pkg/usr/share/aclocal/wxwin.m4 \
   ${startdir}/pkg/usr/share/aclocal/wxwin-2.6.m4
}
