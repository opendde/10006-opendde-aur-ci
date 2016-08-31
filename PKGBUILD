# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=git-scripts-jwiegley-git
pkgver=8ae43cb
pkgrel=4
pkgdesc="Git scripts written by different people (collected by John Wiegley)"
url="https://github.com/jwiegley/git-scripts"
arch=(any)
license=('unknown')
depends=('git')
optdepends=('perl: git-archive-all, git-flush, git-force-mtimes, git-forest, git-rm-conflicts'
            'python: git-changelog, git-record'
            'ruby: git-flatten, git-merge-from-svn, git-opendiff, git-all, git-wtf, git-find, git-rank-contributors')
source=("git://github.com/jwiegley/git-scripts.git")
sha256sums=('SKIP')

pkgver () {
  cd ${srcdir}/git-scripts
  git rev-parse --short HEAD
}

prepare () {
  cd ${srcdir}/git-scripts
  for with_extension in git-*.*; do
    mv ${with_extension} ${with_extension%.*}
  done
}

package () {
  provides=( $(find ${srcdir}/git-scripts -type f -perm 755 -name 'git-*' -exec basename {} \; 2> /dev/null | sort) )
  conflicts=( $(find ${srcdir}/git-scripts -type f -perm 755 -name 'git-*' -exec basename {} \; 2> /dev/null | sort) )

  install -d ${pkgdir}/usr/bin
  find ${srcdir}/git-scripts -type f -perm 755 -name 'git-*' -exec install -t ${pkgdir}/usr/bin {} +
}
