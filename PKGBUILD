# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=poliastro
pkgname=python-${_pyname}-doc
pkgver=0.15.0
pkgrel=1
pkgdesc="Documentation for Python poliastro module"
arch=('i686' 'x86_64')
url="http://docs.poliastro.space"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}"
             'pandoc'
             'python-pandas'
             'python-beautifulsoup4'
             'python-plotly>=4.0.0'
             'python-nbsphinx'
             'python-numba'
             'python-sphinx_rtd_theme'
             'python-sphinx-notfound-page'
             'python-sphinx-autoapi'
             'python-sphinx-gallery'
             'python-sphinx-hoverxref'
             'python-astroquery'
             'python-myst-parser'
             'python-jupytext'
             'python-jinja<3.0.0'
             'graphviz')
source=("https://github.com/poliastro/poliastro/archive/v${pkgver}.tar.gz"
        'fix_nbsphinx_errors.patch')
md5sums=('44e494ba6abc405e4d79415535d6a1d6'
         '92c9d10567556123b294c89645a5e4c8')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/fix_nbsphinx_errors.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs

    make html
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../COPYING
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
