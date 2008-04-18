# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=grep
pkgver=2.5.3
pkgrel=3
pkgdesc="A string search utility"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnu.org/software/grep/grep.html"
groups=('base')
depends=('glibc' 'pcre')
makedepends=('texinfo>=4.8a')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz
	# patches from fedora cvs
	#01-fgrep.patch
	#02-bracket.patch
	#03-i18n.patch
	#04-oi.patch
	#05-manpage.patch
	#06-color.patch
	#07-icolor.patch
	#08-skip.patch
	#09-egf-speedup.patch
	#10-dfa-optional.patch
	#11-tests.patch
	#12-w.patch
	#13-P.patch
	14-mem-exhausted.patch
	15-empty-pattern.patch
	64-egf-speedup.patch
)
md5sums=('4f371f25f413f700fb1984b878421f9d'
         'bc937da562d468f32c1fef2894610283'
	 'f421415b679ebcc9152797caaa0b1d51'
	 'efbe9d49d71a74092db6b86224b09fdd')



build() {
  cd $startdir/src/$pkgname-$pkgver
  for i in ../*.patch; do
	patch -Np1 -i ../$i 
  done
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir $startdir/pkg/bin
  mv $startdir/pkg/usr/bin/*grep $startdir/pkg/bin/
  rmdir $startdir/pkg/usr/bin
}
