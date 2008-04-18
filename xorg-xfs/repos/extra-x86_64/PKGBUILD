# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-xfs
pkgver=1.0.5
pkgrel=1
pkgdesc="X.Org X11 xfs font server"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
backup=('etc/X11/fs/config')
depends=('xorg-font-utils' 'libxfont' 'libfs' 'libx11')
makedepends=('pkgconfig' 'xtrans')
source=(${url}/releases/individual/app/xfs-${pkgver}.tar.bz2
        ${url}/releases/individual/app/xfsinfo-1.0.1.tar.bz2
	${url}/releases/individual/app/fslsfonts-1.0.1.tar.bz2
	${url}/releases/individual/app/fstobdf-1.0.2.tar.bz2
        ${url}/releases/individual/app/showfont-1.0.1.tar.bz2
	xfs.rc)

build() {
  cd ${startdir}/src
  pushd xfs-${pkgver}
  ./configure --prefix=/usr
  make configdir=/etc/X11/fs || return 1
  make configdir=/etc/X11/fs DESTDIR=${startdir}/pkg install || return 1
  sed -i -e 's|/lib/X11/|/share/|g' ${startdir}/pkg/etc/X11/fs/config
  popd
  for i in xfsinfo-* fslsfonts-* fstobdf-* showfont-*; do
    if [ -d "${i}" ]; then
      pushd "${i}"
      ./configure --prefix=/usr
      make || return 1
      make DESTDIR=${startdir}/pkg install || return 1
      popd
    fi
  done

  mkdir -p ${startdir}/pkg/etc/rc.d
  install -m755 ${startdir}/src/xfs.rc ${startdir}/pkg/etc/rc.d/
}
md5sums=('3fc73b5e39a1fe8b8d96563c8144cffe'
         'e98b18fbce1261de30b1de819d86f48a'
         'c7b2f8a938749d41dc86db6bd1e6a4ca'
         '99144743ab3cbb9cf37090fdc9e747db'
         '339b2faf1ca5114fda414338e15b6e21'
         '251f5447f64151e9bb096ebc9f999c3f')
