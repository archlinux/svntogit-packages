# $Id$
# Contributor: Jochem Kossen <j.kossen@home.nl>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=latex2html
pkgver=2002.2.1
pkgrel=1
pkgdesc="latex2html is a convertor written in Perl that converts LaTeX documents to HTML."
depends=('perl' 'ghostscript' 'tetex' 'libpng' 'libungif' 'netpbm')
install=$pkgname.install
source=(http://saftsack.fs.uni-bayreuth.de/~latex2ht/current/$pkgname-2002-2-1.tar.gz)
md5sums=('a79cda0648c8721ab6df5020cd11e220')
url="http://saftsack.fs.uni-bayreuth.de/~latex2ht/"


build() {
	cd $startdir/src/$pkgname-2002-2-1
	./configure --prefix=$startdir/pkg/usr \
	    --shlibdir=$startdir/pkg/usr/lib/$pkgname \
	    --with-texpath=$startdir/pkg/usr/share/texmf/tex/latex/html \
	    --enable-wrapper \
	    --enable-gif \
	    --enable-png \

	make || return 1
	make check || return 1
	make install
	
	find $startdir/pkg/usr -type f -print | while read filename; do
	    if [ ! -z '`grep "$startdir" "$filename"`' ]; then
		mv $filename $filename.mkpkg
		sed -e "s#$startdir/pkg##g" -e "s#$startdir/src##g" < $filename.mkpkg > $filename
		rm $filename.mkpkg
	    fi
	done

	mv $startdir/pkg/usr/cfgcache.pm $startdir/pkg/usr/l2hconf.pm $startdir/pkg/usr/lib/$pkgname/

	rm -fr $startdir/pkg/usr/lib/$pkgname/docs/

	chmod 755 $startdir/pkg/usr/bin/pstoimg \
	    $startdir/pkg/usr/bin/$pkgname \
	    $startdir/pkg/usr/bin/texexpand
}
