# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=tcdr
pkgver=2.1
pkgrel=4
url="http://tcdr.sourceforge.net/"
pkgdesc="TCDR is a dialog-based console frontend for mkisofs, cdrecord, cdrdao, mkzftree, cdparanoia, cdda2wav, bladeenc, lame, oggenc, ogg123, mpg123, and sox written in bash."

depends=('cdtool' 'cdrtools' 'cdrdao' 'cdparanoia' 'lame' 'dialog' 'eject' 'lsof' 'libogg' 'sox' 'bash')

source=(http://easynews.dl.sourceforge.net/sourceforge/tcdr/$pkgname-$pkgver.tar.gz)

build() {
  mkdir -p $startdir/pkg/usr/bin/ \
             $startdir/pkg/etc/ \
           $startdir/pkg/usr/man/man1/ \
           $startdir/pkg/usr/share/doc/tcdr\_${pkgver}/

  cd $startdir/src/tcdr_$pkgver

  cp ./tcdr                 $startdir/pkg/usr/bin/tcdr
  cp ./tcdrrc                 $startdir/pkg/etc/tcdrrc
  cp ./tcdr.1.gz         $startdir/pkg/usr/man/man1/tcdr.1.gz

  # the next things are stripped out anyway, but here they are:
  cp ./manual.html.gz         $startdir/pkg/usr/share/doc/tcdr\_${pkgver}/manual.html.gz
  cp ./Changelog.gz         $startdir/pkg/usr/share/doc/tcdr\_${pkgver}/Changelog.gz
  cp ./GNU_GPL.gz         $startdir/pkg/usr/share/doc/tcdr\_${pkgver}/GNU_GPL.gz
  cp ./README.gz         $startdir/pkg/usr/share/doc/tcdr\_${pkgver}/README.gz
  cp ./tcdr.png         $startdir/pkg/usr/share/doc/tcdr\_${pkgver}/tcdr.png

}
