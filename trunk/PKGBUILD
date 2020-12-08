# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=apparmor
pkgver=3.0.1
pkgrel=1
pkgdesc="Mandatory Access Control (MAC) using Linux Security Module (LSM)"
arch=('x86_64')
url="https://gitlab.com/apparmor/apparmor"
license=('GPL2' 'LGPL2.1')
depends=('audit' 'glibc' 'pam' 'python')
makedepends=('apache' 'libxcrypt' 'ruby' 'swig')
checkdepends=('dejagnu' 'perl-locale-gettext' 'python-notify2' 'python-psutil')
optdepends=('perl: for perl bindings'
            'python-notify2: for aa-notify'
            'python-psutil: for aa-notify'
            'ruby: for ruby bindings')
provides=('libapparmor.so')
backup=('etc/apparmor/easyprof.conf'
        'etc/apparmor/logprof.conf'
        'etc/apparmor/notify.conf'
        'etc/apparmor/parser.conf'
        'etc/apparmor/severity.db')
source=("https://launchpad.net/${pkgname}/${pkgver%.[0-9]}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "${pkgname}-3.0.1-python_ldflags.patch"
)
sha512sums=('e1073e7b2cde7cc4cefcfddce8fa5069845b5873c260b9fbd4bea2ff801708101d813ff30e23a64da36f3c6394cd9339e01a170e9add69deef2d70ecd9ed9687'
            'SKIP'
            '04d313c5fd95e975e1df9313869166d7318560fc83218d8b0ae7c17fed31883d4a5f3334b3ad28d22864a1ac41a3ac846a38fbc6c59fec3bc6b111ddb0015890')
b2sums=('c530d159a4139de8e59d9d975af866259b56d555e3abe2d1e2a6bfd2db57d8371d643bb93f1cd6ca96172960c09a74cc05c82d34a2e253c4c1f6ecce747f4129'
        'SKIP'
        '0ba81da585d4aca8cf88c08e8350e35d84b2675d53d0f435bb309fc875ddcfd3245740494da24502d5ef77be13e63863d35c04461c4e6dd8ce3ef48e69b4536b')
validpgpkeys=('3ECDCBA5FB34D254961CC53F6689E64E3D3664BB') # AppArmor Development Team (AppArmor signing key) <apparmor@lists.ubuntu.com>
_core_perl="/usr/bin/core_perl"

prepare() {
  cd "${pkgname}-${pkgver}"

  # add missing LDFLAGS for python library
  # https://gitlab.com/apparmor/apparmor/-/issues/129
  patch -Np1 -i ../"${pkgname}-3.0.1-python_ldflags.patch"

  # fix PYTHONPATH and add LD_LIBRARY_PATH for aa-logprof based check:
  # https://gitlab.com/apparmor/apparmor/issues/39
  local _py3_ver=$(python --version | cut -d " " -f2)
  local path="${PWD}/libraries/libapparmor/swig/python/build/lib.linux-${CARCH}-${_py3_ver%"."*}/LibAppArmor"
  local libs="${PWD}/libraries/libapparmor/src/.libs"
  sed -e "/PYTHONPATH/ s|utils\ |utils:$path\ LD_LIBRARY_PATH=$libs\ |" \
      -i profiles/Makefile
  (
    cd libraries/libapparmor/
    autoreconf -vfi
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
}

check() {
  cd "$pkgname-$pkgver"
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
  find "${pkgdir}/usr/lib/perl5/" \
    -type f -iname "*.so" \
    -exec chmod 755 {} \;

  # removing empty core_perl directory:
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
  [[ /usr/bin/true ]] && backup=( ${backup[@]} $(find "etc/${pkgname}.d/" -type f) )
}
