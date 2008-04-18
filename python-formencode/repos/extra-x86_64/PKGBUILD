# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Todd Maynard <arch@toddmaynard.com>

pkgname=python-formencode
pkgver=0.9
pkgrel=1
pkgdesc="HTML form validation, generation, and conversion package for python"
license=('PSF')
arch=(i686 x86_64)
url="http://formencode.org"
depends=('python>=2.5')
makedepends=('setuptools')
source=(http://cheeseshop.python.org/packages/source/F/FormEncode/FormEncode-$pkgver.tar.gz)
md5sums=('adcca643088f6d2ac49d903901cf110d')

build() {
  cd $startdir/src/FormEncode-$pkgver
  python setup.py install --root=$startdir/pkg install
  echo "/usr/lib/python2.5/site-packages/FormEncode-$pkgver-py2.5.egg" >\
    $startdir/pkg/usr/lib/python2.5/site-packages/$pkgname.pth
}
