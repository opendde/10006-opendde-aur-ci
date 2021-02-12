# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=diamond-editor
pkgver=1.3.6
pkgrel=1
pkgdesc='Compact text editor designed for programmers (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('GPL2')
depends=('sh' 'copperspice' 'hunspell')
makedepends=('cmake')
source=("https://github.com/copperspice/diamond/archive/diamond-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-diamond-editor-do-not-copy-cs-libs.patch'
        'diamond-editor.desktop'
        'diamond-editor.sh')
sha256sums=('e1b85890a870236370207c5d6b7aa7d44d7414a090723ecea513f8b5cec4fb67'
            '5b569f2bba090f5a32e93da38ee4ab225882a5567f7d1f60ffdeb2aae5469e6d'
            'e114cad024aa5d6768bd50fabe51c311e37a4a7969382ace8c16878a06b824e4'
            '16f8c39d44c7dfcf9784a6b0414af4aa266a67de10e17bffb6fd5ea43a95e48a')

prepare() {
    patch -d "diamond-diamond-${pkgver}" -Np1 -i "${srcdir}/010-diamond-editor-do-not-copy-cs-libs.patch"
}

build() {
    cmake -B build -S "diamond-diamond-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/opt/diamond-editor' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir"{/opt/diamond-editor/{platforms,printerdrivers},/usr/share/pixmaps}
    install -D -m755 diamond-editor.sh "${pkgdir}/usr/bin/diamond-editor"
    install -D -m644 diamond-editor.desktop -t "${pkgdir}/usr/share/applications"
    ln -s ../../../opt/diamond-editor/diamond.png "${pkgdir}/usr/share/pixmaps/diamond-editor.png"
    
    local _dir
    local _file
    while read -r -d '' _file
    do
        if [[ "${_file##*/}" =~ ^CsGui.*\.so$ ]]
        then
            _dir='platforms'
        else
            _dir='printerdrivers'
        fi
        ln -s "../../../usr/lib/${_file##*/}" "${pkgdir}/opt/diamond-editor/${_dir}/${_file##*/}"
    done < <(find -L /usr/lib -type f -regextype posix-extended -regex '.*/Cs(Gui|PrinterDriver).*\.so$' -print0)
}
