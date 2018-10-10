# Maintainer: lsf
# Contributor: Adam Hose <adis@blad.is>
pkgver=20181008.359_c10e7a3
pkgrel=2
_pkgname=opensnitch
pkgname=opensnitch-git
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="A GNU/Linux port of the Little Snitch application firewall."
makedepends=('git' 'go-pie' 'dep'
             'python-setuptools' 'python-pip')
depends=('python-grpcio' 'python-grpcio-tools' 'python-pyinotify'
         'python-pyqt5' 'python-unicode-slugify'
         'libpcap' 'libnetfilter_queue'
         'desktop-file-utils')
provides=('opensnitch' 'opensnitch-ui')

source=("git://github.com/evilsocket/opensnitch.git"
        'nosudo.patch')

md5sums=('SKIP'
         'eb5a6c83c3816220799e678e32572705')

pkgver() {
        cd "$srcdir/$_pkgname"
        local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
        local count=$(git rev-list --count HEAD)
        local commit=$(git rev-parse --short HEAD)
        echo "$date.${count}_$commit"
}

build() {
        cd "$srcdir/$_pkgname"

        if [ -L "$srcdir/$_pkgname" ]; then
                rm "$srcdir/$_pkgname" -rf
                mv "$srcdir/.go/src/$_pkgname/" "$srcdir/$_pkgname"
        fi

        rm -rf "$srcdir/.go/src"
        mkdir -p "$srcdir/.go/src"
        export GOPATH="$srcdir/.go"
        mv "$srcdir/$_pkgname" "$srcdir/.go/src/"

        cd "$srcdir/.go/src/$_pkgname/"
        ln -sf "$srcdir/.go/src/$_pkgname/" "$srcdir/$_pkgname"

        cd "$GOPATH/src/opensnitch/daemon"
        dep ensure
        cd "$GOPATH/src/opensnitch"
        patch -Np1 -i "${srcdir}/nosudo.patch"
        make
}

package(){
        cd "$srcdir/.go/src/$_pkgname/"
        mkdir -p "${pkgdir}"/usr/lib/systemd/system
        mkdir -p "${pkgdir}"/usr/bin
        make DESTDIR="$pkgdir/" install
        cd ui
        pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
