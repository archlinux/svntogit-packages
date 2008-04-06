# Contributor : Rohan Dhruva

pkgname=gnash-gtk
pkgver=0.8.2
pkgrel=1
pkgdesc="A GNU Flash movie player."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gnash/"
license=("GPL3")
depends=("gnash-common=$pkgver" 'gtk2' 'agg')
makedepends=('pkgconfig') # + 'cvs' when a snapshot is used
source=("http://ftp.gnu.org/gnu/gnash/${pkgver}/gnash-${pkgver}.tar.bz2")
options=('!libtool' '!emptydirs')
md5sums=('05cac831181be3fb40cbf3c00ab25c0f')

build() {
  cd $startdir/src/gnash-$pkgver
  ./configure --prefix=/usr \
   --disable-kparts \
   --with-plugindir=/usr/lib/mozilla/plugins \
   --enable-gui=GTK \
   --enable-z \
   --enable-jpeg \
   --enable-renderer=agg \
   --enable-media=ffmpeg \
   --enable-write \
   --disable-cygnal \

  make || return 1
  make DESTDIR=$startdir/pkg install install-plugin
  rm -rf $startdir/pkg/usr/{lib/gnash,share}
  rm -f $startdir/pkg/usr/bin/{gnash,gprocessor,dumpshm,soldumper}
}
