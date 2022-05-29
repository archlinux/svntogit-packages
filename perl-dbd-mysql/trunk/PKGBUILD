# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>

pkgname=perl-dbd-mysql
pkgver=4.050
pkgrel=8
pkgdesc='Perl/CPAN DBD::mysql module for interacting with MySQL via DBD'
arch=('x86_64')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/DBD-mysql/"
depends=('mariadb-libs' 'perl-dbi')
makedepends=('perl-devel-checklib')
checkdepends=('mariadb' 'perl-test-deep')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/D/DV/DVEEDEN/DBD-mysql-${pkgver}.tar.gz
        mariadb-10.3.13-zerofill.patch)
sha512sums=('910f5b4ba7a7890d50a79f37d04ec8971a4f62acd0fe30bf3ab634f66e3128f0cd6513e5c9da8c807a0f4477d0cc766682ea8dd0d8072d02821b78df51f37879'
            '090039d383d05958c5d0cf23f13b8062ba89158583ca6dad9ce7c72b28bc3eccc039d4f815aef13592ea35a57662c80156b25aaa04ace171d64a15f5ac489a09')

prepare() {
  cd DBD-mysql-$pkgver

  # https://github.com/perl5-dbi/DBD-mysql/issues/304
  patch -Np1 -i ../mariadb-10.3.13-zerofill.patch
}

build() {
  cd DBD-mysql-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor --testsocket=/tmp/socket.mysql
  make
}

check() {
  cd DBD-mysql-$pkgver
  mkdir -p /tmp/mysql_test
  mysql_install_db \
     --basedir=/usr \
     --datadir=/tmp/mysql_test
  mysqld -P 17999 \
     --socket=/tmp/socket.mysql \
     --datadir=/tmp/mysql_test &
  sleep 10
  DAEMON_PORT=$!
  make test
  kill -9 $DAEMON_PORT
}

package() {
  cd DBD-mysql-$pkgver
  make install DESTDIR="$pkgdir"
}
