# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>

pkgname=spamassassin-spamc
pkgver=3.2.0
pkgrel=1
pkgdesc="Standalone C Client to spamassassin."
arch=(i686 x86_64)
url="http://spamassassin.apache.org"
conflicts=('spamassassin')
depends=('openssl' 'zlib')
makedepends=() 
license=('APACHE')
backup=()
install=
source=(http://www.devlib.org/apache/spamassassin/source/Mail-SpamAssassin-$pkgver.tar.gz)
md5sums=('aed988bb6cf463afc868a64d4cd771a3')

build() {
  cd $startdir/src/Mail-SpamAssassin-$pkgver

  /usr/bin/yes n | /usr/bin/perl Makefile.PL CONTACT_ADDRESS=root@localhost \
      ENABLE_SSL=yes PERL_TAINT=no
  make spamc/spamc || return 1
  mkdir -p $startdir/pkg/usr/bin || return 1
  install -m755 spamc/spamc $startdir/pkg/usr/bin/ || return 1
}

