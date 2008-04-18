# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=python24
pkgver=2.4.4
pkgrel=3
pkgdesc="A high-level scripting language"
arch=(i686 x86_64)
url="http://www.python.org"
depends=('db>=4.6' 'bzip2' 'gdbm' 'openssl' 'zlib' 'gcc-libs' 'readline')
makedepends=('tk')
source=(http://www.python.org/ftp/python/$pkgver/Python-$pkgver.tar.bz2 db4.6-setup.py-detection.patch db_fix.patch)
md5sums=('0ba90c79175c017101100ebf5978e906'
         '437410b4d9b8889e26d70182527ea110'
         '1c178479d17ae1e59cccb0a3f7be043b')
options=('!makeflags')

build() {
  cd $startdir/src/Python-$pkgver
  patch -Np0 -i ../db4.6-setup.py-detection.patch || return 1
  patch -Np0 -i ../db_fix.patch || return 1
  ./configure --prefix=/usr --enable-shared --with-threads --enable-unicode
  # This is supposed to be the previous version's python directory
  #  NOT the current one
  sed -i 's#SITEPATH=#SITEPATH=:../python2.3/site-packages#' Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm $startdir/pkg/usr/bin/python

  # Rename all the scripts
  cd $startdir/pkg/usr/bin
  mv idle idle2.4
  mv pydoc pydoc2.4
  mv smtpd.py smtpd2.4.py
  mv $startdir/pkg/usr/man/man1/python.1 $startdir/pkg/usr/man/man1/python2.4.1
}
