# $Id$
# Contributor: Josh Taylor <joshtaylor.mail@gmail.com>
# Maintainer: simo <simo@archlinux.org>
pkgname=python-opengl
pkgver=3.0.0b1
pkgrel=1
pkgdesc="The cross platform Python binding to OpenGL and related APIs"
arch=(i686 x86_64)
depends=('python' 'tk' 'freeglut' 'setuptools')
provides=('pyopengl' 'python-pyopengl')
conflicts=('pyopengl' 'python-pyopengl')
url="http://pyopengl.sourceforge.net"
source=(http://umn.dl.sourceforge.net/pyopengl/PyOpenGL-$pkgver.tar.gz)
md5sums=('8a5536e4ec9fd4eddcc5bd954096205f')

build() {
  cd $startdir/src/PyOpenGL-$pkgver
  python setup.py install --root=$startdir/pkg
}
