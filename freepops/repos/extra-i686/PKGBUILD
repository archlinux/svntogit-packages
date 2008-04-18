# $Id$
# vim: ts=2 sw=2 noet
#Maintainer: Simo Leone <simo@archlinux.org>
pkgname=freepops
pkgver=0.2.6
pkgrel=1
pkgdesc="A program to convert webmail interfaces to pop3"
arch=(i686 x86_64)
url="http://freepops.sourceforge.net/"
license="GPL"
depends=('curl' 'expat>=2.0')
backup=('etc/freepops/config.lua')
source=(http://downloads.sourceforge.net/sourceforge/freepops/${pkgname}-${pkgver}.tar.gz
        freepopsd
        freepopsd.conf)
md5sums=('8f774fe7dbad67f2aa9d2fb916dade6d'
         '51f00d82dc8fff3f145ccff43fd0b887'
				 '3fe979df0ecbb6988b85a76edf08e392')

build() {
	export MAKEFLAGS="-j1"
	cd ${startdir}/src/${pkgname}-${pkgver}

        if [ "$CARCH" == "x86_64" ]; then
	    # fix optimisations that break the build; Arch64 needs 'x86-64' and not 'x86_64' to build
	        sed -i -e "s/-g3 -march=i486/-march=x86-64/g" configure.sh
        else    sed -i -e "s/-g3 -march=i486/-march=${CARCH}/g" configure.sh	 
        fi	

	./configure.sh linux-slack
	make || return 1
	make DESTDIR=${startdir}/pkg/ install
	install -D -m755 ${startdir}/src/freepopsd ${startdir}/pkg/etc/rc.d/freepopsd
	install -D -m644 ${startdir}/src/freepopsd.conf ${startdir}/pkg/etc/conf.d/freepopsd
}
