# Maintainer: xgdgsc <xgdgsc at gmail dot com>
pkgname=feeluown
_pkgname=FeelUOwn
pkgver=6.0a2
pkgrel=1
pkgdesc="个性化音乐服务 For Mac And Linux"
arch=("any")
url="https://github.com/cosven/FeelUOwn"
license=('GPL3')
depends=('python-pyqt5' 'qt5-webkit' 'python-xlib' 'qt5-multimedia' 'python-requests' 'python-quamash' 'xdg-utils' 'python-sqlalchemy')
optdepends=('vlc')
provides=("feeluown")
conflicts=("feeluown")
source=("https://github.com/cosven/FeelUOwn/archive/v$pkgver.tar.gz")
md5sums=('3554d20731f8a5500d72254443706d91')
_desktop="${_pkgname}.desktop"

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    cat > ${_desktop} << EOF
[Desktop Entry]
Type=Application
Name=FeelUOwn
Comment=FeelUOwn Launcher
Exec=${_pkgname}
Icon=/usr/share/${pkgname}/icons/FeelUOwn.png
Categories=AudioVideo;Audio;Player;Qt;
Terminal=false
StartupNotify=true
EOF

    cat > "${_pkgname}.sh" << EOF
#!/usr/bin/env sh
DATA_PATH="\${HOME}/.${_pkgname}"
if [ ! -d \${DATA_PATH} ]; then
    mkdir -p \${DATA_PATH}
fi
python /usr/share/${pkgname}/src/main.py
EOF

    # save login data to ~/.FeelUOwn
    cd "$srcdir/$_pkgname-$pkgver/src"
    sed -i '2 i import os' constants.py
    sed -i 's!^DATA_PATH.*$!DATA_PATH = os.path.join(os.path.expanduser("~"), ".FeelUOwn/")!g' constants.py
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    find ./{src,icons} -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/${pkgname}/{}" \;

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
