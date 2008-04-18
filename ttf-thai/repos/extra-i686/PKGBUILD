# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=ttf-thai
origname=thai-ttf
provides=("${origname}")
pkgver=0.4.9
pkgrel=1
pkgdesc="A collection of basic Thai fonts"
arch=("i686" "x86_64")
# according to http://linux.thai.net/projects/thaifonts-scalable
# license=("This package collects Thai scalable fonts available in free licenses.")
# however what licences these are, i have to ask them.
url="http://linux.thai.net/taxonomy/term/3"
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
# extremely slow server! takes hours to get this tar.gz file
source=("ftp://linux.thai.net/pub/ThaiLinux/software/thai-ttf/${origname}-${pkgver}.tar.gz")
install=ttf.install

build() {
  cd ${startdir}/src/${origname}-${pkgver}

  # install fonts to right place
  mkdir -p ${startdir}/pkg/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/

  # install specification for fonts to right place
  mkdir -p ${startdir}/pkg/etc/fonts/conf.avail/
  install -m644 etc/fonts/conf.avail/65-ttf-thai-tlwg.conf ${startdir}/pkg/etc/fonts/conf.avail/
  install -m644 etc/fonts/conf.avail/90-ttf-thai-tlwg-synthetic.conf ${startdir}/pkg/etc/fonts/conf.avail/
}

md5sums=('4b768583c37d4c824eb2242346abcd30')
