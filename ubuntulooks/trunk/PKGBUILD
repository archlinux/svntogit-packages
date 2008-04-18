# $Id$
# Maintainer: James Rayner <iphitus@gmail.com>

pkgname=ubuntulooks
pkgver=0.9.12
pkgrel=1
pkgdesc="Ubuntu theme engines for GTK+ 2"
arch=(i686 x86_64)
depends=('gtk2>=2.10.0')
makedepends=('pkgconfig')
options=(NOLIBTOOL)
source=(http://archive.ubuntu.com/ubuntu/pool/main/u/ubuntulooks/ubuntulooks_${pkgver}.orig.tar.gz
	gtkrc.Blue
	gtkrc.Graphite)

build() {
  cd ${startdir}/src/ubuntulooks-${pkgver}

  #CFLAGS="${CFLAGS} -DHAVE_ANIMATION=1" 
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -D -m644 ${startdir}/src/gtkrc.Blue ${startdir}/pkg/usr/share/themes/Human-Blue/gtk-2.0/gtkrc
  install -D -m644 ${startdir}/src/gtkrc.Graphite ${startdir}/pkg/usr/share/themes/Human-Graphite/gtk-2.0/gtkrc
}
md5sums=('5ba7d915abe31870103aab5847278d13' '5c1f4113fb6c968ed34b7a8ac4e7e48f'\
         'ad5d1f7e3f890326111e52667d19b2ce')
