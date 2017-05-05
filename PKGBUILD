# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Joris Steyn <jorissteyn@gmail.com>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=vim-gitgutter-git
pkgver=408.gb803a28
pkgrel=1
pkgdesc="A Vim plugin which shows a git diff in the 'gutter'"
arch=('any')
url="https://github.com/airblade/${pkgname%-git}"
license=('MIT')
groups=('vim-plugins')
depends=('vim' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    echo "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
    find * -maxdepth 0 -not -name "test" -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles" '{}' \+

    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
