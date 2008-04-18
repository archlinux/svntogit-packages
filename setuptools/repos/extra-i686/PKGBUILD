# $Id$
# Maintainer: simo <simo@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Todd Maynard <arch@toddmaynard.com>

pkgname=setuptools
pkgver=0.6c7
pkgrel=1
pkgdesc="setuptools is a collection of enhancements to the Python distutils"
license=('PSF')
arch=(i686 x86_64)
url="http://peak.telecommunity.com/DevCenter/setuptools"
depends=('python')
source=(http://cheeseshop.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/lib/python2.5/site-packages
  python setup.py install --root=$startdir/pkg
  echo "/usr/lib/python2.5/site-packages/$pkgname-$pkgver-py2.5.egg" > $startdir/pkg/usr/lib/python2.5/site-packages/setuptools.pth
}
md5sums=('dedbf6a4f71cd6deaf13ee885054f16b')
