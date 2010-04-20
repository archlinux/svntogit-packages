# $Id$
# Maintainer: tobias [tobias [at] archlinux.org]
pkgname=mutt
pkgver=1.5.20
pkgrel=4
pkgdesc="A small but very powerful text-based mail client"
arch=(i686 x86_64)
license=('GPL')
url="http://www.mutt.org/"
depends=('slang' 'openssl' 'gdbm' 'mime-types' 'zlib' 'libsasl' 'gpgme')
makedepends=('gnupg')
install=${pkgname}.install
source=(ftp://ftp.mutt.org/mutt/devel/${pkgname}-${pkgver}.tar.gz 
        mutt-unmailbox.patch
        mutt_ssl.patch)
url="http://www.mutt.org/"
md5sums=('027cdd9959203de0c3c64149a7ee351c'
         'fa8e03a49a2fa7b294dc8237d928cdb7'
         '3f54850315502ad47405421339ffae60')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # patch a segfault bug in 1.5.20 -- remove for next release
  patch -p1 < ${srcdir}/mutt-unmailbox.patch || return 1
  # patch for openssl-1
  patch -Np1 -i ${srcdir}/mutt_ssl.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-pop --enable-imap --enable-smtp \
    --with-sasl --with-ssl=/usr --without-idn \
    --enable-hcache --enable-pgp --enable-inodesort \
	 --enable-compressed --with-regex \
	 --enable-gpgme --with-slang=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
  rm -f ${pkgdir}/usr/bin/{flea,muttbug}
  rm -f ${pkgdir}/usr/share/man/man1/{flea,muttbug}.1
  rm -f ${pkgdir}/etc/mime.types*
  install -Dm644 contrib/gpg.rc ${pkgdir}/etc/Muttrc.gpg.dist
}

