# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=stunnel
pkgver=4.20
pkgrel=1
pkgdesc="A program that allows you to encrypt arbitrary TCP connections inside SSL."
arch=(i686 x86_64)
url="http://www.stunnel.org"
depends=('openssl' 'perl' 'tcp_wrappers' 'zlib')
source=(http://www.stunnel.org/download/stunnel/src/${pkgname}-${pkgver}.tar.gz
        stunnel-nopem.patch stunnel)
install="$pkgname.install"
md5sums=('cf9940395d3503018f721c962528d2ec' 'aec994e209405420eed197fd15ca09b0'\
         '2e249654279cc2ffe41df58e68350e5b')

build() {
  cd $startdir/src/$pkgname-$pkgver

  # don't create a certificate...
  /usr/bin/patch -p1 < ../stunnel-nopem.patch 

  ./configure --prefix=/usr --sysconfdir=/etc --with-tcp-wrappers \
      --localstatedir=/var
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install

  for i in ca.pl importCA.sh; do
    /bin/install -D -m 755 tools/$i $startdir/pkg/usr/share/stunnel/$i
  done
  /bin/install -D -m 755 $startdir/stunnel $startdir/pkg/etc/rc.d/stunnel
  /bin/sed -i -e "s:/usr/var/run/stunnel/:/var/run/stunnel:g" \
      -e "s:nobody:stunnel:g" -e "s:nogroup:stunnel:g" \
      $startdir/pkg/etc/stunnel/stunnel.conf-sample
  /bin/install -D -m 644 tools/stunnel.cnf \
      $startdir/pkg/etc/stunnel/stunnel.cnf

  # libtoolslay
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
# vim: ts=2 sw=2 et ft=sh
