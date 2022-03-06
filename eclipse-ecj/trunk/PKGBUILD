# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=eclipse-ecj
pkgver=4.22
pkgrel=2
_date=202111241800
pkgdesc='Eclipse java bytecode compiler'
arch=(any)
license=(EPL)
url=https://www.eclipse.org/
makedepends=(
  ant
  java-environment=11
)
_base_url=https://archive.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}
_source_file_name=ecjsrc-${pkgver}.jar
_sha_file_name=eclipse-${pkgver}-SUMSSHA512
source=(
  ${_base_url}/${_source_file_name}
  #${_base_url}/checksum/${_sha_file_name}{,.asc}
  ${_base_url}/checksum/${_sha_file_name}
  01-ecj-include-props.patch
  02-buildxml-fix-manifest.patch
  ecj
)
validpgpkeys=(3C91FED3922D52296888BAE9B6D3AB9BCC641282) # Eclipse Platform Project <platform-releng-dev@eclipse.org>
sha512sums=('cd52a72aecded032625ee83581ac565e1e96f8d26ecfc76e982274fd3d6238f1e7f22576855589b021e9a5ef67686b9b75e010c4e2033a8b7f6e7c9b1ff7eb4c'
            'd4ba6a2bd89e0804e0ae45f9f7bc49e05f65cc2339638e73d9e00663686ebd288ff6badcda00baed664790fce6e875b3d05513d5d89f644547c3fec665366e14'
            '0eb47ad770e2b7bff82cfe933073a044d3c506946436671f6a76a43c94a72194c8fc93eaf065512235214dce8fc1730cf93fab7dfa106adeb1b814336ca46281'
            '11ca94869d71842401e48acca72fd89e339ba65c81909cf8501bb243457caa21dc659d268b98c42ac77a1834fb7de46138787e8ea0966d96324c8de829fe563c'
            '1895c12c63262a08a2c889bb1db61308b5cb8846e5f20e584cde6878afd4da5ee051045a61a0a5a4498146a7315c8a14bf120e5d369365f4efc573d371381846')

prepare() {
  cd "${srcdir}"
  local _source_file_sum=$(grep -m 1 ${_source_file_name} ${_sha_file_name} | cut -d ' ' -f 1)
  if [[ "${sha512sums[0]}" != "${_source_file_sum}" ]]; then
    echo "Source file ${_source_file_name} does not match the SHA sum"
    echo "provided by upstream in their PGP signed file"
    return 1
  fi

  for p in 01-ecj-include-props 02-buildxml-fix-manifest; do
    patch -p0 < ${p}.patch
  done
}

build() {
  export LANG=en_US.UTF-8
  ant build
}

package() {
  depends=(java-runtime)

  install -Dm 644 "${srcdir}"/ecj.jar "${pkgdir}"/usr/share/java/eclipse-ecj-${pkgver}.jar
  ln -s eclipse-ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/ecj.jar
  ln -s eclipse-ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/eclipse-ecj.jar
  install -Dm 755 ecj -t "${pkgdir}"/usr/bin/
  install -Dm 644 ecj.1 -t "${pkgdir}"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:
