# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=cdrkit
pkgver=1.1.6
pkgrel=1
depends=('glibc' 'libcap' 'file')
makedepends=('cmake')
pkgdesc="GPL replacement of cdrtools for recording CDs "
arch=(i686 x86_64)
source=("http://cdrkit.org/releases/$pkgname-$pkgver.tar.gz")
md5sums=('59b9946649ea2ea2f2d0021035fb4443')
license=('GPL')
url="http://cdrkit.org/"
replaces=('cdrtools')
conflicts=('cdrtools')
provides=('cdrtools')
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver || return 1

  # build
  make || return 1

  # install
  make PREFIX=$startdir/pkg/usr install || return 1

  # fix symlinks for cdrtools compatibility
  # fix some k3b issues
  cd $startdir/pkg/usr/bin || return 1
  mv wodim cdrecord || return 1
  ln -s cdrecord wodim || return 1
  mv genisoimage mkisofs || return 1
  ln -s mkisofs genisoimage || return 1
  ln -s readom readcd || return 1
  ln -s icedax cdda2wav || return 1
  ln -s mkisofs mkhybrid || return 1
  ln -s cdrecord dvdrecord || return 1

  cd $startdir/pkg/usr/sbin || return 1
  ln -s netscsid rscsi || return 1

  cd $startdir/pkg/usr/share/man/man1 || return 1
  ln -s icedax.1 cdda2wav.1 || return 1
  ln -s readom.1 readcd.1 || return 1
  ln -s wodim.1 cdrecord.1 || return 1
  ln -s genisoimage.1 mkisofs.1 || return 1

  cd $startdir/pkg/usr/share/man/man5 || return 1
  ln -s genisoimagerc.5 mkisofsrc.5 || return 1
}
