# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: Alexander 'dma147' Mieland <dma147@linux-stats.org>
# Contributor: Roberto Filippone <rfilippone@gmail.com>

pkgname=smb4k
pkgver=0.9.2
pkgrel=1
pkgdesc="A KDE program that browses samba shares."
arch=('i686' 'x86_64')
url="http://smb4k.berlios.de/"
license=('GPL')
depends=('kdebase' 'smbclient>=3.0')
makedepends=('fam' 'libpng')
install=smb4k.install
source=(http://download.berlios.de/smb4k/$pkgname-$pkgver.tar.bz2)
md5sums=('ae927fe0358c9185fffca0a1bbee8329')
options=('libtool') #SMB4k now requires .la files to run. :(

build() {
    cd $startdir/src/$pkgname-$pkgver

    ./configure --prefix=/opt/kde
	         
    make || return 1
    make DESTDIR=$startdir/pkg install
} 

