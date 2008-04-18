# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Todd Maynard <arch@toddmaynard.com>

pkgname=python-sqlobject
pkgver=0.9.0
pkgrel=1
pkgdesc="A popular Object Relational Manager for providing an object interface to your database, with tables as classes, rows as instances, and columns as attributes"
license=('LGPL')
arch=(i686 x86_64)
url="http://sqlobject.org/"
depends=('python>=2.5' 'setuptools' 'python-formencode>=0.7')
source=(http://cheeseshop.python.org/packages/source/S/SQLObject/SQLObject-$pkgver.tar.gz)

build() {
  cd $startdir/src/SQLObject-$pkgver
  python setup.py install --root=$startdir/pkg
  echo "/usr/lib/python2.5/site-packages/SQLObject-$pkgver-py2.5.egg" >\
    $startdir/pkg/usr/lib/python2.5/site-packages/$pkgname.pth
}
