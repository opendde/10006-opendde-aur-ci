# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=sonic-pi
pkgver=3.0.1
pkgrel=1
pkgdesc="A music-centric programming environment, originally built for the raspberry pi."
arch=('i686' 'x86_64')
url="http://sonic-pi.net/"
license=('MIT')
depends=('lua' 'ruby' 'qscintilla-qt5' 'jack' 'supercollider' 'qwt' 'boost' 'erlang-nox' 'aubio' 'libffi')
makedepends=('cmake' 'qt5-tools' 'sed')
optdepends=('qjackctl: for graphical jackd spawning/configuration'
            'jack2: better jackd if you want to use without gui'
            'supercollider-with-plugins: includes sc3-plugins e.g. piano synth')
source=("https://github.com/samaaron/${pkgname}/archive/v${pkgver}.tar.gz" "${pkgname}.png" "${pkgname}.desktop"
        "${pkgname}")
md5sums=('538a3bff5a6f015242fd2a51d13e395a'
         'e3ca8a1d949baf35cdf438c8d10159ff'
         '19a64d717674f75918c176197650b44a'
         'a051b9e7d0499b1bf619726668021809')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/lqt5scintilla2/lqscintilla2_qt5/g' "app/gui/qt/SonicPi.pro"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/app/gui/qt"
    ../../server/bin/compile-extensions.rb
    ../../server/bin/i18n-tool.rb -t
    cp -f ruby_help.tmpl ruby_help.h
    ../../server/bin/qt-doc.rb -o ruby_help.h
    lrelease SonicPi.pro 
    qmake-qt5 SonicPi.pro 
    make
    find ../.. -type f -name "*.o" -delete
}

package() {
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt"
    mv "${pkgdir}/opt/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    install -d "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps"

    install -d "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}
