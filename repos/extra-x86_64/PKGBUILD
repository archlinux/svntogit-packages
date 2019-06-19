# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgbase=mesa
pkgname=('opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau' 'mesa')
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=19.1.0
pkgrel=2
arch=('x86_64')
makedepends=('python-mako' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto' 
             'libxshmfence' 'libxxf86vm' 'libxdamage' 'libvdpau' 'libva' 'wayland' 'wayland-protocols'
             'elfutils' 'llvm' 'libomxil-bellagio' 'libclc' 'clang' 'libglvnd' 'libunwind' 'lm_sensors'
             'libxrandr' 'valgrind' 'meson')
url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig}
        LICENSE
        glesv2.pc)
sha512sums=('25b186ae8037dedea5691e0b77b22f2065f3c877838378651726dfa1b34ef49dcc56f1dbd124e99285e5f14489db936a886a6740495b5b279e8363424bfb3433'
            'SKIP'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7'
            'e5db81538625a056328c2ba83f3e6418e0d579c261bcddf685036ad19e816dd002313c80a6c48cef0289d1e1b0bdbe733810ae9f53604e380486253642cff52c')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC') # Dylan Baker <dylan@pnwbakers.com>

build() {
  #  -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,swr ### swr doesn't build https://bugs.freedesktop.org/show_bug.cgi?id=107865

  arch-meson mesa-$pkgver build \
    -D b_lto=false \
    -D b_ndebug=true \
    -D platforms=x11,wayland,drm,surfaceless \
    -D dri-drivers=i915,i965,r100,r200,nouveau \
    -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,swr,iris \
    -D vulkan-drivers=amd,intel \
    -D swr-arches=avx,avx2 \
    -D dri3=true \
    -D egl=true \
    -D gallium-extra-hud=true \
    -D gallium-nine=true \
    -D gallium-omx=bellagio \
    -D gallium-opencl=icd \
    -D gallium-va=true \
    -D gallium-vdpau=true \
    -D gallium-xa=true \
    -D gallium-xvmc=false \
    -D gbm=true \
    -D gles1=false \
    -D gles2=true \
    -D glvnd=true \
    -D glx=dri \
    -D libunwind=true \
    -D llvm=true \
    -D lmsensors=true \
    -D osmesa=gallium \
    -D shared-glapi=true \
    -D valgrind=true

  # Print config
  meson configure build

  ninja -C build

  # fake installation to be seperated into packages
  # outside of fakeroot but mesa doesn't need to chown/mod
  DESTDIR="${srcdir}/fakeinstall" ninja -C build install
}

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    mv -v "${src}" "${dir}/"
  done
}

package_opencl-mesa() {
  pkgdesc="OpenCL support for AMD/ATI Radeon mesa drivers"
  depends=('expat' 'libdrm' 'libelf' 'libclc' 'clang')
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=('opencl-driver')

  _install fakeinstall/etc/OpenCL
  _install fakeinstall/usr/lib/lib*OpenCL*
  _install fakeinstall/usr/lib/gallium-pipe

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_vulkan-intel() {
  pkgdesc="Intel's Vulkan mesa driver"
  depends=('wayland' 'libx11' 'libxshmfence' 'libdrm')
  provides=('vulkan-driver')

  _install fakeinstall/usr/share/vulkan/icd.d/intel_icd*.json
  _install fakeinstall/usr/lib/libvulkan_intel.so
  _install fakeinstall/usr/include/vulkan/vulkan_intel.h

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_vulkan-radeon() {
  pkgdesc="Radeon's Vulkan mesa driver"
  depends=('wayland' 'libx11' 'libxshmfence' 'libelf' 'libdrm' 'llvm-libs')
  provides=('vulkan-driver')
 
  _install fakeinstall/usr/share/vulkan/icd.d/radeon_icd*.json
  _install fakeinstall/usr/lib/libvulkan_radeon.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_libva-mesa-driver() {
  pkgdesc="VA-API implementation for gallium"
  depends=('libdrm' 'libx11' 'llvm-libs' 'expat' 'libelf' 'libxshmfence')

  _install fakeinstall/usr/lib/dri/*_drv_video.so
   
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_mesa-vdpau() {
  pkgdesc="Mesa VDPAU drivers"
  depends=('libdrm' 'libx11' 'llvm-libs' 'expat' 'libelf' 'libxshmfence')

  _install fakeinstall/usr/lib/vdpau
   
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_mesa() {
  depends=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf' 
           'libomxil-bellagio' 'libunwind' 'llvm-libs' 'lm_sensors' 'libglvnd')
  optdepends=('opengl-man-pages: for the OpenGL API man pages'
              'mesa-vdpau: for accelerated video playback'
              'libva-mesa-driver: for accelerated video playback')
  provides=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl' 'opengl-driver')
  conflicts=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl')
  replaces=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl')

  _install fakeinstall/usr/share/drirc.d/00-mesa-defaults.conf
  _install fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json

  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast, swr
  _install fakeinstall/usr/lib/dri/*_dri.so
   
  _install fakeinstall/usr/lib/bellagio
  _install fakeinstall/usr/lib/d3d
  _install fakeinstall/usr/lib/lib{gbm,glapi}.so*
  _install fakeinstall/usr/lib/libOSMesa.so*
  _install fakeinstall/usr/lib/libxatracker.so*
  _install fakeinstall/usr/lib/libswrAVX*.so*

  # in vulkan-headers
  rm -rv fakeinstall/usr/include/vulkan

  _install fakeinstall/usr/include
  _install fakeinstall/usr/lib/pkgconfig

  # libglvnd support
  _install fakeinstall/usr/lib/libGLX_mesa.so*
  _install fakeinstall/usr/lib/libEGL_mesa.so*

  # indirect rendering
  ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"

  # make sure there are no files left to install
  find fakeinstall -depth -print0 | xargs -0 rmdir

  # bring back missing glesv2.pc
  install -m644 -Dt ${pkgdir}/usr/lib/pkgconfig ${srcdir}/glesv2.pc

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
