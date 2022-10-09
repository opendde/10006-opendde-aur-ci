# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgbase=neovim-candid
pkgname=('neovim-candid-git'
	'neovim-lightline-candid-git')
pkgver=r86.f7198b5
pkgrel=1
arch=('any')
url="https://github.com/flrnd/candid.vim"
license=('MIT')
makedepends=('git')
source=("${pkgbase}::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_neovim-candid-git() {
	pkgdesc="A dark colorscheme with vibrant colors."
    _pkgname=neovim-candid
	depends=('neovim')
	optdepends=('neovim-lightline-git: for lightline color scheme'
		'md2vim: to make candid.txt help file')
    provides=("${pkgbase}")
    conflicts=("${pkgbase}")
    cd "${srcdir}/${pkgbase}"
	find autoload/candid.vim colors \
		-type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/candid.vim/start/candid.vim/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${_pkgname}/"
	which md2vim > /dev/null
	if [[ $? == 0 ]]; then
		md2vim README.md candid.txt
		install -Dm 644 candid.txt -t "$pkgdir/usr/share/nvim/runtime/doc/"
		rm candid.txt
	fi
}

package_neovim-lightline-candid-git() {
	pkgdesc="Candid color scheme for lightline."
    depends=('neovim' 'neovim-candid')
	optdepends=('neovim-lightline-git')
    _pkgname=neovim-lightline-candid
	provides=('neovim-lightline-candid')
	conflicts=('neovim-lightline-candid')
    cd "${srcdir}/${pkgbase}"
	find autoload/lightline -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/{}" \;
}
