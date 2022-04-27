# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=rhino
pkgname=('java-rhino' 'rhino' 'rhino-javadoc')
pkgver=1.7.14
_pkgver=${pkgver//\./_}
pkgrel=1
arch=('any')
url="https://www.mozilla.org/rhino/"
license=('MPL')
source=(https://github.com/mozilla/${pkgbase}/releases/download/Rhino${_pkgver}_Release/${pkgbase}-${pkgver}.zip
        https://github.com/mozilla/${pkgbase}/archive/Rhino${_pkgver}_Release.tar.gz
        rhino
        rhino-debugger
        rhino-debugger.1
        rhino-idswitch
        rhino-jsc
        rhino-jsc.1)

sha512sums=('c58a70eb87988cac96ad9d1435cdf80942e496b8ab0527d7ca97cdcb97371410f34f3f8dc13669432ca0cd511fdf70405e1583fe41f2b993bb5968bde8c39154'
            'f20e8a8f7c78c88d815c53f89f3f18a53c2e86d92a284cd275aa5556c08962d2905f2d4fc829e5cb61d416cd55b13323d9a110f4f492f588a149b4d2105b21a1'
            '128768843b40860160aa95fe925e23959c8dc46ccbe8a623d4ccdadf8ab4304bb96dded9952d0654bb90600a9b325e46827cc528d6725c25b0eaf7b2fc6207f4'
            '909598e2c289530d1de2b47f383fe6a73f40cea2c22ecf30b9fd94ab446ad0e9e9ae11e04ca77eb65ccf4a5a376f2e023aa154450f5f8db187bd196bad542355'
            'a3723c082b9876fb945fcb14d4826970f83acfefedb43e4571dad1180b6adbed8de273503239a1908e9a79a77de15c49f30c880c92a39ba9764a6859c8d1d571'
            '7d123bf1a0e9b806d11a4fa6912e76fd8ed7284c5085b19eef5ce41d79475028523d53b503a710088e3a3f8263e021a0c6cc5501aa9d47a69b1685ba6550f014'
            'a85fd1b0a20567120c7d7e4c426cc1173526e4e2b153dd4434bdf1b2fe6d10a549db5e7cf7a09d1adeefda83d7f09a610b8a287ba8c886290d8e9db8e8e0e5de'
            'ea68463de5dc05503e68c548a8c4bd18bba1b132b52f78fe4b0e0ddd3b1ff9a0147a27196781522bb69cd613a7288ec6cdbfc9435de86fc6af99c92f90fca78b')

package_java-rhino() {
  pkgdesc="Open-source implementation of JavaScript written entirely in Java - JAR"
  depends=('java-runtime-headless')

  install -Dm644 \
    ${pkgbase}${pkgver}/lib/${pkgbase}-${pkgver}.jar \
    "${pkgdir}"/usr/share/java/js-${pkgver}.jar
  ln -s js-${pkgver}.jar "${pkgdir}"/usr/share/java/js.jar
}

package_rhino() {
  pkgdesc="Open-source implementation of JavaScript written entirely in Java"
  depends=('java-rhino' 'java-jline')

  install -dm755 "${pkgdir}"/usr/bin
  install -m755 \
    rhino rhino-debugger rhino-jsc rhino-idswitch \
    "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/man/man1
  install -m755 \
    ${pkgbase}-Rhino${_pkgver}_Release/man/rhino.1 \
    rhino-debugger.1 \
    rhino-jsc.1 \
    "${pkgdir}"/usr/share/man/man1/
}

package_rhino-javadoc() {
  pkgdesc="Open-source implementation of JavaScript written entirely in Java - Javadoc"

  install -m755 -d "${pkgdir}"/usr/share/${pkgbase}
  cp -r ${pkgbase}${pkgver}/docs "${pkgdir}"/usr/share/${pkgbase}
}
