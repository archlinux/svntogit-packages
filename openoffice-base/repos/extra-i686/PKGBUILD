# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Hussam Al-Tayeb <ht990332@gmail.com>

pkgname=openoffice-base
pkgver=2.4.0
pkgrel=2 # =RC6(identical)
pkgdesc="OpenOffice.org - a free multiplatform and multilingual office suite"
arch=('i686' 'x86_64')
_OO_milestone=ooh680-m12
#_OO_milestone=OOH680_m12
license=('LGPL')
url="http://www.openoffice.org"
install=openoffice.install
depends=('ttf-dejavu' 'curl' 'desktop-file-utils' 'fontconfig>=2.5' 'gtk2>=2.12.7'
         'hunspell>=1.2.2-2' 'perl' 'python>=2.5.1' 'libwpd' 'libsndfile'
         'startup-notification>=0.9' 'xalan-java' 'libxaw' 'libcups' 'hsqldb-java'
         'neon>=0.27.2' 'dbus-glib' 'nss' 'pstoedit')
	# 'xmlsec' - broken 
	# "icu>=3.8" broken
# for gnu java/ecj
makedepends=('bison' 'cvs' 'curl' 'findutils' 'flex' 'gawk' 'gcc-libs' 'kdelibs' 
             'libart-lgpl' 'pam' 'sane' 'zip' 'perl-archive-zip' 'pkgconfig'  'unzip'
              'xulrunner>=1.8.1.11' 'java-gcj-compat' 'apache-ant' 'cairo' 'autoconf')
	# 'boost' - we use internal one. jfreereport is broken with system-boost/has no effect on size
# for SUN Java
#makedepends=('boost' 'bison' 'ccache' 'cvs' 'curl' 'findutils'
#             'flex' 'gawk' 'gcc-libs' 'kdelibs' 'libart-lgpl' 'pam' 'sane' 'zip'
#             'perl-archive-zip' 'pkgconfig' 'unzip' 'xulrunner>=1.8.1.3'
#             'jdk' 'apache-ant' 'cairo')

#MIRROR="ftp://ftp.gwdg.de/pub/openoffice/" # has all late but is fast
#MIRROR=http://ftp.rz.tu-bs.de/pub/mirror/OpenOffice.org/
#MIRROR=ftp://ftp-1.gwdg.de/pub/openoffice/developer
#MIRROR=ftp://ftp.linux.cz/pub/localization/OpenOffice.org/
#MIRROR=http://go-oo.org/packages/SRC680/
MIRROR=http://download.go-oo.org/OOH680/

source=(#$MIRROR/stable/${pkgver}/OOo_${pkgver}_src_{core,binfilter,system}.tar.bz2
	#$MIRROR/OOH680/OOo-Dev_${pkgver}_src_{core,binfilter,system}.tar.bz2
	#$MIRROR/contrib/rc/${pkgver}/OOo_${pkgver}_${_OO_milestone}_src_{core,binfilter}.tar.bz2
	#$MIRROR/contrib/rc/${pkgver}/OOo_${_OO_milestone}_src_{core,binfilter}.tar.bz2
	#$MIRROR/contrib/rc/2.2.0rc3/OOo_${pkgver}rc3_src_{core,binfilter}.tar.bz2
	#$MIRROR/contrib/rc/2.2.0rc4/OOo_${pkgver}rc4_${_OO_milestone}_src_{core,binfilter}.tar.bz2
	#$MIRROR/stable/${pkgver}/OOo_${pkgver}_src_{core,binfilter}.tar.bz2
	#$MIRROR/devel/build/Sources/OOo_${pkgver}_src_{core,binfilter}.tar.bz2
	#$MIRROR/SRC680_m223/OOo-Dev_SRC680_m224_src_{core,binfilter}.tar.bz2
	http://download.go-oo.org/OOH680/${_OO_milestone}-{core,binfilter,system}.tar.bz2
	#$MIRROR/OOH680_m6/OOo-Dev_${_OO_milestone}_src_{core,binfilter,system}.tar.bz2
	template.desktop
	default-no-startup-wizard.diff
	default-system-fpicker.diff
	jvmfwk-gij-paths.diff
	fix-font-hinting.diff
	gui-insensitive.diff
	libxmlsec-system-nss.diff
	libxmlsec-findcerts.diff
	soffice-detect-mozilla-certificates.diff
	gtkunixprintdialog.diff
	soffice.diff
	gcc43.diff
	#http://oooconv.free.fr/fontooo/FontOOo.sxw
	FontOOo_1.7.1.sxw # from http://www.openoffice.org/issues/show_bug.cgi?id=81102
	awt_x86_64.diff) # only for Sun builds needed
