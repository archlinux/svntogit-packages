# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Alexander Epaneshnikov <alex19ep@archlinux.org>

_brotli_ver=1.0.9
_openssl_ver=1.1.1q
pkgbase=edk2
pkgname=(edk2-armvirt edk2-shell edk2-ovmf)
pkgver=202208
pkgrel=2
pkgdesc="Modern, feature-rich firmware development environment for the UEFI specifications"
arch=(any)
url="https://github.com/tianocore/edk2"
license=(BSD)
makedepends=(aarch64-linux-gnu-gcc acpica git iasl util-linux-libs nasm python seabios)
options=(!makeflags)
source=(
  $pkgbase-$pkgver.tar.gz::https://github.com/tianocore/$pkgbase/archive/$pkgbase-stable$pkgver.tar.gz
  https://www.openssl.org/source/openssl-$_openssl_ver.tar.gz{,.asc}
  brotli-$_brotli_ver.tar.gz::https://github.com/google/brotli/archive/v$_brotli_ver.tar.gz
  50-edk2-ovmf-i386-secure.json
  50-edk2-ovmf-i386-secure-4m.json
  50-edk2-ovmf-x86_64-secure.json
  50-edk2-ovmf-x86_64-secure-4m.json
  60-edk2-ovmf-i386.json
  60-edk2-ovmf-i386-4m.json
  60-edk2-ovmf-x86_64.json
  60-edk2-ovmf-x86_64-4m.json
  60-edk2-ovmf-microvm.json
  60-edk2-ovmf-microvm-4m.json
  60-edk2-armvirt-aarch64.json
  70-edk2-ovmf-i386-csm.json
  70-edk2-ovmf-i386-csm-4m.json
  70-edk2-ovmf-x86_64-csm.json
  70-edk2-ovmf-x86_64-csm-4m.json
  80-edk2-ovmf-ia32-on-x86_64-secure.json
  80-edk2-ovmf-ia32-on-x86_64-secure-4m.json
  81-edk2-ovmf-ia32-on-x86_64.json
  81-edk2-ovmf-ia32-on-x86_64-4m.json
  82-edk2-ovmf-ia32-on-x86_64-csm.json
  82-edk2-ovmf-ia32-on-x86_64-csm-4m.json
  $pkgbase-202202-brotli.patch
)
sha512sums=('6a09d90c2e7f9b762dd8a22d61acf94ef740b5250532c50bc1a56b4df3cc11937457b3aff5494b85c41d9567de1f7718855e3801b8ba4b6762d35f524118245e'
            'cb9f184ec4974a3423ef59c8ec86b6bf523d5b887da2087ae58c217249da3246896fdd6966ee9c13aea9e6306783365239197e9f742c508a0e35e5744e3e085f'
            'SKIP'
            'b8e2df955e8796ac1f022eb4ebad29532cb7e3aa6a4b6aee91dbd2c7d637eee84d9a144d3e878895bb5e62800875c2c01c8f737a1261020c54feacf9f676b5f5'
            '603cae145a87bae371bd069d05128beebddb7048e78b93650b19c44b86b2d27cabbcf3bc4c0b2384b862f32383ce7a914a10fc0ad564632bcadd6e4f9389fede'
            '0c0bc684cef2e35d600ebab12cfc87ade1409270d3838c0b70c27e8bd8a704f69c982de9781b92c8b698948a03a77de575d50ff8fcb8ba09f8ab936ad239a2bf'
            '3e10bdc9ad13aadbd4111230fb8f37d5f16306aeb7bce2af5ec31c1e2b5adea26d5875cd0d7070ea82eca7546ecbacc8c195ed68425428bf6d2533b58e307b2d'
            'cb945b6b88b112cd6bfc02dc60112c22c25a057e285ec53169578026e2173e275e2621e7220ac4623105c2b384db66e156b019df89802daa5f8c30f456d5c478'
            '56d0bffd6dd7be79709f66bcfba2112e8ef6208de9b5018e90251e3ba68b37f9d911f0bd5a03987b49bb19bd0d62f7fa9ac3ca9f234e80ada3c4dbdd619705b9'
            '7af6cc543280428aa81dcc5a2da897052ef29bd7d3a73d44f7a2c6f207d626b0f662da9111c1d5f93fd786f10813ebfef57ac44705370801cfe84730961602bc'
            '04b4c86f5afeab6170ad1b7b9937fa775a920c78719a33b213f7f8924e4e905709335307c38b8d5d9c127dd8c7000ddbe740b77f1ddfb68035819b7b4cf2b1e4'
            '11c747781fe09eac852c7ed996886559626fe0a394fc380939a868516f03b94190f0a7fce2a09f879313a0ec24509ba89ca050c0e9aed920ca441fc793596645'
            '31874507e67e1332f678f6f4b10b9f893cef6bafb1db2ac781ea7bfded31a23a84c485b6df43699aaf6c4c7a5a30e024031ffd2b52ede104eedc7c8725e2b5d6'
            '720181408cdcb8d49bfdfbccb289abba5b18ca7c607facf77b33997810f6687e65cab831f58a848dac3c20f0a540f63a3ca959195e00afdc52c8799c0bafadb9'
            '6d2799171058b45ff4205441ad222893ebe2fce5c5c71c9c52c97efc95e4cad65d66d390b6a554ce7a2ce505ceba7431d18f79f2c2c1101addccee55141d4a66'
            '4ee69302de1cec37e4bf4c6a5525d887392f8f733ae8a95a54021f6531741e95baef31da1538b45667a1b198cbbab3069678169069f9ba8db641d603ebb3735b'
            '24af2459154e7303e5d3df83d06a839256740ad0e9a50dcccc58404b89692ad473b5941aa6f13bdf42a08eef941a2a2557398f6218e476deee3682f65d72d2f1'
            '77e23f0c116ae5a087553edb2754df172b2c4fe5bc346356abe0e1f2acfb41a346d06d87b0569102ca4ac9356e189198c0c74476cb35f1b62773a956cb6a1e04'
            '84f24534edb962b71532da914d26d503000d84242d92f4a72c84ad02acf097a695170508065507d6c333f17a7f23043ac68f01e86bbd69e01e5ed067183a7ed1'
            '8e5eb4e24fad4644a66eb52c95a90a82f01df0af6e57208ad61cb0859dd4425e623e75d93846e8fc3235370a88d93a1d27a512dc4e559bedfe3249404797838b'
            '038c1f2c189c4e80e87b62df4f3ff96dbf5a20b8fc26b36c04c902293ff1c236ddf3da0063bc5778bf84731fa562d377b9e29c02492c8e584119d71695e0ca09'
            '7c9f8e7ce7451e7aa852998ffcd3ca95c08083c313dc8dcf0877969ef23d9da6f69c60bb1e652387a223da6e690524fa094bfbaed14d8bdae2853e68530b2f82'
            'd9857c22bbbee5db9c8e46aaf615600d4b54d6d47fa5f53aa974da98cfd2b8565b1c20e1a9986f5cd4f0352fb65ec105f6ade8e986402369b0edb1581b0b15b5'
            '891d3ea36d966114ff1f79c3619675a46b30b68def16ab426f2dee00bd0768f82ca0ee26acd7adedd379f25613e309ec9dfaed4e8a5d3f3e4fa7e8d845f55b18'
            '427f10a9ad528c796366aac9da9668a255642c57dd099a2a798f7f95031a55a360474d657cec300988337d8facb9997fc835dccf77eb0290a94cdc3a36db8f6c'
            'd074c794796d17d77eed7c34201d93d7ef3f1322fe1ea4a2ddd7137fae884d49f94f465ee39cfd8346b026142668a41f5a8671e521409505dd6d002f71c0eebc')
