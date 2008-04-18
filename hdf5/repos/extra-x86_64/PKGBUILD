# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=hdf5
pkgver=1.8.0
pkgrel=3
arch=("i686" "x86_64")
pkgdesc="General purpose library and file format for storing scientific data"
url="http://hdf.ncsa.uiuc.edu/HDF5/"
license=("custom")
depends=('zlib' 'openssl' 'gcc-libs>=4.3.0')
makedepends=('gcc' 'time')
source=(ftp://ftp.hdfgroup.org/HDF5/current/src/${pkgname}-${pkgver}.tar.gz
	gcc-4.3.patch)
options=("!libtool")
md5sums=('e68e13685a56b50cab237fd58dc7a59c' '0c59e6004536914e62324037ad49d82e')
md5sums=('e68e13685a56b50cab237fd58dc7a59c'
         '4af864c222a9cf4b924ce7ff0f371cc5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  unset CFLAGS
  unset CXXFLAGS
  patch -Np0 -i ${startdir}/src/gcc-4.3.patch || return 1
  F9X=gfortran ./configure --prefix=/usr \
                            --enable-hl \
                            --enable-threadsafe \
                            --enable-linux-lfs \
                            --enable-production \
                            --enable-hdf5v1_4 \
                            --enable-hdf5v1_6 \
			    --enable-cxx \
                            --enable-fortran \
			    --enable-shared \
			    --with-pic \
			    --docdir=/usr/share/hdf5/ \
                            --with-pthread=/usr/lib/ \
                            --with-ssl=/usr/lib/
  make || return 1
  make check || return 1
  make -j1 prefix=${startdir}/pkg/usr install || return 1

  install -d -m755 ${startdir}/pkg/usr/share/licenses/${pkgname} || return 1
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/COPYING \
          ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE || return 1
}



#                      Debug Mode:  None
#                Shared Libraries:  Yes
#                Static Libraries:  Yes
#   Statically Linked Executables:  No
# Default Version of Public Symbols:  v18
#  With Deprecated Public Symbols:  Yes
#                         Tracing:  No
# Clear file buffers before write:  Yes
#            Using memory checker:  No
#    Optimization Instrumentation:  No
# 
# Languages:
# ----------
#                             C++:  Yes
#                    C++ Compiler:  g++
#                        CXXFLAGS / H5_CXXFLAGS:   -march=x86-64 -mtune=generic -O2 -pipe
# 
#                         Fortran:  Yes
#                Fortran Compiler:  gfortran
#                          FCFLAGS / H5_FCFLAGS:   -I.
# 
# 
# Features:
# ---------
#                         dmalloc:  No
#          Function Stack Tracing:  Disabled
#                            GPFS:  No
#       Strict File Format Checks:  Disabled
#             Default API Mapping:  v18
#                         hsize_t:  Large
#          I/O filters (external):  deflate(zlib)
#          I/O filters (internal):  shuffle,fletcher32,nbit,scaleoffset
#  Linux Large File Support (LFS):  Enabled
#                             MPE:  No
#                   Parallel HDF5:  No
#                      Direct VFD:  Disabled
#                    Threadsafety:  Enabled
#              High Level library:  Enabled





