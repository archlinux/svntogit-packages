# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=audacious-plugins
pkgver=1.5.0
pkgrel=1
pkgdesc="Plugins for the audacious media player."
arch=('i686' 'x86_64')
url="http://audacious-media-player.org/"
license=('GPL3')
depends=('audacious>=1.5.0' 'lame' 'libmcs' 'gtk2' 'libxml2' 'libvorbis' \
         'libsidplay' 'libsndfile' 'libmpcdec>=1.2.5' 'taglib' 'flac>=1.1.4' \
         'libmad' 'libxcomposite' 'libmowgli' 'dbus-glib' 'libcdio')
# Makedepends: first two lines are for optdepends - they need to be present at build to be enabled
makedepends=('jack-audio-connection-kit' 'curl>=7.16.2' 'musicbrainz' 'lirc-utils' \
             'libmodplug' 'projectm' 'sdl' 'neon' 'wavpack' 'fluidsynth' \
             'pkgconfig')
optdepends=('jack-audio-connection-kit: Jack output' \
            'curl>=7.16.2: Audioscrobbler plugin' \
            'musicbrainz: Audioscrobbler plugin' \
            'lirc-utils: Infra-red support' \
            'libmodplug: Modplug plugin' \
            'projectm: Projectm visualization plugin' \
            'sdl: Paranormal visualization plugin' \
            'neon: HTTP and Web-stream playback' \
            'wavpack: Wavpack input' \
            'fluidsynth: Fluidsynth amidi-plug backend' \
            )
install=audacious-plugins.install
source=(http://distfiles.atheme.org/$pkgname-$pkgver.tgz)
md5sums=('42c82ffffd57aca612141bc106b9f51e')
options=('!libtool')

build() {

  # NOTE TO ANYONE BUILDING THIS PKG!
  # 
  # Audacious and Audacious-plugins must both be built with
  # the same CFLAGS and CXXFLAGS.  
  # If ever strange, unexplainable playlist corruption happens, this
  # is likely the cause - make sure both packages were built with
  # the same flags and same version of GCC.

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --disable-esd --enable-jack \
              --disable-timidity --enable-amidiplug \
              --enable-chardet --enable-modplug \
	      --enable-wavpack \
	      --enable-fluidsynth \
              --enable-sid --disable-sse2

  make || return 1
  make DESTDIR=${startdir}/pkg install
} 

