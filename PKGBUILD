# Maintainer: generated by script at https://github.com/zasdfgbnm/aurcran

_pkgname=rstudioapi
_pkgnamelower=rstudioapi
_repo='http://cran.stat.ucla.edu/'
_cran="https://cran.r-project.org/web/packages/$_pkgname/index.html"
pkgname=r-$_pkgnamelower
pkgver=0.6
pkgrel=1
pkgdesc='safely access the rstudio api'
arch=(any)
url="$_cran"
license=('MIT')
depends=('r')
makedepends=('curl' 'grep' 'python-html2text')

pkgver() {
    curl "$_cran" 2>/dev/null|html2text|grep -oP '(?<=Version:).*'|grep -o '[0-9\.]*'
}

build() {
    Rscript -e "install.packages(\"$_pkgname\", lib=\"$srcdir\", repos=\"$_repo\")"
}

package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/lib/R/library"
}