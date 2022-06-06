# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgbase=libverto
pkgname=('libverto' 'libverto-glib2' 'libverto-libevent' 'libverto-libev')
pkgver=0.3.2
pkgrel=3
pkgdesc="Main event loop abstraction library"
arch=('x86_64')
url="https://github.com/latchset/libverto"
license=(MIT)
makedepends=(# Supported event loops
             'glib2' 'libevent' # extra repo
             'libev' # community repo
)
source=("https://github.com/latchset/libverto/releases/download/$pkgver/libverto-$pkgver.tar.gz")
sha256sums=('8d1756fd704f147549f606cd987050fb94b0b1ff621ea6aa4d6bf0b74450468a')

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    # use copy so a new file is created and fakeroot can track properties such as setuid
    cp -av "${src}" "${dir}/"
    rm -rf "${src}"
  done
}

#prepare() {
#  cd "$pkgbase-$pkgver"
#  autoreconf -i -f
#}

build() {
  cd "$pkgbase-$pkgver"
  ./configure --prefix=/usr \
    --disable-static
  make

  # fake installation to be seperated into packages
  make DESTDIR="${srcdir}/fakeinstall" install
}

check() {
  cd "$pkgbase-$pkgver"
  make check
}

# Let's take over Fedora packaging notes:
# If you are packaging an application, not library, based on libverto,
# you should depend either on a specific implementation module or you
# can depend on the virtual provides 'libverto-module-base'. This will
# ensure that you have at least one module installed that provides io,
# timeout and signal functionality. Currently glib is the only module
# that does not provide these three because it lacks signal. However,
# glib will support signal in the future.

package_libverto() {
  depends=('glibc')
  provides=('libverto.so')
  conflicts=("krb5<1.19.3-2")

  _install fakeinstall/usr/include/verto{,-module}.h
  _install fakeinstall/usr/lib/libverto.so*
  _install fakeinstall/usr/lib/pkgconfig/libverto.pc

  install -Dm0644 "$pkgbase-$pkgver"/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libverto-glib2() {
  pkgdesc+=" - glib2 main loop"
  depends=('libverto' 'glib2')
  provides=('libverto-glib.so') # not 'libverto-module-base' - it lacks signal

  _install fakeinstall/usr/include/verto-glib.h
  _install fakeinstall/usr/lib/libverto-glib.so*
  _install fakeinstall/usr/lib/pkgconfig/libverto-glib.pc

  install -Dm0644 "$pkgbase-$pkgver"/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libverto-libevent() {
  pkgdesc+=" - libevent main loop"
  depends=('libverto' 'libevent')
  provides=('libverto-module-base' 'libverto-libevent.so' )

  _install fakeinstall/usr/include/verto-libevent.h
  _install fakeinstall/usr/lib/libverto-libevent.so*
  _install fakeinstall/usr/lib/pkgconfig/libverto-libevent.pc

  install -Dm0644 "$pkgbase-$pkgver"/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libverto-libev() {
  pkgdesc+=" - libev main loop"
  depends=('libverto' 'libev')
  provides=('libverto-module-base' 'libverto-libev.so')

  _install fakeinstall/usr/include/verto-libev.h
  _install fakeinstall/usr/lib/libverto-libev.so*
  _install fakeinstall/usr/lib/pkgconfig/libverto-libev.pc

  install -Dm0644 "$pkgbase-$pkgver"/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
