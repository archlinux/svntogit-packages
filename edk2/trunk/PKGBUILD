# Maintainer: David Runge <dvzrv@archlinux.org>

_brotli_ver=1.0.9
_openssl_ver=1.1.1k
pkgbase=edk2
pkgname=('edk2-armvirt' 'edk2-shell' 'edk2-ovmf')
pkgver=202108
pkgrel=1
pkgdesc="Modern, feature-rich firmware development environment for the UEFI specifications"
arch=('any')
url="https://github.com/tianocore/edk2"
license=('BSD')
makedepends=('aarch64-linux-gnu-gcc' 'acpica' 'git' 'iasl' 'util-linux-libs' 'nasm' 'python')
options=(!makeflags)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/tianocore/${pkgbase}/archive/${pkgbase}-stable${pkgver}.tar.gz"
        "https://www.openssl.org/source/openssl-${_openssl_ver}.tar.gz"{,.asc}
        "brotli-${_brotli_ver}.tar.gz::https://github.com/google/brotli/archive/v${_brotli_ver}.tar.gz"
        "${pkgbase}-202102-brotli-1.0.9.patch"
        "50-edk2-ovmf-i386-secure.json"
        "50-edk2-ovmf-x86_64-secure.json"
        "60-edk2-ovmf-i386.json"
        "60-edk2-ovmf-x86_64.json"
        "70-edk2-armvirt-aarch64.json")
sha512sums=('325f3aecf796d61bec0d4d48699a347caca58292e76345ac81b716669d4308a7c777d142dc03482a041bc268e8897f11112a9d5e4e827e5146eaba6d4c1e7ff9'
            '73cd042d4056585e5a9dd7ab68e7c7310a3a4c783eafa07ab0b560e7462b924e4376436a6d38a155c687f6942a881cfc0c1b9394afcde1d8c46bf396e7d51121'
            'SKIP'
            'b8e2df955e8796ac1f022eb4ebad29532cb7e3aa6a4b6aee91dbd2c7d637eee84d9a144d3e878895bb5e62800875c2c01c8f737a1261020c54feacf9f676b5f5'
            'fe0fd592d4b436a35a49a74ad5dd989311b297b9abacb13ed8d4da0986169c91ffbc34cef0f2d52bf40c833d252f6e65311ab0e4e4ca6798390febfb9a787a4a'
            '55e4187b11b27737f61e528c02ff43b9381c0cb09140e803531616766f9cb9401115d88d946b56171784cc028f9571279640eb39b6a9fa8e02ec0c8d1b036a3e'
            'a1236585b30d720540de2e9527d8c90ff2d428e800b3da545b23461dc698dc91fe441b62bb8cbca76e08f4ec1eb485619e9ab26157deb06e7fb33e7f5f9dd8b6'
            'c81e072aabfb01d29cf5194111524e2c4c8684979de6b6793db10299c95bb94f7b1d0a98b057df0664d7a894a2b40e9b4c3576112fae400a95eaf5fe5fc9369b'
            '2030dc1d49d56fce8af56c5777fd40f04041e39ff806dd8c021e161227bdd646982024db6758230b8332dc68f16bc6918e1d54ad3c022e21e148d6b65ea778b3'
            'fa6d36a3c0225e4a5df532e77b18a035d65b0856d6a48875def5007de3f83d8d1d202d5b91e887d424112a3fa377dc9a09bdf44e5fcdccc36854675f95a211a4')
