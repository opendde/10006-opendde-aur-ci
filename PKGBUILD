pkgname="opts-bash"
pkgver=${PKGVER:-autogenerated}
pkgrel=${PKGREL:-1}
pkgdesc="Simple-to-use option parser for bash scripts"
groups=(
    ""
)
arch=("i686" "x86_64")
license=("GPL")
depends=()
makedepends=(
    "git"
)

source=(
    "$pkgname::git+https://github.com/reconquest/opts.bash"
)

md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.${count}_$commit"
}

build() {
    cd "$srcdir/$pkgname"

    git submodule init
    git submodule update

    bash opts.bash
}

package() {
    root=/usr/share/bash/opts/

    cd "$srcdir/$pkgname"

    find \
        -type f -name '*.bash' \
        -not '(' -path '*/.git/*' -o -path '*/tests/*' ')' \
            | xargs -n1 -I{} install -DT "{}" "$pkgdir/$root/{}"
}
