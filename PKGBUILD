# Maintainer: Egor Kovetskiy <e.kovetskiy@gmail.com>
#
# Previous Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
# Previous Contributor: Andrea Fagiani <andfagiani_at_gmail_dot_com>

pkgname=eclim-fixed-git
pkgver=${PKGVER:-autogenerated}
pkgrel=${PKGREL:-1}
pkgdesc='Provides the ability to integrate Eclipse code editing features into your favorite editor'
url='http://eclim.org/'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('vim' 'eclipse')
makedepends=('git' 'apache-ant' 'python2-sphinx')
optdepends=('eclipse-pdt: Eclipse PHP Development Tools support'
            'eclipse-cdt: Eclipse C/C++ Plugin support'
            'eclipse-dltk-core: Eclipse Dynamic Languagues Toolkit support'
            'eclipse-dltk-ruby: Eclipse Ruby support'
            'eclipse-wtp: Eclipse Web Developer Tools support')
conflicts=('eclim')
install=eclim-git.install

# NOTE: patch originally found here: https://github.com/ervandew/eclim/pull/602
source=("${pkgname}::git+https://github.com/ervandew/eclim.git"
        systemd_eclimd.service
        fix_stubutility.patch)

sha256sums=('SKIP'
            '76b26b38d4ebd651942e34243b66779c24daa1d6498f2906190d1a7be59bafbe'
            '8047c80fe68b546a38701b80fe6c69056dd56e5a950db41da0f7597d9eaf56d5')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"

  sed -i 's|git@github.com:|https://github.com/|' .gitmodules
  git submodule update --init

  # fix build, thanks to mikezackles
  sed -e "s/'sphinx-build'/'sphinx-build2'/g" \
    -e 's|${user.home}/\.|${vim.files}/|g' \
    -e "s|File(getVariable('eclipse')|File('/usr/lib/eclipse/'|g" \
    -i ant/build.gant
}

getEclipseUserHome() {
  prod_file='/usr/lib/eclipse/.eclipseproduct'
  if [ -r ${prod_file} ]; then
    _eclipse_ver=$(cat ${prod_file} \
      | grep 'version=' \
      | sed -r 's/^version=([0-9\.]+)$/\1/')
    find ~/.eclipse -mindepth 1 -maxdepth 1 -type d -name "org.eclipse.platform_${_eclipse_ver}*" | head -1
  else
    return
  fi
}

_eclipse_user_home=$(getEclipseUserHome)
_ant_opts_eclipse_user_home=''
if [ "x${_eclipse_user_home}" != "x" ]; then
  _ant_opts_eclipse_user_home="-Declipse.local=${_eclipse_user_home}"
  echo "Eclipse local home found: ${_eclipse_user_home}" >&2
else
  echo "Could not find Eclipse local home" >&2
fi

build() {
  cd "${srcdir}/${pkgname}"

  echo "Patching StubUtility compilation errors: https://github.com/ervandew/eclim/pull/602" >&2
  patch -p1 < "$srcdir/fix_stubutility.patch"

  # `man javac`:
  #  -encoding encoding
  #     Set the source file encoding name, such as EUC-JP and UTF-8.
  #     If -encoding is not specified, the platform default converter is used.
  export LANG='en_US.utf8'
  # recompiling nailgun to make sure the executable is compliant with our architecture
  pushd org.eclim/nailgun
  ./configure
  make
  popd

  _build_dir=${srcdir}/build
  mkdir -p ${_build_dir}

  ant -Declipse.home=/usr/lib/eclipse \
      ${_ant_opts_eclipse_user_home} \
      -Declipse.dest=${_build_dir} \
      clean \
      build
}

package() {
  cd "${srcdir}/${pkgname}"

  _build_dir=${srcdir}/build

  ant -Declipse.home=/usr/lib/eclipse \
      ${_ant_opts_eclipse_user_home} \
      -Declipse.dest=${_build_dir} \
      docs

  mkdir -p ${pkgdir}/usr/share/doc
  cp -r build/doc/site ${pkgdir}/usr/share/doc/eclim

  mkdir -p ${pkgdir}/usr/share/vim/vimfiles/eclim/doc
  ant -Declipse.home=/usr/lib/eclipse \
      ${_ant_opts_eclipse_user_home} \
      -Dvim.files=${pkgdir}/usr/share/vim/vimfiles \
      -Declipse.dest=${_build_dir} \
      vimdocs

  mkdir -p ${pkgdir}/usr/lib/eclipse
  mkdir -p ${pkgdir}/usr/share/vim/vimfiles
  ant -Declipse.home=${pkgdir}/usr/lib/eclipse \
      -Declipse.dest=${pkgdir}/usr/lib/eclipse \
      -Dvim.files=${pkgdir}/usr/share/vim/vimfiles \
      deploy

  # fix eclim paths
  sed -e "s|${pkgdir}||g" \
    -i ${pkgdir}/usr/lib/eclipse/plugins/org.eclim_*/bin/eclimd \
    -i ${pkgdir}/usr/lib/eclipse/plugins/org.eclim_*/plugin.properties

  mkdir ${pkgdir}/usr/bin
  for s in eclim eclimd; do
    ln -s /usr/lib/eclipse/${s} ${pkgdir}/usr/bin/${s}
  done

  # delete doctrees
  rm -fr ${pkgdir}/usr/share/doc/eclim/.doctrees

  rm ${pkgdir}/usr/lib/eclipse/plugins/org.eclim_*/nailgun/config.status

  install -D -m 644 ${srcdir}/systemd_eclimd.service ${pkgdir}/usr/lib/systemd/user/eclimd.service
}