b2sums=('55e8b00618ac3ee8d05087ec21cb5cc4eb2ee3a332553e551ed2972d93e2ecce9c3e95a66d71180bbac8506866e08fc17a24877385ed5ce4bc9ae9daffd83bc9'
        'e9bd90f17bc819c4960d07bbee04346e8a7adb87a764a09d033ef76f1d638c67b180c4f2beb84ec25fbff54ccc9c14c13b9b16a27cac231a5dd22b02635d5cec'
        'SKIP'
        '8b9939d5224396ef33b43e019250ba4bc8949903583615e8dc02c85340fc0a1e2d1632161e00b0ee7355d77f05529ac772f482e05d2089afd71a0bf71e803904'
        'eb549f711aa31b0a46f3e9b74076e52e0e1734045c227f410016c6de46a3b7b2959287d49b5ef853236c57fa3b3143b1da31fd9ef6fd592ba22ba9af15941a76'
        '96502e0c8b748d6db0fcd4e767264f778319b4517fe4bf2e6e4f92e35bf09f388fb7f39c349e66444368820c31a6ff76e952053ac9f9696a59f7f0a929a650d1'
        '4a438a2f7726c6a9ff1a40506ddb5f724d5c220b57997784fefe4a180e249b4f1e9adc8e353e7dbc492a1bde0165442d873409656ce2fbbc9fd35c690b7692e4'
        '5da17cfe08368542f04b47121b296c56a6702233207b1cdb822eea42c8fb43d8856e86d19122621caf97e4332814c839204d7ce191041128ee3921b23f137bb6'
        '1b935f3ad0bd3f10a90430a2873bf592950e9c49c828b50bb1ae48634cee01cc571aeff1c5b4695e0b4faa6274afc0a92fdcc88e283029298bba5e11b2bd2904'
        '2fd510c533913bbd13fa31b3fdc8c4435bb3dee4ae8d34a516344da7a31ee036b23ac21e09b59b11f507520abeea89271601228f485ee80866bade0140c81742')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491') # Matt Caswell <matt@openssl.org>
_arch_list=('AARCH64' 'IA32' 'X64')
_build_type='RELEASE'
_build_plugin='GCC5'

