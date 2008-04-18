# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

# Note for rebuilders:
# dcraw.c  is released as pure C file, not as a package with a changing version
# number in the name. The name of the file to be downloaded is always the same!
# So if you are a bad boy (Santa knows everything!) and build as root, this file
# will be saved in /var/cache/pacman/src . Therefore, rebuilding a later version
# likely will fail due to an MD5 error. If so, delete the files from the cache
# to force a new download.

pkgname=dcraw
pkgver=1.399
pkgrel=1
pkgdesc="A command line based converter for digicams raw output"
arch=(i686 x86_64)
license=('custom')
depends=('libjpeg' 'lcms')
makedepends=('gzip')
source=(http://www.cybercom.net/~dcoffin/${pkgname}/${pkgname}.{c,1} license.txt)
url="http://www.cybercom.net/~dcoffin/dcraw/"
install=dcraw.install
md5sums=('9cf268b3ecbee60408509aca7b8e24ee' '1d2ae1fe1d69ac3de047eaea2a92638a' \
         '110b4604a6dacd5537339c4082e9e12a')

build() {
  cd ${startdir}/src
  gcc -o dcraw ${CFLAGS} dcraw.c -lm -ljpeg -llcms
  install -D -m755  ${pkgname} ${startdir}/pkg/usr/bin/${pkgname}
 # compress and install a manpage, provided separately on authors homepage
  gzip -c -9 ${pkgname}.1 > ${pkgname}.1.gz
  install -D -m644 ${pkgname}.1.gz ${startdir}/pkg/usr/share/man/man1/${pkgname}.1.gz
  install -Dm 644 ${startdir}/src/license.txt \
    ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}
