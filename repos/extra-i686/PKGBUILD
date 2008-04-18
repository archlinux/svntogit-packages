# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Maintainer: Tom Killian <tom@archlinux.org>
# Contributer: Benjamin Andresen <benny@klapmuetz.org>

pkgname=keychain
pkgver=2.6.8
pkgrel=2
pkgdesc="A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login."
arch=('i686' 'x86_64')
url="http://www.gentoo.org/proj/en/keychain/"
license=('GPL')
depends=('bash')

# Source is mirrored across all gentoo mirrors.  Some selections are:
# USA
#source=(http://osmirrors.cerias.purdue.edu/pub/gentoo/distfiles/$pkgname-$pkgver.tar.bz2)

# Carribean
#source=(http://www.securehost.com/mirror/gentoo/distfiles/$pkgname-$pkgver.tar.bz2)

# Singapore
#source=(http://mirror.averse.net/pub/gentoo/distfiles/$pkgname-$pkgver.tar.bz2)

# Canada
source=(http://cdot.senecac.on.ca/software/gentoo/distfiles/$pkgname-$pkgver.tar.bz2)

md5sums=('2a23b311e438ecebed5639b568738d28')

build() {
  cd $startdir/src/keychain-$pkgver
  install -Dm0755 keychain $startdir/pkg/usr/bin/keychain
  install -Dm0644 keychain.1 $startdir/pkg/usr/man/man1/keychain.1
}

