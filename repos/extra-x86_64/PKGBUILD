# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=audacious
pkgver=1.5.0
pkgrel=2
pkgdesc="A media player forked from BMP 0.9.7.1 - player component (no plugins)."
arch=('i686' 'x86_64')
url="http://audacious-media-player.org/"
license=('GPL3')
depends=('gtk2' 'libmowgli' 'libmcs' 'dbus-glib' 'libglade' 'unzip' 'libsamplerate') # Unzip for theme changing
replaces=('audacious-player')
provides=('audacious-player')
conflicts=('audacious-player')
install=audacious.install
source=(http://distfiles.atheme.org/$pkgname-$pkgver.tgz)
md5sums=('ea631b69eb54e97d60bf3c52ae6c7e62')
options=('!libtool')

build() {

    # NOTE TO ANYONE BUILDING THIS PKG!
    # 
    # Audacious and Audacious-plugins must both be built with
    # the same CFLAGS and CXXFLAGS.  
    # If ever strange, unexplainable playlist corruption happens, this
    # is likely the cause - make sure both packages were built with
    # the same flags and same version of GCC.

    cd $startdir/src/audacious-$pkgver

    ./configure --prefix=/usr \
                --enable-chardet --enable-samplerate \
                --disable-sse2

    make || return 1

    make DESTDIR=$startdir/pkg install

} 

