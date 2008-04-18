# $Id$
# Contributor: Greg Grabinski <greg@grabinski.ch>
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=streamtuner
pkgver=0.99.99
pkgrel=7
pkgdesc="A stream directory browser"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/streamtuner/"
license=('custom')
depends=('taglib' 'libxml2' 'gtk2' 'curl>=7.16.2' 'pygtk>=2.10.4')
conflicts=('streamtuner-live365')
replaces=('streamtuner-live365')
source=(http://savannah.nongnu.org/download/streamtuner/$pkgname-$pkgver.tar.gz \
        http://savannah.nongnu.org/download/streamtuner/streamtuner-0.99.99-live365.diff \
        http://savannah.nongnu.org/download/streamtuner/streamtuner-0.99.99-pygtk-2.6.diff)
md5sums=('2027b7c34e85b594524b0b4351c14362' '8aa1994a849b05d2b8fffbda702b8a25'\
         '7aff45a41c60358cb2332c7ce644f661')
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 -i $startdir/src/streamtuner-0.99.99-live365.diff || return 1
  patch -p0 -i $startdir/src/streamtuner-0.99.99-pygtk-2.6.diff || return 1
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  rm -r $startdir/pkg/usr/var

  #Add license file
  install -Dm0644 $startdir/src/$pkgname-$pkgver/COPYING \
                  $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
