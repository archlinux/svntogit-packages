# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=apparmor
pkgver=3.0.3
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
source=(
  "https://launchpad.net/${pkgname}/${pkgver%.[0-9]}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"{,.asc}
  "$pkgname-3.0.3-remove_distutils.patch::https://gitlab.com/apparmor/apparmor/-/commit/ab4cfb5e84a95decd06487dc4e59827ddb8ce79d.patch"
  "$pkgname-3.0.3-python3.10.patch::https://gitlab.com/apparmor/apparmor/-/commit/6cfc6eeec22d3c9ffae413819654359b76680150.patch"
)
sha512sums=('bbf26377e60da60dab56473ee5af15aa0f3fdf2f2a61dbfcdeba12a925afda3bc6a0f6cc31e07927400425b8c3b3649833f448d8674044c7274ef06923ab48b5'
            'SKIP'
            'de4cae1b06fb4f56a8aade9ccb3f223a9930f7c37a865e04aef3446038c016a3880e91546d734ac7102d0df20e3edc5ec9a7909a850a936c94399c431fe5d853'
            'ecfb29c60b0f1824817035c524f0265e1f5c977f2774f342c84fc783242acdca2835ff0ac099f852c07de5e6a42a323fd51b8c96c5d7695f46fd6cf135155fda')
b2sums=('aada9c32c2cde4a110cbd1d626ec00b08e29e76182185752e5c23e2ec0c2668a732ffdf1eb1660bd8bc294188ccf0da42b4282939f5969a6aed39084be00769c'
        'SKIP'
        '52c1d4a76f97e72765476e76277482771df18827d143d0ac04e1658e414224272a65a5dc11ac5308c30862b474c912f4642417176a44815723b49bb69ae9c356'
        'cf545f9548c724f3b1c9c214755dda277bdd6b5b79065c32675c788ab6fc145dd798d0366a360e0f6a3a35f572c71906b0760c0a268c0ffde265e28414dc3326')
validpgpkeys=('3ECDCBA5FB34D254961CC53F6689E64E3D3664BB') # AppArmor Development Team (AppArmor signing key) <apparmor@lists.ubuntu.com>
_core_perl="/usr/bin/core_perl"

prepare() {
  cd "${pkgname}-${pkgver}"

  # replace use of distutils with setuptools
  # https://gitlab.com/apparmor/apparmor/-/issues/202
  patch -Np1 -i ../$pkgname-3.0.3-remove_distutils.patch
  # ensure python3.10 compatibility:
  #  https://gitlab.com/apparmor/apparmor/-/issues/187
  patch -Np1 -i ../$pkgname-3.0.3-python3.10.patch
  # remove test for help text that is broken by the above patches
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
  [[ /usr/bin/true ]] && backup=( ${backup[@]} $(find "etc/${pkgname}.d/" -type f | LC_ALL=C sort) )
}
