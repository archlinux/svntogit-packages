# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=tcsh
pkgver=6.15.01
pkgrel=2
pkgdesc="Enhanced version of the Berkeley C shell"
arch=('i686' 'x86_64')
url="http://www.tcsh.org/Welcome"
license=('BSD')
depends=('ncurses')
install=tcsh.install
source=(ftp://ftp.astron.com/pri/$pkgname-$pkgver.tar.gz csh.cshrc \
        csh.login tcsh.config.skel)
md5sums=('0563ce3d604b84b564dea7fd7bd87832' '299cd79eb3cbc2a3caeac1c3a0309556'\
         'e00fe0339280074b1c2e0b8f63bc5d19' '6bd69d3c815412ada4579ac8f8cc9c45')
sha1sums=('f73f0a62cf59087b13be0c1552b69bbe7ef7f7b1'
          '8ebcee4e6c934481a46fe40c15d52a53ed5744bb'
          'bf350706deff296817aea1aec9e592a2c13d7032'
          '73a0ae17f2e3dcf2d3ae871982e8591379e1800e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install install.man
  install -d $startdir/pkg/etc/skel
  install -m644 ../{csh.cshrc,csh.login} $startdir/pkg/etc/
  install -m644 ../tcsh.config.skel $startdir/pkg/etc/skel/.tcsh.config
  ln -s tcsh $startdir/pkg/usr/bin/csh
  install -D -m644 Copyright $startdir/pkg/usr/share/licenses/$pkgname/Copyright
}
