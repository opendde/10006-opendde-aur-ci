# Maintainer: Pierre-Marie de Rodat <pmderodat@kawie.fr>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=libgpr
pkgver=1
pkgrel=1
pkgdesc="Ada library to handle GPRbuild project files"

arch=('i686' 'x86_64')
url="http://libre.adacore.com/"
license=('GPL')

depends=('gcc-ada' 'gcc-libs' 'prepare_gnat_util')
makedepends=('git' 'gcc-ada' 'gprbuild')

#source=('https://github.com/AdaCore/gprbuild.git')
#sha256sums=(SKIP)
#source=()
#sha256sums=(SKIP)

_gitroot='https://github.com/AdaCore/gprbuild.git'
_gitname='gprbuild'


library_kinds="static shared"


prepare()
{
  cd "$srcdir"

  if [[ -d "$_gitname" ]]; then
    msg "gprbuild git repository exists."
    git pull
  else
    msg "Connecting to GIT server...."

    git clone "$_gitroot" "$_gitname"

#    cd "$_gitname"
#    git checkout
#    git checkout 0f2542be82b7a4edd89b564205202b16a0f1dfd3
#    msg "GIT checkout done or server timeout"
  fi
}


build() {
  cd "$srcdir/gprbuild"

  for k in $library_kinds
  do
    make libgpr.build.$k
  done
}


package() {
  cd "$srcdir/gprbuild"
  for k in $library_kinds
  do
    make libgpr.install.$k "prefix=$pkgdir/usr"
  done
}
