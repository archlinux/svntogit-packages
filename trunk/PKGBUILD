# $Id$
# Maintainer: judd <jvinet@zeroflux.org>

# compile always twice: first binutils, then gcc, then binutils again

pkgname=binutils
pkgver=2.18
pkgrel=6
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=('i686' 'x86_64')
url="http://sources.redhat.com/binutils"
license=('GPL')
groups=('base')
options=('!libtool' '!distcc' '!ccache')
depends=('glibc>=2.7')
makedepends=('texinfo>=4.11')
source=(#ftp://ftp.kernel.org/pub/linux/devel/${pkgname}/${pkgname}-${pkgver}.tar.bz2
	http://ftp.gnu.org/gnu/binutils/${pkgname}-${pkgver}.tar.gz
	makeinfo_version.patch)
md5sums=('d71b23b4fb91e66802ca2b8f576629f4'
         'dd2182cbc2f44dc22600211c7a5d8df7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  patch -Np0 -i ../makeinfo_version.patch || return 1
  autoconf

  mkdir build
  cd build

  CC="gcc -L`pwd`/bfd/.libs/"
  if [ "${CARCH}" = "x86_64" ]; then
    ../configure --prefix=/usr --enable-shared --enable-64-bit-bfd --disable-multilib 
  else
    ../configure --prefix=/usr --enable-shared
  fi

  # This checks the host environment and makes sure all the necessary tools are available to compile Binutils.
  make configure-host || return 1

  make tooldir=${startdir}/pkg/usr || return 1
  make prefix=${startdir}/pkg/usr tooldir=${startdir}/pkg/usr install
  install -m 644 ../include/libiberty.h ${startdir}/pkg/usr/include

  if [ "${CARCH}" = "x86_64" ]; then
    # Rebuild libiberty.a with -fPIC
    make -C libiberty clean
    make CFLAGS="$CFLAGS -fPIC" -C libiberty
    install -m 644 libiberty/libiberty.a ${startdir}/pkg/usr/lib
    # Rebuild libbfd.a with -fPIC
    make -C bfd clean
    make CFLAGS="$CFLAGS -fPIC" -C bfd
    install -m 644 bfd/libbfd.a ${startdir}/pkg/usr/lib
  fi

  rm -f ${startdir}/pkg/usr/man/man1/{dlltool,nlmconv,windres}*

  # Remove these symlinks, with binutils prereleases they are not ABI stable.
  # Programs should compile static to the .a file.
  rm -f ${startdir}/pkg/usr/lib/lib{bfd,opcodes}.so
}
