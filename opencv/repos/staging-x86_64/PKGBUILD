# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=opencv
pkgname=(opencv opencv-samples)
pkgver=4.3.0
pkgrel=2
pkgdesc="Open Source Computer Vision Library"
arch=(x86_64)
license=(BSD)
url="https://opencv.org/"
depends=(intel-tbb openexr gst-plugins-base libdc1394 cblas lapack libgphoto2 jasper ffmpeg)
makedepends=(cmake python-numpy python-setuptools mesa eigen hdf5 lapacke qt5-base vtk glew ant java-environment)
optdepends=('opencv-samples: samples'
            'vtk: for the viz module'
            'qt5-base: for the HighGUI module and the Python bindings'
            'hdf5: for the HDF5 module and the Python bindings'
            'opencl-icd-loader: For coding with OpenCL'
            'python-numpy: Python bindings'
            'java-runtime: Java interface')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.zip"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz"
        opencv-includedir.patch)
sha256sums=('36799186756c1e12adde97f0a8d1afc395d5b0f86d8ad9ef951bc33aa732f9b9'
            'acb8e89c9e7d1174e63e40532125b60d248b00e517255a98a419d415228c6a55'
            'a96e35c9592e655b21a62cfe04e864a10e21535ad900e5de67356b9e9f40ca10')

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../opencv-includedir.patch # Fix wrong include patch in pkgconfig file

  sed -e '/ocv_tbb_cmake_guess(HAVE_TBB)/d' -i cmake/OpenCVDetectTBB.cmake # Don't use TBB's cmake config, it breaks build
}

build() {
  cd build
  export JAVA_HOME="/usr/lib/jvm/default"
  # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  cmake ../$pkgname-$pkgver \
    -DWITH_OPENCL=ON \
    -DWITH_OPENGL=ON \
    -DWITH_TBB=ON \
    -DWITH_QT=ON \
    -DBUILD_WITH_DEBUG_INFO=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=ON \
    -DINSTALL_C_EXAMPLES=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCPU_BASELINE_DISABLE=SSE3 \
    -DCPU_BASELINE_REQUIRE=SSE2 \
    -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
    -DOPENCV_SKIP_PYTHON_LOADER=ON \
    -DOPENCV_PYTHON3_INSTALL_PATH=$_pythonpath \
    -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
    -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
    -DLAPACK_LAPACKE_H="/usr/include/lapacke.h" \
    -DOPENCV_GENERATE_PKGCONFIG=ON \
    -DOPENCV_ENABLE_NONFREE=ON \
    -DOPENCV_JNI_INSTALL_PATH=lib \
    -DOPENCV_GENERATE_SETUPVARS=OFF \
    -DEIGEN_INCLUDE_PATH=/usr/include/eigen3
  make
}

package_opencv() {
  cd build
  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  # separate samples package
  mv "$pkgdir"/usr/share/opencv4/samples "$srcdir"
}

package_opencv-samples() {
  pkgdesc+=" (samples)"
  depends=("opencv=$pkgver")
  unset optdepends

  cd build
  mkdir -p "$pkgdir"/usr/share/opencv4
  mv "$srcdir"/samples "$pkgdir"/usr/share/opencv4

  # install license file
  install -Dm644 "$srcdir"/opencv-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
