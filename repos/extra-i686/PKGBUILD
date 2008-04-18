# $Id$
# Maintainer: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=claws-mail
pkgver=3.3.1
pkgrel=1
pkgdesc="A GTK+ based e-mail client."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.claws-mail.org"
depends=('aspell>=0.60.5-2' 'gtk2>=2.12.7-1' 'openssl>=0.9.8g-2' 'startup-notification>=0.9-1'
         'gpgme>=1.1.6-1' 'libetpan>=0.52-3' 'libsm>=1.0.3-' 'db>=4.6' 'curl>=7.18.0-1' 'dbus-glib>=0.74-1')
makedepends=('compface' 'bogofilter')
replaces=('sylpheed-claws')
provides=('claws')
options=(!libtool)
install=claws-mail.install
source=(http://downloads.sourceforge.net/sourceforge/sylpheed-claws/${pkgname}-${pkgver}.tar.bz2)
md5sums=('f4bfa174cf1e6bda86ec5ff276be9d9a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-aspell \
    --enable-openssl \
    --enable-ldap \
    --disable-dillo-viewer-plugin \
    --enable-clamav-plugin \
    --enable-crash-dialog \
    --enable-pgpmime-plugin \
    --enable-spamassassin-plugin \
    --disable-imlib \
    --disable-jpilot

  make || return 1
  make DESTDIR=${startdir}/pkg install
 # build and install extra tools
  cd tools
  make
   # all executables and .conf files ; only top directory
  find -maxdepth 1 -type f -and -perm /111 -or -name '*.conf' | while read i ; do
      install -D -m755 ${i} \
        ${startdir}/pkg/usr/lib/claws-mail/tools/${i}
  done
  cd ..

 # clean-up docs ...
  rm -rf ${startdir}/pkg/usr/share/claws-mail
}
