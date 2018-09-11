# Maintainer: damir <damir@archlinux.org>

pkgname=dvd+rw-tools
pkgver=7.1
pkgrel=8
pkgdesc="dvd burning tools"
arch=('x86_64')
license=('GPL')
url="http://fy.chalmers.se/~appro/linux/DVD+RW"
depends=('cdrkit' 'gcc-libs')
source=("http://fy.chalmers.se/~appro/linux/DVD+RW/tools/${pkgname}-${pkgver}.tar.gz"
        'dvd+rw-tools-7.0-dvddl.patch'
        'dvd+rw-tools-7.0-glibc2.6.90.patch'
        'dvd+rw-tools-7.0-wctomb.patch'
        'dvd+rw-tools-7.0-wexit.patch'
	'dvd+rw-tools-7.1-layerbreaksetup.patch')
sha512sums=('938f9ec5597158af275c7bf63002696ba362f6f22a219108c6a1df28792f0485046a7af5ce57e41695aaaa0d69543bd66cbbeb4415df5c0e0a902a3f1d278a31'
            'b1ea9a68a47e41742afc3a35bef6bcb405cea3d9696dac0437f26d9a143b8ca11b8fc459d70d9a289f3bcd49902d2df785f91f6b7f8c997dff6c8ca534a8d608'
            'a6e0b3df85ec6c28ae13b1f3e67bd26a4c35588f37493e0cb65d0b3f382b05207e421ea1f3cd92432237c2b7479d71c44ed639155cea3b52ccae741c78c3c2a4'
            'e52457b9b2faef14ab6b1bdf104c58ec8b6e51501c7ad2bc59d02d59a0ed82ae15b9df89c4a28a4b922f21c72cfa416b950fdfdfadce95b9326334b9ece25033'
            'd98a66ea2e08b14683377c3aff491fb2ee6cd2742e42191c1f7d47fe3474c2ce5f940ba82bce46e557886adbb1fd94431531f7aa73a572a7d41ee227428576fd'
            'f2dadf57da0b83a9ab83b02127b267fc29e599a479d48b5cd6d83e7ae7d07957d1880c565c0a252e6a9b1ab4ad8c66ef1584ebc0e3922d3836dc3e53df9df41f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # patches from Gentoo/Fedora
  # see https://bugs.gentoo.org/257360, https://bugzilla.redhat.com/show_bug.cgi?id=426068
  # and https://bugzilla.redhat.com/show_bug.cgi?id=243036
  patch -p0 -i "${srcdir}/dvd+rw-tools-7.0-dvddl.patch"
  patch -p1 -i "${srcdir}/dvd+rw-tools-7.0-glibc2.6.90.patch"
  patch -p0 -i "${srcdir}/dvd+rw-tools-7.0-wctomb.patch"
  patch -p1 -i "${srcdir}/dvd+rw-tools-7.0-wexit.patch"
  patch -p1 -i "${srcdir}/dvd+rw-tools-7.1-layerbreaksetup.patch"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/man/man1"

  install -m755 growisofs dvd+rw-booktype dvd+rw-format dvd+rw-mediainfo dvd-ram-control "${pkgdir}/usr/bin/"
  install -m644 growisofs.1 ${pkgdir}/usr/share/man/man1/growisofs.1
}
