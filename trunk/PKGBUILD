# $Id$
# Maintainer: tobias [tobias [at] archlinux.org]
pkgname=mutt
pkgver=1.5.17
pkgrel=4
pkgdesc="A small but very powerful text-based mail client"
arch=(i686 x86_64)
license=('GPL')
url="http://www.mutt.org/"
depends=('ncurses' 'openssl>=0.9.8e' 'gdbm' 'mime-types' 'zlib' 'libsasl')
makedepends=('gnupg')
install=${pkgname}.install
source=(ftp://ftp.mutt.org/mutt/devel/${pkgname}-${pkgver}.tar.gz)
url="http://www.mutt.org/"
md5sums=('49387458be0cb52b85ae0d73af699aae')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-pop --enable-imap --enable-smtp \
    --with-sasl --with-ssl --without-idn \
    --enable-hcache --enable-inodesort
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -f ${startdir}/pkg/usr/bin/{flea,muttbug}
  rm -f $startdir/pkg/usr/share/man/man1/{flea,muttbug}.1
  rm -f ${startdir}/pkg/etc/mime.types*
  install -Dm644 contrib/gpg.rc ${startdir}/pkg/etc/Muttrc.gpg.dist
}
