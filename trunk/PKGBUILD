# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg
pkgver=20071204
pkgrel=1
pkgdesc="Complete and free Internet live audio and video broadcasting solution for Linux/Unix"
arch=(i686 x86_64)
license=('LGPL')
depends=('lame' 'sdl' 'libvorbis' 'a52dec' 'faad2' 'faac' 'xvidcore' 'zlib' 'imlib2' 'x264>=20071201' 'libtheora')
source=(http://gerolde.archlinux.org/~paul/ffmpeg-$pkgver.tar.gz )
md5sums=('3d34e511d0466de6feabed85dddbb2a8')
url="http://ffmpeg.mplayerhq.hu/"

build() {
     cd $startdir/src/$pkgname || return 1

     # configure
     ./configure \
          --prefix=/usr \
          --enable-gpl \
          --enable-libmp3lame \
          --enable-libvorbis \
          --enable-pp \
          --enable-libfaac \
          --enable-libfaad \
          --enable-liba52 \
          --enable-libxvid \
	  --enable-libx264 \
	  --enable-libtheora \
	  --disable-libamr-nb \
          --enable-pp \
          --enable-shared \
          --enable-pthreads \
	  --enable-x11grab \
	  --enable-swscaler \
       || return 1

     # build
     make -j 2 || return 1

     # install
     mkdir -p $startdir/pkg/usr/{bin,include,lib} || return 1
     make DESTDIR=$startdir/pkg install || return 1
}
