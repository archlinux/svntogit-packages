# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Manolis Tzanidakis
#

pkgname=ucspi-ssl
pkgver=0.70
pkgrel=2
pkgdesc="Command-line tools for building SSL client-server applications."
arch=(i686 x86_64)
url="http://www.superscript.com/ucspi-ssl/intro.html"
depends=('openssl' 'ucspi-tcp')
source=(http://www.superscript.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('22a2ebd0c6905726811c615286bac875')

build() {
  cd $startdir/src/host/superscript.com/net/ucspi-ssl-0.70
  pushd  src
  #fix paths to work with archlinux...
  sed -i -e 's:HOME/command:/usr/bin:' sslcat.sh sslconnect.sh https\@.sh
  echo "gcc ${CFLAGS} -DTLS -I." > conf-cc
  echo "/usr/bin" > conf-tcpbin
  echo "/usr/" > conf-home
  popd 
  package/compile || return 1
  pushd command
  for i in sslserver sslclient sslcat sslconnect https\@; do
    /bin/install -D -m755 $i $startdir/pkg/usr/bin/$i
  done
  popd 
}

# vim: ts=2 sw=2 et ft=sh
