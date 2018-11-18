# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=opencv
pkgname=(opencv opencv-samples)
pkgver=4.0.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library"
arch=(x86_64)
license=(BSD)
url="http://opencv.org/"
depends=(intel-tbb openexr gst-plugins-base libdc1394 cblas lapack libgphoto2 jasper ffmpeg)
makedepends=(cmake python-numpy python-setuptools mesa eigen hdf5 lapacke gtk3 vtk glew)
optdepends=('opencv-samples: samples'
            'gtk3: for the HighGUI module'
            'vtk: for the viz module'
            'hdf5: support for HDF5 format'
            'opencl-icd-loader: For coding with OpenCL'
            'python-numpy: Python interface')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.zip"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz")
sha256sums=('86fd08fc02893e05e2944fa7b0daa7d02643232450f020b475e1b2f24587b99a'
            '4fb0681414df4baedce6e3f4a01318d6f4fcde6ee14854d761fd4e397a397763')

prepare() {
  mkdir -p build
}

build() {
  cd build
  # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
  cmake ../$pkgname-$pkgver \
    -DWITH_OPENCL=ON \
    -DWITH_OPENGL=ON \
    -DWITH_TBB=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DBUILD_WITH_DEBUG_INFO=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=ON \
    -DINSTALL_C_EXAMPLES=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCPU_BASELINE_DISABLE=SSE3 \
    -DCPU_BASELINE_REQUIRE=SSE2 \
    -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
    -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
    -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
    -DLAPACK_LAPACKE_H="/usr/include/lapacke.h"
  make
}

package_opencv() {
  options=(staticlibs)

  cd build
  make DESTDIR="$pkgdir" install

  # install license file
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  # install python bindings
  cd python_loader
  python setup.py install --root="$pkgdir"
  rm -r "$pkgdir"/usr/python

  cd "$pkgdir"/usr/share

  # separate samples package
  mv opencv4/samples "$srcdir/$pkgname-samples"
}

package_opencv-samples() {
  pkgdesc+=" (samples)"
  depends=("opencv=$pkgver")
  unset optdepends

  mkdir -p "$pkgdir"/usr/share/opencv
  cp -r "$srcdir"/opencv-samples "$pkgdir"/usr/share/opencv/samples
  # fix permissions
  chmod 755 "$pkgdir"/usr/share/opencv/samples/*

  # install license file
  install -Dm644 "$srcdir"/opencv-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
