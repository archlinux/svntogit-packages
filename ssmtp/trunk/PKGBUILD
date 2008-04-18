# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=ssmtp
pkgver=2.61
pkgrel=5
pkgdesc="Extremely simple MTA to get mail off the system to a mailhub"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnutls')
source=(http://ftp.debian.org/debian/pool/main/s/ssmtp/${pkgname}_${pkgver}.orig.tar.gz \
        http://ftp.debian.org/debian/pool/main/s/ssmtp/ssmtp_2.61-12.1.diff.gz)
backup=('etc/ssmtp/ssmtp.conf' 'etc/ssmtp/revaliases')
conflicts=('exim')
url="http://packages.debian.org/stable/mail/ssmtp"
md5sums=('957e6fff08625fe34f4fc33d0925bbc9'
         'ff1b2e93b610a0e50365561c6b2eabbc')
options=('!makeflags' '!emptydirs')

## if you build in chroot make sure the chroots fully qualified hostname id the same as in your real root system ##

build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -p1 -i ../ssmtp_2.61-12.1.diff
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--enable-md5auth --enable-ssl
	make || return 1
   yes | make prefix=$startdir/pkg/usr SSMTPCONFDIR=$startdir/pkg/etc/ssmtp install
   cp ssmtp.conf $startdir/pkg/etc/ssmtp/
   ln -s ../sbin/ssmtp $startdir/pkg/usr/sbin/sendmail
   ln -s ../sbin/ssmtp $startdir/pkg/usr/sbin/newaliases
   ln -s ../sbin/ssmtp $startdir/pkg/usr/sbin/mailq
}
