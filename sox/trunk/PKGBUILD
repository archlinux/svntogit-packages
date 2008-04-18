# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=sox
pkgver=14.0.0
pkgrel=2
pkgdesc="The Swiss Army knife of sound processing tools"
arch=(i686 x86_64)
license=('GPL')
depends=('libtool>=2.2' 'ffmpeg' 'libao' 'libvorbis' 'lame' 'libmad' 'bash' 'alsa-lib' 'libsndfile' 'libsamplerate')
url="http://sox.sourceforge.net/"
source=(http://easynews.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz amr.h)
md5sums=('c0c242fb2760cea9dc30de884eb1facc'
         '85271d1c2bab23980adf9e71084f4d1b')
options=(!libtool)

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	# fix for missing amr.h in 14.0.0 tarball
	cp $startdir/src/amr.h $startdir/src/$pkgname-$pkgver/src || return 1
	make || return 1
	make prefix=$startdir/pkg/usr install
	cd $startdir/pkg/usr/bin
	rm -f rec
	ln -sf play rec
	cd $startdir/pkg/usr/share/man/man1
	# looks like man pages are OK by themselves now.
	# rm -f rec.1 soxmix.1
	# ln -s play.1 rec.1
	# ln -s sox.1.gz soxmix.1
}
