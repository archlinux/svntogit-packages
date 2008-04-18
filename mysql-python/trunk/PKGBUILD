# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=mysql-python
pkgver=1.2.2
pkgrel=1
pkgdesc="MySQL support for Python"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/mysql-python"
depends=('python>=2.5' 'libmysqlclient')
makedepends=('mysql>=5.0.23')
source=("http://heanet.dl.sourceforge.net/sourceforge/mysql-python/MySQL-python-${pkgver}.tar.gz")

build() {
  cd ${startdir}/src/MySQL-python-${pkgver}
  yes | python setup.py install --root=${startdir}/pkg
}
