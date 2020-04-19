# Maintainer: David Runge <dvzrv@archlinux.org>

# openssl > 1.1.1d is not yet compatible with edk2-ovmf
_openssl_ver=1.1.1d
pkgbase=edk2
pkgname=('edk2-shell' 'edk2-ovmf')
pkgver=202002
pkgrel=1
pkgdesc="Modern, feature-rich firmware development environment for the UEFI specifications"
arch=('any')
url="https://github.com/tianocore/edk2"
license=('BSD')
makedepends=('acpica' 'iasl' 'libutil-linux' 'nasm' 'python')
options=(!makeflags)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/tianocore/${pkgbase}/archive/${pkgbase}-stable${pkgver}.tar.gz"
        "https://www.openssl.org/source/openssl-${_openssl_ver}.tar.gz"{,.asc})
sha512sums=('e43090f9c0916b48452fa14bbcd9cd125330304c44b904502ef4ac035bbfb1b0529336f76a0512c0cdbcb4092722839e70b07866e845e76280f6a90b7fb093ab'
            '2bc9f528c27fe644308eb7603c992bac8740e9f0c3601a130af30c9ffebbf7e0f5c28b76a00bbb478bad40fbe89b4223a58d604001e1713da71ff4b7fe6a08a7'
            'SKIP')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491') # Matt Caswell <matt@openssl.org>
_arch_list=('IA32' 'X64')
_build_type='RELEASE'
_build_plugin='GCC5'

