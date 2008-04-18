# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=evolution-data-server
pkgver=2.22.1
pkgrel=1
pkgdesc="Evolution Data Server provides a central location for addressbook and calendar in the GNOME Desktop"
arch=(i686 x86_64)
depends=('libsoup>=2.4.1' 'nss>=3.11.9' 'libgnome>=2.22.0' 'libglade>=2.6.2' 'gnome-keyring>=2.22.1' 'db4.1')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
url="http://www.gnome.org"
license=('GPL')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1972fa3dbd46c25216b00c1d35f83eaf')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  # Look for correct DB, we want 4.1
  sed -e 's|DB_CFLAGS="-I$withval/include"|DB_CFLAGS="-I$withval/include/db4.1"|' \
      -e 's|DB_LIBS="-L$withval/lib -ldb"|DB_LIBS="-L$withval/lib -ldb-4.1"|' \
      -i configure
  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var  --with-openldap=yes \
    --libexecdir=/usr/lib/evolution-data-server-1.2 \
    --with-krb5=/usr --enable-gnome-keyring \
    --with-libdb=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