options=('!distcc' 'ccache' '!emptydirs')
md5sums=('b676821a9f137b1401d6a591ebcb01e0'
         'f3568308373429aff9ebfc72a2dfcc28'
         '09fcd5a0bb64da783ff71666abf1194b'
         'a728dcd463c1aa7ca5db75146377a0d1'
         '0faab33566196ddc9c405d68cf614663'
         '39e4c1b1e864b22ee4650b2bff44c695'
         '8980e21cef021d050ab1d4a13c85eb08'
         'e5ab0c8dec93a5245d42dc7de0490b66'
         '4c76c07e867d51c416ea258220a90a6a'
         '28f37939e38d22bb3feaac8d17215673'
         'a8b96e9d0ce92a8f6690f277b1cfacc9'
         '1dc7480a04f572ad136d35923a2af66d'
         '076d59389390afe6f1cd91a4f5cbab23'
         '44174ef4e71ba835fcd2a59733213cc9'
         '52c9d2cd8465c3c58103310e381c9060'
         '1fc1ca5205730655eab2d2e119aa06fe'
         '83bb5e235c4e4062eed404829d760c14')

# see ftp://ftp.linux.cz/pub/localization/OpenOffice.org/devel/build/build for upstream build instructions

build() {
	# just to make sure that it will detect the desired JDK/JVM - we want gcc-gcj/ecj
	unset J2REDIR; unset J2SDKDIR; unset JAVA_HOME; unset CLASSPATH
	[ -z "${JAVA_HOME}" ] && . /etc/profile.d/java-gcj-compat.sh
	JAVAHOME=${JAVA_HOME}
	[ -z "${QTDIR}" ] && . /etc/profile.d/qt3.sh
	[ -z "${KDEDIR}" ] && . /etc/profile.d/kde.sh
	[ -z "${MOZ_PLUGIN_PATH}" ] && . /etc/profile.d/mozilla-common.sh
#	[ -z "${JAVA_HOME}" ] && . /etc/profile.d/jdk.sh

	cd $startdir/src/${_OO_milestone}/

	# build fixes
	# gcj build fix to find our gcj libs paths
	patch -Np0 -i ../jvmfwk-gij-paths.diff || return 1
	# fix build with internal xmlsec
	patch -Np0 -i ../libxmlsec-system-nss.diff || return 1

	# gcc4.3 fixes
	patch -Np0 -i ../gcc43.diff || return 1

	# allows xmlsec to be able to read the format of the digital certificates.
	patch -Np0 -i ../libxmlsec-findcerts.diff || return 1
	# allows soffice to find the user's firefox profile so that it can read
	# his digital certificates. Nss stores digital certificates in your mozilla firefox profile. 
	patch -Np0 -i ../soffice-detect-mozilla-certificates.diff || return 1


	# important bugfixes
	# nothing right now :)

	# fix font hinting
	patch -Np0 -i ../fix-font-hinting.diff || return 1
	# this heavily improves the looks of disabled icons in OpenOffice toolbar. 
	patch -Np0 -i ../gui-insensitive.diff || return 1

	# remove the startup wizard
	patch -Np0 -i ../default-no-startup-wizard.diff || return 1
	# enables the default system-file-picker in case we have that built
	patch -Np0 -i ../default-system-fpicker.diff || return 1


	# add gtkprint dialog for gtk environment
	patch -Np0 -i ../gtkunixprintdialog.diff || return 1

	# arch related fixes & configure options
	if [ "$CARCH" = "i686" ]; then
	  EXTRAOPTS="--with-arch=x86 " # --without-stlport4  - still broken
	fi

	if [ "$CARCH" = "x86_64" ]; then
	  EXTRAOPTS="--with-arch=x86_64 "
          # fixes to build with SUN jdk/jre
          # http://qa.openoffice.org/issues/show_bug.cgi?id=74749
        #  sed -i "s:lib64\/libjpeg.so:lib\/libjpeg.so:g" $startdir/src/${_OO_milestone}/solenv/inc/libs.mk
          # http://qa.openoffice.org/issues/show_bug.cgi?id=74751
        #   patch -Np0 -i ../awt_x86_64.diff || return 1
	fi

	cd $startdir/src/${_OO_milestone}/config_office

	# Set OOO_VENDOR in build environment
	export OOO_VENDOR="ArchLinux"
	# export C(XX)FLAGS
	export ARCH_FLAGS="$CFLAGS"

	# Need to recreate the configure script because of patches
	autoconf || return 1

	./configure --with-build-version="${pkgver} ArchLinux build-${pkgrel} (${_OO_milestone})" \
	--prefix=/usr --exec-prefix=/usr\
	--with-binfilter\
	--disable-ldap\
	--with-lang="en-US"\
	--disable-gnome-vfs\
	--disable-mono\
	--disable-odk\
	--disable-qadevooo\
	--disable-systray\
	--disable-gpc\
	--enable-gtk\
	--enable-kde\
	--enable-cups\
	--enable-dbus\
	--enable-cairo\
	--enable-evolution2\
	--enable-crashdump\
	--enable-libsn\
	--enable-vba\
	--with-package-format=native\
	--with-system-db\
	--with-system-cairo\
	--with-system-curl\
	--with-system-expat\
	--with-system-fonts\
	--with-system-freetype\
	--with-system-hunspell\
	--with-system-jpeg\
	--with-system-libwpd\
	--with-system-libxml\
	--with-system-libxslt\
	--with-system-mozilla\
	--with-system-neon\
	--with-system-python\
	--with-system-sane-header\
	--with-system-sndfile\
	--with-system-stdlibs\
	--with-system-xrender-headers\
	--with-system-zlib\
	--without-fonts\
	--without-myspell-dicts\
	--without-nas\
	--without-docdir\
	--without-afms\
	--without-myspell-dicts\
	--with-jdk-home=${JAVA_HOME} \
	--with-java-home=${JAVA_HOME} \
 	--with-system-hsqldb\
	--with-hsqldb-jar=/usr/share/java/hsqldb.jar\
	--with-system-xerces\
	--with-xerces-jar=/usr/share/java/xercesImpl.jar\
	--with-system-xalan\
	--with-xalan-jar=/usr/share/java/xalan.jar\
	--with-system-xml-apis\
	--with-xml-apis-jar=/usr/share/java/xml-apis.jar\
	--with-serializer-jar=/usr/share/java/serializer.jar\
	--with-use-shell=bash\
	 $EXTRAOPTS || return 1

#	--with-system-xmlsec\ - digital signatures are broken with system xmlsec, so we use internal one
#	--with-system-icu\ - they expect a patched icu we don't have

	cd ..

	# Setup environment for build
	if [ "$CARCH" = "x86_64" ]; then
	  source LinuxX86-64Env.Set.sh
	 else source LinuxX86Env.Set.sh
	fi

	# Build dmake utility
	./bootstrap || return 1

	# to compile with SMP add -P2 or above, remove any -Px if your cou has only one core or if you want to fix it for non smp build
	cd instsetoo_native
	build.pl -P1 --all || return 1

	cd ..

	# install binaries
	if [ "$CARCH" = "x86_64" ]; then
	  cp -R instsetoo_native/unxlngx6.pro/OpenOffice/native/install/en-US/linux-2.6-x86_64/buildroot/* $startdir/pkg/
	 else 	cp -R instsetoo_native/unxlngi6.pro/OpenOffice/native/install/en-US/linux-2.6-intel/buildroot/* $startdir/pkg/
	fi

	cd $startdir/pkg/opt
	mv openoffice.org2.4 openoffice

	# prepare filesystem entries
	mkdir -p $startdir/pkg/usr/{bin,share/applications}
	mkdir -p $startdir/pkg/usr/share/icons/{HighContrast,hicolor,locolor}

	# make symlinks
	cd $startdir/pkg/usr/bin
	ln -s ../../opt/openoffice/program/soffice soffice
	ln -s ../../opt/openoffice/program/spadmin spadmin

	# install shortcuts
	cp $startdir/pkg/opt/openoffice/share/xdg/*.desktop  $startdir/pkg/usr/share/applications
	cd $startdir/pkg/usr/share/applications
	sed -i -e 's|Exec=openoffice.org2.4|Exec=/opt/openoffice/program/soffice|g' *.desktop
	sed -i -e 's|Exec=/opt/openoffice/program/soffice-printeradmin|Exec=/opt/openoffice/program/spadmin|g' printeradmin.desktop
	# fix exec commands in shortcuts for Xfce menu
	sed -i -e 's|base %U|base|g' base.desktop
	sed -i -e 's|calc %U|calc|g' calc.desktop
	sed -i -e 's|draw %U|draw|g' draw.desktop
	sed -i -e 's|impress %U|impress|g' impress.desktop
	sed -i -e 's|math %U|math|g' math.desktop
	sed -i -e 's|writer %U|writer|g' writer.desktop
	# remove quickstarter, we disabled it above
	rm -rf $startdir/pkg/usr/share/applications/qstart.desktop
	# fix icons in shortcuts
	sed -i -e 's|Icon=openofficeorg24-|Icon=|g' *.desktop
	# add template desktop file
	install -D -m644 $startdir/src/template.desktop $startdir/pkg/usr/share/applications/template.desktop

	# install icons
	cd $startdir/src/${_OO_milestone}/sysui/desktop/icons
	cp -a -v HighContrast/*x* $startdir/pkg/usr/share/icons/HighContrast
	cp -a -v hicolor/*x* $startdir/pkg/usr/share/icons/hicolor
	cp -a -v locolor/*x* $startdir/pkg/usr/share/icons/locolor

	# just in case icon calc is used by calculator :)
	find $startdir/pkg/usr/share/icons -type d -name apps -exec mv {}/calc.png  {}/ooocalc.png \;
	sed -i -e 's|Icon=calc|Icon=ooocalc|g' $startdir/pkg/usr/share/applications/calc.desktop

	# fix ownership and permissions
	chown root.root -R $startdir/pkg/
	chmod +rX -R $startdir/pkg/usr

	# some cleanup
	find $startdir/pkg/usr/share/icons -depth -name "CVS" -type d -exec rm -r {} \; > /dev/null 2>&1
	rm -f $startdir/pkg/opt/openoffice/program/oo_product.bmp
	touch $startdir/pkg/opt/openoffice/share/dict/ooo/.directory
	touch $startdir/pkg/opt/openoffice/presets/template/.directory
	touch $startdir/pkg/opt/openoffice/share/extension/install/.directory

	# remove unecessary temp files if they exist 
	rm -f  $startdir/pkg/opt/openoffice/program/root*.dat
	rm -f  $startdir/pkg/opt/openoffice/program/root*.dat.*

	# fix font wizard not installed by default (from http://qa.openoffice.org/issues/show_bug.cgi?id=81102)
	install -D -m644 $startdir/src/FontOOo_1.7.1.sxw $startdir/pkg/opt/openoffice/share/dict/ooo/FontOOo.sxw

	# add missing spell wizard
	install -D -m644 $startdir/src/${_OO_milestone}/dictionaries/diclst/DicOOo.sxw $startdir/pkg/opt/openoffice/share/dict/ooo/DicOOo.sxw

	# link the mozilla-plugin
	mkdir -p $startdir/pkg/usr/lib/mozilla/plugins/
	cd $startdir/pkg/usr/lib/mozilla/plugins/
	ln -v -s /opt/openoffice/program/libnpsoplugin.so .

	# fix soffice not starting without set environment
	cd $startdir/pkg/opt/openoffice/program/
	patch -Np0 -i $startdir/src/soffice.diff
}
