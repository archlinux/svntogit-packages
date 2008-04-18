# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=imap
pkgver=2007a
pkgrel=2
pkgdesc="An IMAP/POP server"
arch=(i686 x86_64)
license=('APACHE')
url="http://www.washington.edu/imap"
depends=('openssl' 'pam')
provides=('imap-server' 'pop3-server')
conflicts=('courier-mta' 'courier-imap')
source=(ftp://ftp.cac.washington.edu/imap/${pkgname}-${pkgver}1.tar.Z \
  imap ipop2 ipop3)
backup=(etc/xinetd.d/{imap,ipop2,ipop3} etc/ssl/certs/{imapd,ipop3d}.pem)
options=('force')
md5sums=('828a84c64ef933bfcc805b838576a774'
         'e77dedb80c2fec9bf2ef784ed5f976fb'
	 'cc3eba6453242aa0b1bc8881160b2136'
	 '0a5e27183a9b7e8ec5f6703125371e0a')


build() {
  # fix Makefile
  cd $startdir/src/$pkgname-$pkgver/src/osdep/unix
  cp Makefile Makefile.orig
  sed \
    -e "s:-g -fno-omit-frame-pointer -O6:\${CFLAGS}:" \
    -e "s:SSLDIR=/usr/local/ssl:SSLDIR=/usr:" \
    -e "s:SSLCERTS=\$(SSLDIR)/certs:SSLCERTS=/etc/ssl/certs:" \
    < Makefile.orig > Makefile

  cd $startdir/src/$pkgname-$pkgver
  # NOTE: if you wish to enforce SSL, use SSLTYPE=unix.nopwd

if [ "$CARCH" == "x86_64" ]; then
	yes "y" | make lnp SPECIALAUTHENTICATORS=ssl SSLTYPE=unix EXTRACFLAGS="${CFLAGS} -fPIC" || return 1
  else	yes "y" | make lnp SPECIALAUTHENTICATORS=ssl SSLTYPE=unix || return 1
fi

  mkdir -p $startdir/pkg/usr/sbin
  install -D -m755 imapd/imapd $startdir/pkg/usr/sbin/imapd
  install -D -m755 ipopd/ipop2d $startdir/pkg/usr/sbin/ipop2d
  install -D -m755 ipopd/ipop3d $startdir/pkg/usr/sbin/ipop3d
  for i in c-client mail imap4r1 rfc822 linkage misc smtp nntp \
    osdep env_unix env fs ftl nl tcp sslio utf8 utf8aux; do
    install -D -m644 c-client/${i}.h $startdir/pkg/usr/include/imap/${i}.h
  done
  install -D -m644 c-client/c-client.a $startdir/pkg/usr/lib/c-client.a
  ln -sf c-client.a $startdir/pkg/usr/lib/libc-client.a

  # create ssl certs for secure imap
  for i in imapd ipop3d; do
    umask 077
    PEM1=`/usr/bin/mktemp /tmp/openssl.XXXXXX`
    PEM2=`/usr/bin/mktemp /tmp/openssl.XXXXXX`
    /usr/bin/openssl req -newkey rsa:1024 -keyout $$PEM1 \
      -nodes -x509 -days 365 -out  $$PEM2 << EOF
--
SomeState
SomeCity
SomeOrganization
SomeOrganizationalUnit
localhost.localdomain
root@localhost.localdomain
EOF

    cat $$PEM1 >  ${i}.pem
    echo ""    >> ${i}.pem
    cat $$PEM2 >> ${i}.pem
    rm $$PEM1 $$PEM2
    umask 022
  done

  # install 'em
  install -D -m600 imapd.pem $startdir/pkg/etc/ssl/certs/imapd.pem
  install -D -m600 ipop3d.pem $startdir/pkg/etc/ssl/certs/ipop3d.pem

  # install xinetd.d configs
  install -D -m644 ../imap $startdir/pkg/etc/xinetd.d/imap
  install -D -m644 ../ipop2 $startdir/pkg/etc/xinetd.d/ipop2
  install -D -m644 ../ipop3 $startdir/pkg/etc/xinetd.d/ipop3
}