prepare() {
  mv -v "$pkgbase-$pkgbase-stable$pkgver" "$pkgbase-$pkgver"
  cd "$pkgbase-$pkgver"
  # patch to be able to use brotli 1.0.9
  patch -Np1 -i "../${pkgbase}-202102-brotli-1.0.9.patch"
  # NOTE: patching brotli itself is not necessary (extra/brotli cherry-picks a patch for the pkgconfig integration)

  # symlinking openssl into place
  rm -rfv CryptoPkg/Library/OpensslLib/openssl
  ln -sfv "${srcdir}/openssl-$_openssl_ver" CryptoPkg/Library/OpensslLib/openssl

  # symlinking brotli into place
  rm -rfv BaseTools/Source/C/BrotliCompress/brotli MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  ln -sfv "${srcdir}/brotli-${_brotli_ver}" BaseTools/Source/C/BrotliCompress/brotli
  ln -sfv "${srcdir}/brotli-${_brotli_ver}" MdeModulePkg/Library/BrotliCustomDecompressLib/brotli

  # -Werror, not even once
  sed -e 's/ -Werror//g' \
      -i BaseTools/Conf/*.template BaseTools/Source/C/Makefiles/*.makefile
}

build() {
  cd "$pkgbase-$pkgver"
  export GCC5_IA32_PREFIX="x86_64-linux-gnu-"
  export GCC5_X64_PREFIX="x86_64-linux-gnu-"
  export GCC5_AARCH64_PREFIX="aarch64-linux-gnu-"
  local _arch
  echo "Building base tools (AARCH64)"
  ARCH=AARCH64 make -C BaseTools
  echo "Building base tools"
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
                       -D LOAD_X64_ON_IA32_ENABLE \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM_ENABLE \
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
                       -D LOAD_X64_ON_IA32_ENABLE \
                       -D NETWORK_IP6_ENABLE \
                       -D TPM_ENABLE \
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
                       -D TPM_ENABLE \
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
                       -D TPM_ENABLE \
                       -D FD_SIZE_2MB \
                       -D TLS_ENABLE \
                       -D HTTP_BOOT_ENABLE
    fi
    if [[ "${_arch}" == 'AARCH64' ]]; then
      echo "Building ovmf (${_arch}) with secure boot"
      BaseTools/BinWrappers/PosixLike/build -p "ArmVirtPkg/ArmVirtQemu.dsc" \
                                            -a "${_arch}" \
                                            -b "${_build_type}" \
                                            -n "$(nproc)" \
                                            -t "${_build_plugin}" \
                                            -D NETWORK_IP6_ENABLE \
                                            -D NETWORK_HTTP_BOOT_ENABLE \
                                            -D NETWORK_TLS_ENABLE \
                                            -D SECURE_BOOT_ENABLE \
                                            -D TPM_ENABLE \
                                            -D TPM_CONFIG_ENABLE
      dd if="/dev/zero" \
        of="Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd" \
        bs=1M count=64
      dd if="Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/QEMU_EFI.fd" \
        of="Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd" \
        conv=notrunc
      dd if="/dev/zero" \
        of="Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/QEMU_VARS.fd" \
        bs=1M count=64
    fi
  done
}

package_edk2-armvirt() {
  pkgdesc="Firmware for Virtual Machines (aarch64)"
  local _arch=AARCH64

  cd "$pkgbase-$pkgver"
  install -vDm 644 "Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/FV/"*.fd \
    -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}/"
  # add libvirt compatibility (which hardcodes the following paths)
  install -vdm 755 "${pkgdir}/usr/share/AAVMF"
  ln -svf "/usr/share/${pkgname}/${_arch,,}/QEMU_CODE.fd" \
    "${pkgdir}/usr/share/AAVMF/AAVMF_CODE.fd"
  ln -svf "/usr/share/${pkgname}/${_arch,,}/QEMU_VARS.fd" \
    "${pkgdir}/usr/share/AAVMF/AAVMF_VARS.fd"
  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*"${pkgname}"*.json -t "${pkgdir}/usr/share/qemu/firmware"
  # license
  install -vDm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_edk2-shell() {
  pkgdesc="EDK2 UEFI Shell"
  provides=('uefi-shell')

  cd "$pkgbase-$pkgver"
  local _arch
  # minimal UEFI shell, as defined in ShellPkg/Application/Shell/ShellPkg.inf
  local _min='7C04A583-9E3E-4f1c-AD65-E05268D0B4D1'
  # full UEFI shell, as defined in ShellPkg/ShellPkg.dsc
  local _full='EA4BB293-2D7F-4456-A681-1F22F42CD0BC'
  for _arch in ${_arch_list[@]}; do
    if [[ "${_arch}" == 'AARCH64' ]]; then
      install -vDm 644 "Build/ArmVirtQemu-${_arch}/${_build_type}_${_build_plugin}/${_arch}/Shell.efi" \
        -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}/"
    else
      install -vDm 644 "Build/Shell/${_build_type}_${_build_plugin}/${_arch}/Shell_${_min}.efi" \
        "${pkgdir}/usr/share/${pkgname}/${_arch,,}/Shell.efi"
      install -vDm 644 "Build/Shell/${_build_type}_${_build_plugin}/${_arch}/Shell_${_full}.efi" \
        "${pkgdir}/usr/share/${pkgname}/${_arch,,}/Shell_Full.efi"
    fi
  done
  # license
  install -vDm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  # docs
  install -vDm 644 {ReadMe.rst,Maintainers.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}

package_edk2-ovmf() {
  pkgdesc="Firmware for Virtual Machines (x86_64, i686)"
  provides=('ovmf')
  conflicts=('ovmf')
  replaces=('ovmf')
  license+=('MIT')
  install="${pkgname}.install"

  cd "$pkgbase-$pkgver"
  local _arch
  # installing the various firmwares
  for _arch in ${_arch_list[@]}; do
    if [[ "${_arch}" == 'AARCH64' ]]; then
      continue
    else
      # installing OVMF.fd for xen: https://bugs.archlinux.org/task/58635
      install -vDm 644 "Build/Ovmf${_arch}/${_build_type}_${_build_plugin}/FV/OVMF.fd" \
        -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}"
      install -vDm 644 "Build/Ovmf${_arch}/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd" \
        -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}"
      install -vDm 644 "Build/Ovmf${_arch}/${_build_type}_${_build_plugin}/FV/OVMF_VARS.fd" \
        -t "${pkgdir}/usr/share/${pkgname}/${_arch,,}"
      install -vDm 644 "Build/Ovmf${_arch}-secure/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd" \
        "${pkgdir}/usr/share/${pkgname}/${_arch,,}/OVMF_CODE.secboot.fd"
    fi
  done
  # installing qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  # https://bugs.archlinux.org/task/64206
  install -vDm 644 ../*"${pkgname}"*.json -t "${pkgdir}/usr/share/qemu/firmware"
  # adding symlink for previous ovmf location
  # https://bugs.archlinux.org/task/66528
  ln -svf "/usr/share/${pkgname}" "${pkgdir}/usr/share/ovmf"
  # adding a symlink for applications with questionable heuristics (such as lxd)
  ln -svf "/usr/share/${pkgname}" "${pkgdir}/usr/share/OVMF"
  # licenses
  install -vDm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 OvmfPkg/License.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/OvmfPkg.License.txt"
  # docs
  install -vDm 644 {OvmfPkg/README,ReadMe.rst,Maintainers.txt} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
