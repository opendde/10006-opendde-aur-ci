# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>

_gitname=cascadia-code
pkgbase=cascadia-code-git
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}")
pkgver=2008.25.r1.gc6492c66
pkgrel=1
pkgdesc="A new monospaced font that includes programming ligatures"
url="https://github.com/microsoft/${_gitname}"
arch=('any')
license=('custom:OFL')
makedepends=('git' 'python')
provides=("otf-cascadia-code=${pkgver}" "ttf-cascadia-code=${pkgver}")
conflicts=('nerd-fonts-cascadia-code' 'ttf-cascadia-code')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_gitname}"
    # Using pip because deps in AUR are broken.
    python -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
    python build.py
}

package_otf-cascadia-code-git() {
    cd "${_gitname}"
    install -Dm644 build/*.otf -t "$pkgdir"/usr/share/fonts/OTF
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-cascadia-code-git() {
    cd "${_gitname}"
    install -Dm644 build/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
