# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=unzip
pkgver=5.52
pkgrel=4
pkgdesc="Unpacks .zip archives such as those made by PKZIP"
arch=('i686' 'x86_64')
url="http://www.info-zip.org/"
license=('custom')
depends=('glibc')
source=(http://downloads.sourceforge.net/infozip/unzip552.tar.gz
        unzip-5.5.2-CVE-2008-0888.patch
        unzip-5.50-alt-iconv-v1.2-utf8.patch
        unzip542-size-64bit.patch)
md5sums=('9d23919999d6eac9217d1f41472034a9'
         '2de357c2ba84576f38b17aed87915c87'
         'a4797a1f6e45385f5e021f9f6f2ec0fa'
         '83c7e79de9618bf7d081dd639dd3dde1')

build() {
  cd $startdir/src/$pkgname-$pkgver

  # http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-0888
  patch -Np0 -i ../unzip-5.5.2-CVE-2008-0888.patch || return 1

  # FS#8383
  patch -Np1 -i ../unzip-5.50-alt-iconv-v1.2-utf8.patch || return 1

  [ "$CARCH" == "x86_64" ] && (patch -Np0 -i ../unzip542-size-64bit.patch || return 1)
  
  export CFLAGS="$CFLAGS -D_FILE_OFFSET_BITS=64"
  if [ "${CARCH}" = "i686" ]; then
    make -f unix/Makefile LOCAL_UNZIP="$CFLAGS" prefix=/usr linux || return 1
  else
    make -f unix/Makefile LOCAL_UNZIP="$CFLAGS" prefix=/usr linux_noasm || return 1
  fi
  make -f unix/Makefile prefix=$startdir/pkg/usr install

  install -Dm644 LICENSE $startdir/pkg/usr/share/licenses/unzip/LICENSE
}
