# $Id$
# Contributor: red_over_blue (1.1.2), Abaddon <kukububu@go2.pl> (1.1.3)
# Maintainer: damir <damir@archlinux.org>

pkgname=xvidcap
pkgver=1.1.7rc1
force=y
pkgrel=1
pkgdesc="It's a small tool to capture things going on on an X-Windows display to either individual frames or an MPEG video"
arch=("i686" "x86_64")
license=('GPL')
url="http://xvidcap.sourceforge.net/"
depends=('dbus-glib' 'libxdamage' 'lame' 'gtk2>=2.8.15' 'libxmu' 'libglade') 
#ffmpeg not needed yet, because internal one used
makedepends=('perlxml' 'rarian')
source=("http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('449ee23b6ea171f090b9de48ffefb364')

build() {
    cd $startdir/src/$pkgname-1.1.6 #$pkgver

    ./configure --prefix=/usr \
            --with-x \
            --with-gtk2
    make || return 1
    make prefix=$startdir/pkg/usr install || return 1
}

