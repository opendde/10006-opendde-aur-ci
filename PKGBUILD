# Maintainer: Jon Gjengset <jon@tsp.io>
# Based on PKGBUILD for oilrush
# Repository here: https://github.com/Jonhoo/gamedevtycoon-PKGBUILD
pkgname=game-dev-tycoon
pkgver=1.3.1
pkgrel=3
pkgdesc="a business simulation game where you start a video game development company"
arch=('i686' 'x86_64')
depends=('mesa' 'lib32-gconf' 'systemd') # systemd for libudev
provides=()
options=(!strip)
PKGEXT=".pkg.tar" # Because we don't want to have to recompress the binary
license=("commercial")
url="http://www.greenheartgames.com/app/game-dev-tycoon/"
_gamepkg="game-dev-tycoon.tar.gz"
_gamemd5="ec2dd3534744545f54689e8611c13e1a"
source=('game-dev-tycoon' 'game-dev-tycoon.desktop'
  'http://www.greenheartgames.com/wp-content/uploads/2012/09/logo_120.png')
md5sums=('0c1a2b3ba7df65f5763a8f99da799ea4'
         'b846906a3d1b9820dbc2c68c3c748db9'
         '20f8fd0e2d8d72090aa032aec8a43119')

build() {
  cd ${srcdir}

  msg "You need a full copy of this game in order to install it"
  msg "Download the .tar.gz version of the game and give its path below"
  msg "Searching for \"${_gamepkg}\" in dir: $(readlink -f ${startdir})"
  pkgpath="${startdir}/${_gamepkg}"

  if [[ ! ( -f "${startdir}/${_gamepkg}" ) ]]; then
    error "Game file not found, please type path to game setup package:"
    read pkgpath
    if [[ ! ( "${pkgpath:0:1}" == "/" ) ]]; then
      pkgpath="${startdir}/${pkgpath}"
    fi
    if [[ ! ( -f "${pkgpath}" ) ]] ; then
       error "Unable to find game file." && return 1
    fi
  fi

  if [[ ! (`md5sum ${pkgpath} | cut -f1 -d' '` == "${_gamemd5}") ]]; then
    error "Game file seems to be a different version, problems may occur!"
  fi
  msg2 "Found game file, installing..."

  ln -fs "${pkgpath}" .
  tar zxf "$(basename "$pkgpath")"
  mv "logo_120.png" "launcher.png"
}

package() {
  cd "${srcdir}"
  install -d ${pkgdir}/opt/greenheartgames/${pkgname}

  msg2 "copy game files"
  cp -R ${srcdir}/{gamedevtycoon,nw.pak,libffmpegsumo.so} ${pkgdir}/opt/greenheartgames/${pkgname}/

  # I know this is bad, but what else can be done about this hardcoded library
  # version?
  msg2 "symlink libudev.so.0 -> libudev.so.1"
  ln -fs /usr/lib32/libudev.so.1 ${pkgdir}/opt/greenheartgames/${pkgname}/libudev.so.0

  # Install Launcher
  msg2 "install launcher to /usr/bin"
  install -D -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # Install Desktop
  msg2 "add .desktop file"
  install -D -m644 ${srcdir}/${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
