# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: BlueRaven <blue@ravenconsulting.it>
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=pure-ftpd
pkgver=1.0.21
pkgrel=2
pkgdesc="A fast, production quality, standards-conformant FTP server"
url="http://www.pureftpd.org/"
license=('custom')
arch=(i686 x86_64)
depends=('libcap' 'perl')
backup=('etc/pure-ftpd.conf')
install=pure-ftpd.install
source=(ftp://ftp.pureftpd.org/pub/pure-ftpd/releases/$pkgname-$pkgver.tar.bz2\
        pure-ftpd pure-ftpd.conf pure-config.pl)
md5sums=('ca8a8dbec0cd9c8ea92fc4c37ea9c410'
         '13cf942b643db7cf3e612185366391ca'
         '32eece2a4fef7ebe32ec06761bc3edd1'
         '007f1327760272c696d2e365211e552c')
sha1sums=('1405ff2b9b9c3616c4e390eb99779884173a3347'
          'c63f2c3d29a6cfe86d62a20590f101d67f4dddd8'
          '6a8bdadfb84204bb87db4580f5e14212efd53baa'
          '274bf6399afa4fbb6cb8593181c103e3ff7f1070')

build() {
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/usr --with-puredb --with-altlog
   make || return 1
   make prefix=$startdir/pkg/usr install
	install -D -m755 ../pure-ftpd $startdir/pkg/etc/rc.d/pure-ftpd
   install -D -m644 ../pure-ftpd.conf $startdir/pkg/etc/pure-ftpd.conf
   install -D -m755 ../pure-config.pl $startdir/pkg/usr/sbin/pure-config.pl

   #install license
   install -D COPYING $startdir/pkg/usr/share/licenses/pure-fptd/LICENSE
}
