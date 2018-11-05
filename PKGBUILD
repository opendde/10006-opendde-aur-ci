# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=logitechmediaserver-git
pkgver=20181105.e5c860d
_gitver=7.9
pkgrel=1
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Git-Version, if you prefer stability consider using logitechmediaserver instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/stefansielaff/slimserver'
license=('GPL' 'custom')
provides=('logitechmediaserver')
depends=('perl>=5.26'
	 'perl-anyevent'
	 'perl-archive-zip'
	 'perl-cgi'
	 'perl-common-sense'
	 'perl-data-dump'
	 'perl-dbd-sqlite'
	 'perl-dbi'
	 'perl-digest-sha1'
	 'perl-ev'
	 'perl-html-form'
	 'perl-html-parser'
	 'perl-html-tree'
	 'perl-http-cookies'
	 'perl-http-daemon'
	 'perl-http-date'
	 'perl-http-message'
	 'perl-json-xs'
	 'perl-log-log4perl'
	 'perl-lwp-mediatypes'
	 'perl-lwp-protocol-https'
	 'perl-module-build'
	 'perl-net-ipv4addr'
	 'perl-path-class'
	 'perl-soap-lite'
	 'perl-readonly'
	 'perl-sub-name'
	 'perl-sub-uplevel'
	 'perl-template-toolkit'
	 'perl-test-nowarnings'
	 'perl-test-warn'
	 'perl-text-glob'
	 'perl-uri'
	 'perl-xml-parser'
	 'perl-xml-simple'
	 'perl-yaml-libyaml'
	 'ffmpeg' 'giflib' 'libexif' 'libjpeg-turbo' 'libpng')
makedepends=('git' 'yasm' 'rsync' 'gd' 'zlib')
optdepends=('perl-io-socket-ssl: support for https streams')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
install=install
source=("slimserver.tar.gz::${url}/archive/public/${_gitver}.tar.gz"
        "slimserver-vendor.tar.gz::${url}-vendor/archive/public/${_gitver}.tar.gz"
        'service')
sha256sums=('aa511c7cc6cb55aaac5c7c5645200b860f625f0dfa3f95b6a3a403f1b3dc0573'
            '2b7ae498284c970405bf053501e4a7308aa7890d84b2ca29c0b84b6a3a7692c6'
            'f5c64f2a066914dbab9a1dd4a8ec33895645a72bde3bdbeb83c49e4624a997cb')

prepare() {
	cd "${srcdir}/slimserver-public-${_gitver}"
	case $CARCH in
	    x86_64) rm -rf Bin/{arm,armhf,aarch64}-linux ;;
	    i686) rm -rf Bin/{arm,armhf,aarch64}-linux ;;
	    aarch64) rm -rf Bin/{i386,x86_64,arm,armhf}-linux ;;
	    arm*) rm -rf Bin/{i386,x86_64,aarch64}-linux ;;
	esac
	cd "${srcdir}/slimserver-public-${_gitver}/CPAN"
	mkdir _PRESERVE
	cp -p --parents URI/Find.pm _PRESERVE
	cp -pr --parents Net/UPnP* _PRESERVE
	rm -f {AE.pm,AnyEvent.pm,CGI.pm,DBI.pm,Error.pm,EV.pm,JSON/XS.pm,LWP.pm,Readonly.pm,Template.pm,Text/Glob.pm,URI.pm,version.pm}
	rm -rf {AnyEvent,Archive,CGI,common,DBI,DBD,Digest,EV,HTML,HTTP,I18N,Mac,Log,LWP,Net,Path,SOAP,Sub,Template,Test,URI,version,XML,YAML}
	cp -rf _PRESERVE/* .
	rm -rf _PRESERVE
}

build() {
	cd "${srcdir}/slimserver-vendor-public-${_gitver}/CPAN"
	sh buildme.sh -t
}

package() {
        cd "${srcdir}"
        install -Dm644 service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        cd "${srcdir}/slimserver-public-${_gitver}"
        install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cp -a * "${pkgdir}/opt/${pkgname}"
        cd "${srcdir}/slimserver-vendor-public-${_gitver}"
        cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
	printf "ARCH-AUR-GIT.%s\n%s" "${pkgver}" "$(date)" > "${pkgdir}/opt/${pkgname}/revision.txt"
}

pkgver() {
    printf "%s.%s" "$(date +%Y%m%d)" "$(git ls-remote ${url} HEAD | cut -c 1-7)"
}
