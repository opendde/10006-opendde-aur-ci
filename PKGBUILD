# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=libadalang
_upstream_ver=2021-20210518-199BE
epoch=1
pkgver=2021
pkgrel=2

pkgdesc="A high performance semantic engine for the Ada programming language."
url="https://github.com/AdaCore/libadalang"
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=("gnatcoll-gmp" "langkit")
makedepends=('gprbuild' 'python-setuptools' 'python-mako' 'python-funcy' 
             'python-e3-core' 'python-docutils' 'python-sphinx')

_checksum=7a191b8dd41b28a9b93424a5aedac3c5ec76b046
source=("${pkgname}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgname}-${_upstream_ver}-src.tar.gz")
sha1sums=("$_checksum")

build()
{
  cd "$srcdir/$pkgname-$_upstream_ver-src"

  ADA_FLAGS="$CFLAGS"
  ADA_FLAGS="${ADA_FLAGS//-Wformat}"
  ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

  python manage.py generate
  python manage.py \
    build \
    --library-types=static,static-pic,relocatable \
    --build-mode=prod \
    --gargs="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"

  make -C dev_manual html

  cd build/python
  python setup.py build
}

package()
{
  cd "$srcdir/$pkgname-$_upstream_ver-src"

  python manage.py \
    install \
    --library-types=static,static-pic,relocatable \
    --build-mode=prod \
    "$pkgdir/usr"

  # Install the developers manual
  pushd dev_manual/_build/html
  for file in $(find . -type f); do
    install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
  done
  popd

  # Install the license.
  install -D -m644     \
     "COPYING3"        \
     "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

  # Install the custom license.
  install -D -m644     \
     "COPYING.RUNTIME" \
     "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"

  # Install the Python binding
  cd build/python
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  rm -fr "$pkgdir/usr/python"

  # Fix ocaml bindings location
  mkdir -p "$pkgdir/usr/lib/ocaml/"
  mv "$pkgdir/usr/ocaml" "$pkgdir/usr/lib/ocaml/libadalang"
}
# vim: set et ts=2:
