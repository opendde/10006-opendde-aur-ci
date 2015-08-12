# Maintainer: Peter Gottesman<peter@petergottesman.com>
pkgname=openmpi-1.10
pkgver=1.10.0rc2
pkgrel=1
pkgdesc="A High Performance Message Passing Library"
arch=(any)
url="http://www.open-mpi.org"
license=(custom)
depends=(libtool hwloc)
makedepends=(gcc-fortran inetutils valgrind)
source=(http://www.open-mpi.org/software/ompi/v1.10/downloads/openmpi-$pkgver.tar.gz)
md5sums=('a4f37a1e76b9f90bfd6cc293a887ac4b')

build() {
    cd $pkgname-$pkgver

    ./autogen.pl
    ./configure --prefix=/usr \
        --sysconfdir=/etc/${pkgname} \
        --enable-mpi-fortran=all \
        --libdir=/usr/lib/${pkgname} \
        --with-threads=posix \
        --enable-smp-locks \
        --with-valgrind \
        --enable-memchecker \
        --enable-pretty-print-stacktrace \
        --without-slurm \
        --with-hwloc=/usr \
        --with-libltdl=/usr  \
        FC=/usr/bin/gfortran \
        LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"

    make
}

check() {
    cd "openmpi-$pkgdir"

    make check
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install

    # FS#28583
    install -d -m 755 "$pkgdir"/usr/lib/pkgconfig
    for i in ompi-c.pc ompi-cxx.pc ompi-f77.pc ompi-f90.pc ompi.pc; do
        ln -sf /usr/lib/openmpi/pkgconfig/$i "$pkgdir"/usr/lib/pkgconfig/
    done

    # Openmpi's otfinfo conflicts with the one from texlive
    mv "$pkgdir"/usr/bin/otfinfo{,mpi}

    # Remove dangling symlink and useless file
    rm "$pkgdir"/usr/share/vampirtrace/config.log

    install -d -m 755 "$pkgdir"/etc/ld.so.conf.d
    echo "/usr/lib/$pkgname" > "$pkgdir"/etc/ld.so.conf.d/$pkgname.conf

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
