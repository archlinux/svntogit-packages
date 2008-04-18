# $Id$
# Maintainer: James Rayner <iphitus@gmail.com>

pkgname=ivman
pkgver=0.6.14
pkgrel=1
pkgdesc="Console based device manager"
arch=(i686 x86_64)
url="http://ivman.sourceforge.net/"
depends=('hal>=0.5.8.1-2' 'libxml2' 'pmount>=0.9.13-2')
makedepends=('pkgconfig')
options=('nolibtool')
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2 \
        ivman.rc)
install=ivman.install

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install

  # setting daemon starting script
  install -m755 -D $startdir/src/ivman.rc $startdir/pkg/etc/rc.d/ivman || return 1

  # disable default config
  cd $startdir/pkg/etc/ivman/
  for n in *.xml ; do
    mv $n $n.default
  done
  sed 's@<ivm:Option name="group" value="plugdev" />@<ivm:Option name="group" value="storage" />@g' -i IvmConfigBase.xml.default 
  sed 's@<ivm:Option name="user" value="ivman" />@<ivm:Option name="user" value="root" />@g' -i IvmConfigBase.xml.default
  
}

md5sums=('ebef12559268e2c5ea932cbb5aaa789e' 'c100523c8a0807f408894f9798522de3')
