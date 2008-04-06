# Maintainer: Juergen Hoetzel <juergen@archlinux.org> 
# Contributors: William Rea <sillywilly@gmail.com>, 
# Bjorn Lindeijer <bjorn@lindeijer.nl>

pkgname=cegui
pkgver=0.5.0b
pkgrel=2
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines"
arch=(i686 x86_64)
url="http://crayzedsgui.sourceforge.net"
options=('nolibtool')
license="MIT"
depends=('pcre' 'expat' 'freetype2' 'libxml2' 'devil' 'freeglut')
source=(http://dl.sourceforge.net/crayzedsgui/CEGUI-$pkgver.tar.gz)
md5sums=('b42322a33c6a06eede76b15f75694a17')

build() {
    cd $startdir/src/CEGUI-0.5.0
    ./configure --prefix=/usr --sysconfdir=/etc --enable-devil --disable-silly \
                --disable-xerces-c
    make || return 1
    make DESTDIR=$startdir/pkg install

    install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
