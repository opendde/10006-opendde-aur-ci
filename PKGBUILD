# Maintainer: Gao xiang<hughgao01@gmail.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Maintainer: Eric Berquist <eric.berquist at gmail dot com>

pkgname=gamess
pkgver=2020R1
pkgrel=1
pkgdesc="The General Atomic and Molecular Electronic Structure System"
arch=('x86_64')
url="https://www.msg.chem.iastate.edu/gamess/gamess.html"
license=('custom')
depends=('tcsh' 'openblas' 'python')
makedepends=('python-jinja' 'gcc-fortran')
checkdepends=('inetutils')
install=${pkgname}.install

# You have to get the package from the official website
# and put into the current directory.
source=("local://gamess-current.tar.gz"
        "opt.patch"
        "tests.patch")
sha256sums=('94678e567f681d3a7500a1bea68cfb893520e76dcadd7e188eb1e1d185bea90f'
            'a7f71d749e07b7f81c327f10127b6738a28974c956bfbfa0bba53281d2fcd366'
            '38a14c4d428b54838b55ed19cc9aa6741992c2e7b66a0180994d264de71c6bf2')

prepare() {
  cd "$srcdir/$pkgname"

  patch -p1 < "$srcdir/tests.patch"
  
  # You may comment out two lines below to let GAMESS choose compiler options.
  patch -p1 < "$srcdir/opt.patch"
  msg2 "Compiler flags '-O3 -march=native -mno-fma' are enabled by default."
  
  # Optimizations can safely be more aggressive.
  sed -i 's/ -fno-aggressive-loop-optimizations//g' comp
  
  # Fixes for GCC Fortran 10.1
  sed -i 's/-ffree-line-length-none/-ffree-line-length-none -fallow-argument-mismatch/g' comp
  sed -i 's/-Ofast -ffast-math/-Ofast -ffast-math -fallow-argument-mismatch/g' comp
}

build() {
  cd "$srcdir/$pkgname"
  python bin/create-install-info.py \
                                    --fortran_version=10.1 \
                                    --math=openblas \
                                    --mathlib_path=/usr/lib \
                                    --openmp
  make modules -j1
  make
}

check() {
  msg2 "Please, wait for the computation of 47 test examples to finish."
  msg2 "It is going to take about 5 min depending on your CPU frequency."
  cd "$srcdir/$pkgname"
  
  # Prepare the launch script "rungms" to testing.
  sed -i '/set GMSPATH=/c\set GMSPATH=$PWD' rungms
  sed -i '/set SCR=/c\set SCR=\/tmp' rungms
  mkdir scr
  sed -i '/set USERSCR=/c\set USERSCR=$PWD\/scr' rungms
  
  # Fixing the number of tests
  sed -i 's/47/48/' runall
  
  # Start testing with the use of 1 CPU core.
  ./runall 00
  tests/standard/checktst
  rm -r scr
}

package() {
  cd "$srcdir/$pkgname"
  
  # Fix rungms
  sed -i '/set GMSPATH=/c\set GMSPATH=/opt/gamess' rungms
  sed -i '/set SCR=/c\set SCR=\/tmp' rungms
  sed -i '/set USERSCR=/c\set USERSCR=$HOME\/.gamess' rungms
  
  install -dm755 "$pkgdir/opt/gamess"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 *.x "$pkgdir/opt/gamess"
  install -m755 run* "$pkgdir/opt/gamess"
  install -m755 gms-files.csh "$pkgdir/opt/gamess"
  
  cp -r auxdata tools vb2000 "$pkgdir/opt/gamess"
  
  ln -sf /opt/gamess/rungms "$pkgdir/usr/bin"
}
