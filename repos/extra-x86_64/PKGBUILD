# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=apparmor
pkgver=3.0.6
pkgrel=1
pkgdesc="Mandatory Access Control (MAC) using Linux Security Module (LSM)"
arch=(x86_64)
url="https://gitlab.com/apparmor/apparmor"
license=(GPL2 LGPL2.1)
depends=(audit glibc pam python)
makedepends=(apache libxcrypt python-setuptools ruby swig)
checkdepends=(dejagnu perl-locale-gettext python-notify2 python-psutil)
optdepends=(
  'perl: for perl bindings'
  'python-notify2: for aa-notify'
  'python-psutil: for aa-notify'
  'ruby: for ruby bindings'
)
provides=(libapparmor.so)
backup=(
  etc/apparmor/easyprof.conf
  etc/apparmor/logprof.conf
  etc/apparmor/notify.conf
  etc/apparmor/parser.conf
  etc/apparmor/severity.db
)
options=(debug)
source=(
  https://launchpad.net/$pkgname/${pkgver%.[0-9]}/$pkgver/+download/$pkgname-$pkgver.tar.gz{,.asc}
  $pkgname-3.0.6-python.patch
)
sha512sums=('e200b4d7f2214ac8d3c7fff57ccbaf2c4f5e3831c75287add974c7c3cd5cb70d632cda16043396b11b77ab661b097a3904c7851da79920b0caee13abc885dbef'
            'SKIP'
            'afea70b4406e948bce5cdd8b8d62d0dc9d30bca3861545a5a463ba2909c08f1110cb0c638d9f871c8e4451a22015ce037ca829c789a916175d32c7d9cfbf2232')
b2sums=('6809f77d75283033971009d460476d0357344241f209d3d1eb9322d819182dc4196e12a070735196ef0e56a84dc3cf8c1786f9cf4615ed1b69b2d72a041ffbc4'
        'SKIP'
        '689038f910155d23a196a612e992d5e841de352305fab1e2b22d3efebaa31978d2bfdd999bfbd58db46e6dd68dcfd4e86a256fa87fe55ebd0f53067e004811f4')
validpgpkeys=('3ECDCBA5FB34D254961CC53F6689E64E3D3664BB') # AppArmor Development Team (AppArmor signing key) <apparmor@lists.ubuntu.com>
_core_perl="/usr/bin/core_perl"

prepare() {
  # fix issues with python-setuptools version detection: https://gitlab.com/apparmor/apparmor/-/issues/259
  # and hardcoded LDPATH/ PYTHONPATH https://gitlab.com/apparmor/apparmor/-/issues/39
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-3.0.6-python.patch

  cd $pkgname-$pkgver/libraries/libapparmor/
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver

  # export required perl executable locations
  export MAKEFLAGS+=" POD2MAN=$_core_perl/pod2man"
  export MAKEFLAGS+=" POD2HTML=$_core_perl/pod2html"
  export MAKEFLAGS+=" PODCHECKER=$_core_perl/podchecker"
  export MAKEFLAGS+=" PROVE=$_core_perl/prove"
  (
    cd libraries/libapparmor/
    ./configure \
      --prefix=/usr \
      --sbindir=/usr/bin \
      --with-perl \
      --with-python \
      --with-ruby
    make
  )
  make -C binutils
  make -C parser
  make -C profiles
  make -C utils
  make -C changehat/pam_apparmor
  make -C changehat/mod_apparmor
  make -C utils/vim

  # copy to test location as some tests render the resulting python bytecode
  # unreproducible: https://gitlab.com/apparmor/apparmor/-/issues/184
  cd ..
  cp -av $pkgname-$pkgver $pkgname-$pkgver-test
}

check() {
  cd $pkgname-$pkgver-test
  echo "INFO: Running check: libraries/libapparmor"
  make -C libraries/libapparmor check
  echo "INFO: Running check binutils"
  make -C binutils check
  echo "INFO: Running check parser"
  make -C parser check
  # NOTE: the profiles checks are notoriously broken, so run each separately
  echo "INFO: Running check-abstractions.d profiles"
  make -C profiles check-abstractions.d
#  # many hardcoded paths are not accounted for:
#  # https://gitlab.com/apparmor/apparmor/-/issues/137
#  echo "INFO: Running check-logprof profiles"
#  make -C profiles check-logprof
  echo "INFO: Running check-parser profiles"
  make -C profiles check-parser
  echo "INFO: Running check utils"
  # we do not care about linting when running tests
  # https://gitlab.com/apparmor/apparmor/-/issues/121
  make PYFLAKES='/usr/bin/true' -C utils check
}

package() {
  depends+=(libcrypt.so)

  cd $pkgname-$pkgver
  make -C libraries/libapparmor DESTDIR="$pkgdir" install
  make -C changehat/pam_apparmor DESTDIR="$pkgdir/usr" install
  make -C changehat/mod_apparmor DESTDIR="$pkgdir" install
  make -C binutils DESTDIR="$pkgdir" SBINDIR="$pkgdir/usr/bin" USR_SBINDIR="$pkgdir/usr/bin" install
  make -C parser -j1 DESTDIR="$pkgdir" SBINDIR="$pkgdir/usr/bin" USR_SBINDIR="$pkgdir/usr/bin" APPARMOR_BIN_PREFIX="$pkgdir/usr/lib/apparmor" install install-systemd
  make -C profiles DESTDIR="$pkgdir" install
  make -C utils DESTDIR="$pkgdir" SBINDIR="$pkgdir/usr/bin" USR_SBINDIR="$pkgdir/usr/bin" BINDIR="$pkgdir/usr/bin" VIM_INSTALL_PATH="$pkgdir/usr/share/vim/vimfiles/syntax" install

  # set file mode to allow the perl library to be stripped:
  # https://gitlab.com/apparmor/apparmor/issues/34
  find "$pkgdir/usr/lib/perl5/" -type f -iname "*.so" -exec chmod 755 {} \;

  # remove empty core_perl directory:
  # https://gitlab.com/apparmor/apparmor/issues/40
  rm -rv "${pkgdir}"/usr/lib/perl5/*/core_perl
  # move ruby bindings to vendor_ruby:
  # https://gitlab.com/apparmor/apparmor/issues/35
  mv -v "$pkgdir/usr/lib/ruby/"{site,vendor}_ruby
  # adding files below /etc/apparmor.d to backup array
  cd "$pkgdir"
  # trick extract_function_variable() in makepkg into not detecting the
  # backup array modification and adding remaining configuration files
  [[ /usr/bin/true ]] && backup=( ${backup[@]} $(find "etc/$pkgname.d/" -type f | LC_ALL=C sort) )
}