b2sums=('06b25eb8b2a7fd16041a8f3f5b0fcca6bf554a452a39c0ec5d222e94361cc6485c7b6ac1458e464a0b504e257aa5573d6fc0107aa60550226b960046a47d8d2e'
        'fc8fd6a62dc291d0bda328a051e253175fb04442cc4b8f45d67c3a5027748a0fc5fb372d0483bc9024ae0bff119c4fac8f1e982a182612427696d6d09f5935f5'
        'SKIP'
        '8b9939d5224396ef33b43e019250ba4bc8949903583615e8dc02c85340fc0a1e2d1632161e00b0ee7355d77f05529ac772f482e05d2089afd71a0bf71e803904'
        'fa75566a2ac591fc0c296812f907bfe3fd67f2ee90d3762f0fcae6427df0dfd6260238f5af4fc6b74a76eccfc264db2259db70f8c533871e8b58f37b91a90657'
        'd8e31fe12522f3c973c400435410b48cff92b67f00bc19808d211edc2f56f164b662457687d0e8aa69aba4ef279b74684579899a2e59ea06a2b399faff5557f6'
        'f6aaccf4b5a070b05e8eb58d5df60c8798d9b9de2f9febf1417a1ae178431be9a69890a7107d3ca100a439551b4949b937ba400ac36bb9eebaf7e1fdb61dc9d3'
        'acbe08c38460a3acdb3ada3bf30468c59c7e1f812576ab39d9261f9bf5432bc4150bacac51a590b8bba26d0842da97ab3ddff8c4cfc44e00bf2b6c9ab7c153ba'
        '891719a70d14f29f6ec9e9cfe83cbf48abb5aedfaf5a3a02efaf9cf1dcca0c14f42f8e4486425df12c72001d7811b0f6030520bad2d83b4885f13d110ab2ae0f'
        'fb6f2b838ca4da83978ba04dbb6785b7f0712342a92deb0ca7bc16ebf5c31b34903908266c47c637baa17a4c1c6641c35e4e6c3c2771f270c31c7a7a78c82e9f'
        '899ecf699815216984905a7abdd3385890c6309f3ef7813778bedf63c15d42ab12c59532d45033a11838f990744417100eb13048b53cee5cdf46440af61b475d'
        'b970841e9587133bc2038f9aaa4d00247c9652c6a9aed417c59df061e00c3b9d91d174f6b2a4fb66862cbbc754c0a79d77774c3fa1419b04eb6a3211d54451a5'
        '271322de65313b310a390ea9148640eb065c71b4edcab8aa675f8dbdfbbfa961950994d47213e22f05aa093895d180b840627a15d324252323986596f5c9f067'
        '3622e946453d88de0e458217fadb74bde221e4efbbdc232ee84d4fb74a895a725e32e98e575a10ad642f7e0badf47c72303105555a7d266c9a928074aef19a32'
        'e61378139f2da0d4185e67436d87a023600a075b4258234e818fe7f591bdb5d363713d29d250263df6074f5d37deed269c067983ee6bd322f2f7d0ee710bc452'
        '8c211a1bbef20ff361c53735b91cc05660f9d94e7d8a937d903c061a1ec9c96ec2c37f0ef5e954cd4aac7f7962489f5a7a0507e44c781a7671211a9530dccb5b'
        'c869699ef197bf18e048ca59c170bc09e1c792b99d2a5ee0ce3fb8f248d271f5b2a1788f44a392acf668dbf47f8bc4c4c9dbead3e7a26c2c093650df65cc9d2a'
        '7f48bb1747c732c597a749c851a6cac46de844c1727f3d5edca35249df845a0f578780e8bcda7d86ad2c4a62a9a2a0bc7e1cfab9b7b93d7b5415bb5817d73346'
        '6bea37f43f5ba483c7c1b57043bc7529d883992d5b64d28f96fd87aeb39ef52eec443d473badcb3323cd259c0bff249d550a00a78c3db7718a7a2200daf7f0db'
        'ddacbab89d0fd7831149594487559bb6bac1464b2b5620641043306fabfc37800db8c6d87a833c70ec35c699ea2f35cf09d34028ec7982a94686e8cd97b73300'
        '5cffcdde97a4b830412294d97d70f73c223c30f2489f10ab9731b76d77ac73518164c8eac6c2adfc879e29e289bbde677d7ca641b2af0db4f507719b01d6c87b'
        '99bf35c4042fd5105a3b3b7f71b0aeb18db7811da4ed4481ffec485258619c30d33b08633f9a1c762d383e3bf0191053be9b88b9a4c142350186c6df1261d1f7'
        'f9afdc9c7ed72c97f6747087b341f4af3527d2a148cb0cda3a1b676c4def7acc2172f889f56fe66ab8a27a038a5f47c86627393dcb1ec9c4d36361d8b0c15a40'
        'd45b224c36eda139ca6ad9e4c6c04282724b264dd36a0b3ba904d71476b83e02963c8cadf1f1e1233955071d133dc0defa746740fa08b26398c489fbf6ba89a0'
        '27523147892b9953643e08e3f592598c6cb04986fcf6f1f54b21f6a293acbbbc4bcdfcd67ef1dfc4894fac294a9268a9da265ef9205736e359116ba546bee5ef'
        '644c071dc4fbbccaa64b0b1babcad60395ffce1a7a317a6f5380eff44cbb886be5f29156a8e967ab02b508a33954fcf5602606b43362cc3bb1936a8cfc3a3c07')
