# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=apparmor
pkgver=3.0.4
pkgrel=2
pkgdesc="Mandatory Access Control (MAC) using Linux Security Module (LSM)"
arch=(x86_64)
url="https://gitlab.com/apparmor/apparmor"
license=(GPL2 LGPL2.1)
depends=(audit glibc pam python)
makedepends=(apache libxcrypt python-setuptools ruby swig)
checkdepends=(dejagnu perl-locale-gettext python-notify2 python-psutil)
optdepends=('perl: for perl bindings'
            'python-notify2: for aa-notify'
            'python-psutil: for aa-notify'
            'ruby: for ruby bindings')
provides=(libapparmor.so)
backup=('etc/apparmor/easyprof.conf'
        'etc/apparmor/logprof.conf'
        'etc/apparmor/notify.conf'
        'etc/apparmor/parser.conf'
        'etc/apparmor/severity.db')
# NOTE: debug package currently contains invalid /build dir
# LTO is currently still broken: https://gitlab.com/apparmor/apparmor/-/issues/214
options=(!lto)
source=(
  "https://launchpad.net/${pkgname}/${pkgver%.[0-9]}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"{,.asc}
)
sha512sums=('1edd800771f46fab9bc5274842e64482b7fd4a5ba4de9855d621baf1d08c8236bfa7752dd9ab3dee095f8e0798129241a9aebf68ed1c994ae5597086a4a1a8ca'
            'SKIP')
b2sums=('831ea65ed0972ad8a6e335e438e7b0a8a2a3977dc4360ad1923d48cc7b21b1941ec011d3894d8bdc98934b953a3f1d89a859fc27ec2530f5dd9b3cc850fe66f0'
        'SKIP')
validpgpkeys=('3ECDCBA5FB34D254961CC53F6689E64E3D3664BB') # AppArmor Development Team (AppArmor signing key) <apparmor@lists.ubuntu.com>
_core_perl="/usr/bin/core_perl"

prepare() {
  cd "${pkgname}-${pkgver}"

  # remove test for help output that hardcodes expected output:
  # https://gitlab.com/apparmor/apparmor/-/issues/220
  sed '147,179d' -i utils/test/test-aa-notify.py

  # fix PYTHONPATH and add LD_LIBRARY_PATH for aa-logprof based check:
  # https://gitlab.com/apparmor/apparmor/issues/39
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local path="${PWD}/libraries/libapparmor/swig/python/build/lib.linux-${CARCH}-${python_version}/"
  local libs="${PWD}/libraries/libapparmor/src/.libs"

  sed -e "/PYTHONPATH/ s|utils\ |utils:$path\ LD_LIBRARY_PATH=$libs\ |" \
      -i profiles/Makefile
  (
    cd libraries/libapparmor/
    autoreconf -fiv
  )
}

build() {
  cd "${pkgname}-${pkgver}"

  # export required perl executable locations
  export MAKEFLAGS+=" POD2MAN=${_core_perl}/pod2man"
  export MAKEFLAGS+=" POD2HTML=${_core_perl}/pod2html"
  export MAKEFLAGS+=" PODCHECKER=${_core_perl}/podchecker"
  export MAKEFLAGS+=" PROVE=${_core_perl}/prove"
  (
    cd "libraries/libapparmor/"
    ./configure --prefix=/usr \
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
  cp -av "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-test"
}

check() {
  cd "$pkgname-$pkgver-test"
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
  depends+=('libcrypt.so')
  cd "$pkgname-$pkgver"
  make -C libraries/libapparmor DESTDIR="${pkgdir}" install
  make -C changehat/pam_apparmor DESTDIR="${pkgdir}/usr" install
  make -C changehat/mod_apparmor DESTDIR="${pkgdir}" install
  make -C binutils DESTDIR="${pkgdir}" \
                   SBINDIR="${pkgdir}/usr/bin" \
                   USR_SBINDIR="${pkgdir}/usr/bin" \
                   install
  make -C parser -j1 DESTDIR="${pkgdir}" \
                     SBINDIR="${pkgdir}/usr/bin" \
                     USR_SBINDIR="${pkgdir}/usr/bin" \
                     APPARMOR_BIN_PREFIX="${pkgdir}/usr/lib/apparmor" \
                     install install-systemd
  make -C profiles DESTDIR="${pkgdir}" install
  make -C utils DESTDIR="${pkgdir}" \
                SBINDIR="${pkgdir}/usr/bin" \
                USR_SBINDIR="${pkgdir}/usr/bin" \
                BINDIR="${pkgdir}/usr/bin" \
                VIM_INSTALL_PATH="${pkgdir}/usr/share/vim/vimfiles/syntax" \
                install

  # set file mode to allow the perl library to be stripped:
  # https://gitlab.com/apparmor/apparmor/issues/34
  find "${pkgdir}/usr/lib/perl5/" -type f -iname "*.so" -exec chmod 755 {} \;

  # remove empty core_perl directory:
  # https://gitlab.com/apparmor/apparmor/issues/40
  rm -rv "${pkgdir}"/usr/lib/perl5/*/core_perl
  # move ruby bindings to vendor_ruby:
  # https://gitlab.com/apparmor/apparmor/issues/35
  mv -v "${pkgdir}/usr/lib/ruby/site_ruby/" \
    "${pkgdir}/usr/lib/ruby/vendor_ruby/"
  # adding files below /etc/apparmor.d to backup array
  cd "${pkgdir}"
  # trick extract_function_variable() in makepkg into not detecting the
  # backup array modification and adding remaining configuration files
  [[ /usr/bin/true ]] && backup=( ${backup[@]} $(find "etc/${pkgname}.d/" -type f | LC_ALL=C sort) )
}
