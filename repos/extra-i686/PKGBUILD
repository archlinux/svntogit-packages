# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: mgushee

pkgname=djvulibre
pkgver=3.5.20
pkgrel=2
pkgdesc="Suite to create, manipulate and view DjVu ('déjà vu') documents"
arch=("i686" "x86_64")
license=('GPL')
url="http://djvu.sourceforge.net/"
depends=('libtiff' 'hicolor-icon-theme' 'qt3' 'desktop-file-utils' 'libdjvu' 'shared-mime-info')
makedepends=('pkgconfig')
install=djvulibre.install
source=(http://downloads.sourceforge.net/djvu/${pkgname}-${pkgver}.tar.gz) 


build() {
  export MAKEFLAGS="-j1"
  [ -z "${QTDIR}" ] && . /etc/profile.d/qt3.sh
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make LIBDJVU="`pkg-config --libs ddjvuapi`" SUBDIRS_FIRST=tools || return 1
  make LIBDJVU="`pkg-config --libs ddjvuapi`" SUBDIRS_FIRST=tools \
       DESTDIR=${startdir}/pkg plugindir=/usr/lib/mozilla/plugins \
       install-utils install-gui install-i18n || return 1

  #Install icons, launcher files, mime-types.
  install -D -m644 desktopfiles/hi22-djvu.png ${startdir}/pkg/usr/share/icons/22x22/mimetypes/image-vnd.djvu.mime.png
  install -D -m644 desktopfiles/hi32-djvu.png ${startdir}/pkg/usr/share/icons/32x32/mimetypes/image-vnd.djvu.mime.png
  install -D -m644 desktopfiles/hi48-djvu.png ${startdir}/pkg/usr/share/icons/48x48/mimetypes/image-vnd.djvu.mime.png

  install -D -m644 desktopfiles/djvulibre-mime.xml ${startdir}/pkg/usr/share/mime/packages/djvulibre-mime.xml

  install -D -m644 desktopfiles/hi32-djview3.png ${startdir}/pkg/usr/share/icons/hicolor/32x32/apps/djvulibre-djview3.png
  install -D -m644 desktopfiles/djvulibre-djview3.desktop ${startdir}/pkg/usr/share/applications/djvulibre-djview3.desktop
}
md5sums=('c94091de014b3aaf037d3d0f398d36c2')