validpgpkeys=(
  8657ABB260F056B1E5190839D9C4D26D0E604491 # Matt Caswell <matt@openssl.org>
  7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C  # Richard Levitte <richard@levitte.org>
)
_arch_list=(AARCH64 IA32 X64)
_build_type=RELEASE
_build_plugin=GCC5

prepare() {
  # patch to be able to use brotli 1.0.9
  patch -Np1 -d $pkgbase-$pkgbase-stable$pkgver -i ../$pkgbase-202202-brotli.patch

  cd $pkgbase-$pkgbase-stable$pkgver

  # symlinking openssl into place
  rm -rfv CryptoPkg/Library/OpensslLib/openssl
  ln -sfv "${srcdir}/openssl-$_openssl_ver" CryptoPkg/Library/OpensslLib/openssl

  # symlinking brotli into place
  rm -rfv BaseTools/Source/C/BrotliCompress/brotli MdeModulePkg/Library/BrotliCustomDecompressLib/brotli
  ln -sfv "${srcdir}/brotli-${_brotli_ver}" BaseTools/Source/C/BrotliCompress/brotli
  ln -sfv "${srcdir}/brotli-${_brotli_ver}" MdeModulePkg/Library/BrotliCustomDecompressLib/brotli

  # -Werror, not even once
  sed -e 's/ -Werror//g' -i BaseTools/Conf/*.template BaseTools/Source/C/Makefiles/*.makefile

  # copy seabios's CSM binary into place, so that it can be included in the binaries:
  cp -v /usr/share/qemu/bios-csm.bin OvmfPkg/Csm/Csm16/Csm16.bin
}

# TODO: check TPM_ENABLE/TPM2_ENABLE
build() {
  local _arch
  # shared targets for all
  local _common_args=(
    -b "$_build_type"
    -n "$(nproc)"
    -t "$_build_plugin"
  )
  # shared targets for all EFI binaries
  local _efi_args=(
    -D NETWORK_IP6_ENABLE
    -D TPM_CONFIG_ENABLE
    -D TPM1_ENABLE
    -D TPM2_ENABLE
  )
  # shared targets x86_64 and i686
  local _x86_args=(
    -D FD_SIZE_2MB
    -D HTTP_BOOT_ENABLE
    -D TLS_ENABLE
  )
  # 4MB FD size variant
  local _4mb_args=(
    -D FD_SIZE_4MB
    -D FD_SIZE_IN_KB=4096
    -D HTTP_BOOT_ENABLE
    -D TLS_ENABLE
  )

  cd $pkgbase-$pkgbase-stable$pkgver
  export GCC5_IA32_PREFIX="x86_64-linux-gnu-"
  export GCC5_X64_PREFIX="x86_64-linux-gnu-"
  export GCC5_AARCH64_PREFIX="aarch64-linux-gnu-"
  echo "Building base tools (AARCH64)"
  ARCH=AARCH64 make -C BaseTools
  echo "Building base tools"
  make -C BaseTools
  . edksetup.sh

  for _arch in ${_arch_list[@]}; do
    # shell
    echo "Building shell ($_arch)."
    BaseTools/BinWrappers/PosixLike/build -p ShellPkg/ShellPkg.dsc -a "$_arch" "${_common_args[@]}"
    # ovmf
    if [[ "$_arch" == IA32 ]]; then
      echo "Building ovmf ($_arch) with secure boot support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D EXCLUDE_SHELL_FROM_FD \
                       -D LOAD_X64_ON_IA32_ENABLE \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE
      mv -v Build/Ovmf{Ia32,IA32-secure}
      echo "Building ovmf ($_arch) with secure boot support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D EXCLUDE_SHELL_FROM_FD \
                       -D LOAD_X64_ON_IA32_ENABLE \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE
      mv -v Build/Ovmf{Ia32,IA32-secure-4mb}
      echo "Building ovmf ($_arch) with CSM support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "${_arch}" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D CSM_ENABLE \
                       -D LOAD_X64_ON_IA32_ENABLE
      mv -v Build/Ovmf{Ia32,IA32-csm}
      echo "Building ovmf ($_arch) with CSM support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "${_arch}" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D CSM_ENABLE \
                       -D LOAD_X64_ON_IA32_ENABLE
      mv -v Build/Ovmf{Ia32,IA32-csm-4mb}
      echo "Building ovmf ($_arch) default"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D LOAD_X64_ON_IA32_ENABLE
      mv -v Build/Ovmf{Ia32,IA32}
      echo "Building ovmf ($_arch) default (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D LOAD_X64_ON_IA32_ENABLE
      mv -v Build/Ovmf{Ia32,IA32-4mb}
    fi
    if [[ "$_arch" == X64 ]]; then
      echo "Building ovmf ($_arch) with microvm support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/Microvm/Microvm$_arch.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}"
      mv -v Build/MicrovmX64{,-4mb}
      echo "Building ovmf ($_arch) with microvm support"
      OvmfPkg/build.sh -p OvmfPkg/Microvm/Microvm$_arch.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}"
      echo "Building ovmf ($_arch) with secure boot support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32X64.dsc \
                       -a IA32 -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE \
                       -D EXCLUDE_SHELL_FROM_FD
      mv -v Build/Ovmf3264{,-secure}
      echo "Building ovmf ($_arch) with secure boot support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkgIa32X64.dsc \
                       -a IA32 -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D SECURE_BOOT_ENABLE \
                       -D SMM_REQUIRE \
                       -D EXCLUDE_SHELL_FROM_FD
      mv -v Build/Ovmf3264{,-secure-4mb}
      echo "Building ovmf ($_arch) with CSM support"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkg$_arch.dsc \
                       -a "${_arch}" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}" \
                       -D CSM_ENABLE
      mv -v Build/OvmfX64{,-csm}
      echo "Building ovmf ($_arch) with CSM support (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkg$_arch.dsc \
                       -a "${_arch}" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}" \
                       -D CSM_ENABLE
      mv -v Build/OvmfX64{,-csm-4mb}
      echo "Building ovmf (${_arch}) without secure boot (4MB FD)"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkg$_arch.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_4mb_args[@]}"
      mv -v Build/OvmfX64{,-4mb}
      echo "Building ovmf (${_arch}) without secure boot"
      OvmfPkg/build.sh -p OvmfPkg/OvmfPkg$_arch.dsc \
                       -a "$_arch" \
                       "${_common_args[@]}" \
                       "${_efi_args[@]}" \
                       "${_x86_args[@]}"
    fi
    if [[ "$_arch" == AARCH64 ]]; then
      echo "Building ArmVirtPkg ($_arch) with secure boot"
      BaseTools/BinWrappers/PosixLike/build -p ArmVirtPkg/ArmVirtQemu.dsc \
                                            -a "$_arch" \
                                            "${_common_args[@]}" \
                                            "${_efi_args[@]}" \
                                            -D NETWORK_HTTP_BOOT_ENABLE \
                                            -D NETWORK_TLS_ENABLE \
                                            -D SECURE_BOOT_ENABLE
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd bs=1M count=64
      dd if=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_EFI.fd of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_CODE.fd conv=notrunc
      dd if=/dev/zero of=Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/QEMU_VARS.fd bs=1M count=64
    fi
  done
}

package_edk2-armvirt() {
  local _arch=AARCH64

  pkgdesc="Firmware for Virtual Machines (aarch64)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/ArmVirtPkg"

  cd $pkgbase-$pkgbase-stable$pkgver
  install -vDm 644 Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/FV/*.fd -t "$pkgdir/usr/share/$pkgname/${_arch,,}/"
  # add libvirt compatibility (which hardcodes the following paths)
  install -vdm 755 "$pkgdir/usr/share/AAVMF"
  ln -svf /usr/share/$pkgname/${_arch,,}/QEMU_CODE.fd "$pkgdir/usr/share/AAVMF/AAVMF_CODE.fd"
  ln -svf /usr/share/$pkgname/${_arch,,}/QEMU_VARS.fd "$pkgdir/usr/share/AAVMF/AAVMF_VARS.fd"
  # install qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  install -vDm 644 ../*$pkgname*.json -t "$pkgdir/usr/share/qemu/firmware/"
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_edk2-shell() {
  local _arch
  # minimal UEFI shell, as defined in ShellPkg/Application/Shell/ShellPkg.inf
  local _min='7C04A583-9E3E-4f1c-AD65-E05268D0B4D1'
  # full UEFI shell, as defined in ShellPkg/ShellPkg.dsc
  local _full='EA4BB293-2D7F-4456-A681-1F22F42CD0BC'

  pkgdesc="EDK2 UEFI Shell"
  provides=(uefi-shell)

  cd $pkgbase-$pkgbase-stable$pkgver
  for _arch in ${_arch_list[@]}; do
    if [[ "${_arch}" == 'AARCH64' ]]; then
      install -vDm 644 Build/ArmVirtQemu-$_arch/${_build_type}_${_build_plugin}/$_arch/Shell.efi -t "$pkgdir/usr/share/$pkgname/${_arch,,}/"
    else
      install -vDm 644 Build/Shell/${_build_type}_${_build_plugin}/$_arch/Shell_$_min.efi "$pkgdir/usr/share/$pkgname/${_arch,,}/Shell.efi"
      install -vDm 644 Build/Shell/${_build_type}_${_build_plugin}/$_arch/Shell_$_full.efi "$pkgdir/usr/share/$pkgname/${_arch,,}/Shell_Full.efi"
    fi
  done
  # license
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  # docs
  install -vDm 644 {ReadMe.rst,Maintainers.txt} -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_edk2-ovmf() {
  local _arch

  pkgdesc="Firmware for Virtual Machines (x86_64, i686)"
  url="https://github.com/tianocore/tianocore.github.io/wiki/OVMF"
  license+=(MIT)
  provides=(ovmf)
  conflicts=(ovmf)
  replaces=(ovmf)
  install=$pkgname.install

  cd $pkgbase-$pkgbase-stable$pkgver
  # installing the various firmwares
  for _arch in ${_arch_list[@]}; do
    if [[ "$_arch" == AARCH64 ]]; then
      continue
    else
      # installing OVMF.fd for xen: https://bugs.archlinux.org/task/58635
      install -vDm 644 Build/Ovmf$_arch/${_build_type}_${_build_plugin}/FV/OVMF.fd -t "$pkgdir/usr/share/$pkgname/${_arch,,}/"
      install -vDm 644 Build/Ovmf$_arch/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd -t "$pkgdir/usr/share/$pkgname/${_arch,,}/"
      install -vDm 644 Build/Ovmf$_arch/${_build_type}_${_build_plugin}/FV/OVMF_VARS.fd -t "$pkgdir/usr/share/$pkgname/${_arch,,}/"
      install -vDm 644 Build/Ovmf$_arch-4mb/${_build_type}_${_build_plugin}/FV/OVMF.fd -t "$pkgdir/usr/share/${pkgname}-4m/${_arch,,}/"
      install -vDm 644 Build/Ovmf$_arch-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd -t "$pkgdir/usr/share/${pkgname}-4m/${_arch,,}/"
      install -vDm 644 Build/Ovmf$_arch-4mb/${_build_type}_${_build_plugin}/FV/OVMF_VARS.fd -t "$pkgdir/usr/share/${pkgname}-4m/${_arch,,}/"
      install -vDm 644 Build/Ovmf$_arch-csm/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgname/${_arch,,}/OVMF_CODE.csm.fd"
      install -vDm 644 Build/Ovmf$_arch-csm-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/${pkgname}-4m/${_arch,,}/OVMF_CODE.csm.fd"
      if [[ "${_arch}" == 'X64' ]]; then
        install -vDm 644 Build/Ovmf3264-secure/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgname/${_arch,,}/OVMF_CODE.secboot.fd"
        install -vDm 644 Build/Ovmf3264-secure-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/${pkgname}-4m/${_arch,,}/OVMF_CODE.secboot.fd"
        install -vDm 644 Build/MicrovmX64/${_build_type}_${_build_plugin}/FV/MICROVM.fd -t "$pkgdir/usr/share/$pkgname/${_arch,,}/"
        install -vDm 644 Build/MicrovmX64-4mb/${_build_type}_${_build_plugin}/FV/MICROVM.fd -t "$pkgdir/usr/share/${pkgname}-4m/${_arch,,}/"
      else
        install -vDm 644 Build/Ovmf$_arch-secure/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/$pkgname/${_arch,,}/OVMF_CODE.secboot.fd"
        install -vDm 644 Build/Ovmf$_arch-secure-4mb/${_build_type}_${_build_plugin}/FV/OVMF_CODE.fd "$pkgdir/usr/share/${pkgname}-4m/${_arch,,}/OVMF_CODE.secboot.fd"
      fi
    fi
  done
  # installing qemu descriptors in accordance with qemu:
  # https://git.qemu.org/?p=qemu.git;a=tree;f=pc-bios/descriptors
  # https://bugs.archlinux.org/task/64206
  install -vDm 644 ../*$pkgname*.json -t "$pkgdir/usr/share/qemu/firmware/"
  # adding symlink for previous ovmf location
  # https://bugs.archlinux.org/task/66528
  ln -svf /usr/share/$pkgname "$pkgdir/usr/share/ovmf"
  # adding a symlink for applications with questionable heuristics (such as lxd)
  ln -svf /usr/share/$pkgname "$pkgdir/usr/share/OVMF"
  # licenses
  install -vDm 644 License.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 OvmfPkg/License.txt "$pkgdir/usr/share/licenses/$pkgname/OvmfPkg.License.txt"
  # docs
  install -vDm 644 {OvmfPkg/README,ReadMe.rst,Maintainers.txt} -t "$pkgdir/usr/share/doc/$pkgname/"
}