prepare() {
  mv -v "$pkgbase-$pkgbase-stable$pkgver" "$pkgbase-$pkgver"
  cd "$pkgbase-$pkgver"
  # symlinking openssl into place
  rm -rfv CryptoPkg/Library/OpensslLib/openssl
  ln -sfv "${srcdir}/openssl-$_openssl_ver" CryptoPkg/Library/OpensslLib/openssl
  # openssl 1.1.1d has a typo that causes a compile error
  sed -e 's/return return/return/g' \
      -i "../openssl-$_openssl_ver/crypto/threads_none.c"
  # -Werror, not even once
  sed -e 's/ -Werror//g' \
      -i BaseTools/Conf/*.template BaseTools/Source/C/Makefiles/*.makefile
}

build() {
  cd "$pkgbase-$pkgver"
  local _arch
  make -C BaseTools
  . edksetup.sh
  for _arch in ${_arch_list[@]}; do
    # shell
    echo "Building shell (${_arch})."
    BaseTools/BinWrappers/PosixLike/build -p ShellPkg/ShellPkg.dsc \
                                          -a "${_arch}" \
                                          -b "${_build_type}" \
                                          -n "$(nproc)" \
                                          -t "${_build_plugin}"
    # ovmf
    if [[ "${_arch}" == 'IA32' ]]; then
      echo "Building ovmf (${_arch}) with secure boot"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM2_ENABLE \
                       -D HTTP_BOOT_ENABLE \
                       -D TLS_ENABLE \
                       -D FD_SIZE_2MB \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE \
                       -D EXCLUDE_SHELL_FROM_FD
      mv -v Build/Ovmf{Ia32,IA32-secure}
      echo "Building ovmf (${_arch}) without secure boot"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM2_ENABLE \
                       -D HTTP_BOOT_ENABLE \
                       -D TLS_ENABLE \
                       -D FD_SIZE_2MB
      mv -v Build/Ovmf{Ia32,IA32}
    fi
    if [[ "${_arch}" == 'X64' ]]; then
      echo "Building ovmf (${_arch}) with secure boot"
      OvmfPkg/build.sh -p "OvmfPkg/OvmfPkg${_arch}.dsc" \
                       -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM2_ENABLE \
                       -D FD_SIZE_2MB \
                       -D TLS_ENABLE \
                       -D HTTP_BOOT_ENABLE \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE \
                       -D EXCLUDE_SHELL_FROM_FD
      mv -v Build/OvmfX64{,-secure}
      echo "Building ovmf (${_arch}) without secure boot"
      OvmfPkg/build.sh -p "OvmfPkg/OvmfPkg${_arch}.dsc" \
                       -a "${_arch}" \
                       -b "${_build_type}" \
                       -n "$(nproc)" \
                       -t "${_build_plugin}" \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM2_ENABLE \
                       -D FD_SIZE_2MB \
                       -D TLS_ENABLE \
                       -D HTTP_BOOT_ENABLE
    fi
  done
}

package_edk2-shell() {
  provides=('uefi-shell')
  cd "$pkgbase-$pkgver"
  local _arch
  # minimal UEFI shell, as defined in ShellPkg/Application/Shell/ShellPkg.inf
  local _min='7C04A583-9E3E-4f1c-AD65-E05268D0B4D1'
  # full UEFI shell, as defined in ShellPkg/ShellPkg.dsc
  local _full='EA4BB293-2D7F-4456-A681-1F22F42CD0BC'
  for _arch in ${_arch_list[@]}; do
    install -vDm 644 "Build/Shell/${_build_type}_${_build_plugin}/${_arch}/Shell_${_min}.efi" \
      "${pkgdir}/usr/share/${pkgname}/${_arch,,}/Shell.efi"
    install -vDm 644 "Build/Shell/${_build_type}_${_build_plugin}/${_arch}/Shell_${_full}.efi" \
      "${pkgdir}/usr/share/${pkgname}/${_arch,,}/Shell_Full.efi"
  done
  # license
  install -vDm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # docs
  install -vDm 644 {Readme.md,Maintainers.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

package_edk2-ovmf() {
  pkgdesc="Open Virtual Machine Firmware to support firmware for Virtual Machines"
  provides=('ovmf')
  conflicts=('ovmf')
  replaces=('ovmf')
  license+=('MIT')
  cd "$pkgbase-$pkgver"
  local _arch
  # symlinking to locations defined by qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vdm 755 "${pkgdir}/usr/share/qemu/"
  for _arch in ${_arch_list[@]}; do
    # installing the various firmwares
    install -vDm 644 Build/Ovmf${_arch}/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd \
      -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}"
    install -vDm 644 Build/Ovmf${_arch}/${_build_type}_${_build_plugin}/FV/OVMF_VARS.fd \
      -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}"
    install -vDm 644 Build/Ovmf${_arch}-secure/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd \
      "${pkgdir}/usr/share/${pkgname}/${_arch,,}/OVMF_CODE.secboot.fd"
    if [[ "${_arch}" == 'IA32' ]]; then
      ln -sfv "/usr/share/${pkgname}/${_arch,,}/OVMF_CODE.fd" \
        "${pkgdir}/usr/share/qemu/edk2-i386-code.fd"
      ln -sfv "/usr/share/${pkgname}/${_arch,,}/OVMF_VARS.fd" \
        "${pkgdir}/usr/share/qemu/edk2-i386-vars.fd"
      ln -sfv "/usr/share/${pkgname}/${_arch,,}/OVMF_CODE.secboot.fd" \
        "${pkgdir}/usr/share/qemu/edk2-i386-secure-code.fd"
    fi
    if [[ "${_arch}" == 'X64' ]]; then
      ln -sfv "/usr/share/${pkgname}/${_arch,,}/OVMF_CODE.fd" \
        "${pkgdir}/usr/share/qemu/edk2-x86_64-code.fd"
      ln -sfv "/usr/share/${pkgname}/${_arch,,}/OVMF_VARS.fd" \
        "${pkgdir}/usr/share/qemu/edk2-x86_64-vars.fd"
      ln -sfv "/usr/share/${pkgname}/${_arch,,}/OVMF_CODE.secboot.fd" \
        "${pkgdir}/usr/share/qemu/edk2-x86_64-secure-code.fd"
    fi
  done
  # adding a symlink for legacy applications
  ln -svf "/usr/share/${pkgname}" "${pkgdir}/usr/share/OVMF"
  # licenses
  install -vDm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 OvmfPkg/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/OvmfPkg.License.txt"
  # docs
  install -vDm 644 {OvmfPkg/README,Readme.md,Maintainers.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
