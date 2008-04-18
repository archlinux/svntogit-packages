# $Id$
# Maintainer: damir <damir@archlinux.org>
# TU: Ben <ben@benmazer.net>
# Contributor: ipqw

pkgname=xfig
pkgver=3.2.4
pkgrel=11
# downgraded because of bug 8806 and some other issues that make the 3.2.5 quite unusable
pkgdesc="Xfig drawing tool"
arch=("i686" "x86_64")
url="http://www.xfig.org"
depends=('libpng' 'libjpeg' 'xaw3d' 'libxi' 'libxaw')
makedepends=('imake')
options=('force')
license=('custom')
source=("http://xfig.org/software/xfig/$pkgver/$pkgname.$pkgver.full.tar.gz" \
	"LICENSE" \
	"${pkgname}.desktop" \
	"${pkgname}.png" \
	"xfig-gcc4.patch")
md5sums=('1911fc0f733cb2f40336a8d0e82513de' 'f405b7a96f3401c12153fe6170a7d8f1'\
         '658942ce4062d2766c8b2395f5ed4319' '8c99ca12404ed300c77106458c7340c0'\
         '545bf10fe67a90dcb8736b281d6fdf3f')

install=$pkgname.install

build() {
        cd $startdir/src/$pkgname.$pkgver

	# >=3.2.5 
	# change paths to archlinux standards:
	# patch -Np0 -i $startdir/src/Imakefile.archlinux.patch || return 1

 	# =3.2.4
	patch -Np1 -i ../xfig-gcc4.patch

	sed -e 's/^XCOMM #define XAW3D/#define XAW3D/' -i Imakefile
	# make makefile with imake
        xmkmf || return 1

	# build
	# >=3.2.5 
        # make  || return 1
        # make DESTDIR=$startdir/pkg install.all || return 1
        # make DESTDIR=$startdir/pkg install.man || return 1
 	# =3.2.4
        make XAPPLOADDIR=/usr/share/X11/app-defaults || return 1
        make XAPPLOADDIR=/usr/share/X11/app-defaults \
  	        MANDIR=/usr/share/man \
		DESTDIR=$startdir/pkg install.all || return 1
	rm -f ${startdir}/pkg/usr/lib/X11/app-defaults
	rmdir ${startdir}/pkg/etc/X11/app-defaults

	# freedesktop entry
	install -D -m644 $startdir/src/$pkgname.desktop \
  		$startdir/pkg/usr/share/applications/$pkgname.desktop
  	install -D -m644 $startdir/src/$pkgname.png \
  		$startdir/pkg/usr/share/pixmaps/$pkgname.png

	# install custom license
  	install -D -m644 ../LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE	
}



