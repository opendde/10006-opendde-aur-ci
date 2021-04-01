# Maintainer: Michael Moroni <michaelmoroni AT disroot DOT org >
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Cedric MATHIEU <me.xenom @ gmail.com>

_name=firefox
_channel=nightly
_lang=eo
pkgname=${_name}-${_channel}-${_lang}
pkgdesc="Retumilo farita de Mozilla — Esperanta nestabila versio"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"
_version=89.0a1
pkgver=89.0a1
pkgrel=1
arch=(i686 x86_64)
license=(MPL GPL LGPL)
depends=(dbus-glib gtk3 libxt nss mime-types)
optdepends=('pulseaudio: subteno al fono'
            'ffmpeg: h.264-video'
            'hunspell: literumado'
            'hyphen: dividstrekado'
            'libnotify: integrigo por notifoj'
            'networkmanager: detekto de loko per disponeblaj sendrataj retoj'
            'speech-dispatcher: teksto-al-parolado')
_url="https://download-installer.cdn.mozilla.net/pub/${_name}/${_channel}/latest-mozilla-central-l10n"
_urlUS="https://download-installer.cdn.mozilla.net/pub/${_name}/${_channel}/latest-mozilla-central"
_src="${_name}-${_version}.${_lang}.linux"
_srcUS="${_name}-${_version}.en-US.linux"
_filename="$(date +%Y%m%d)-${_src}"
source=("${pkgname}.desktop" 'policies.json')
source_i686=("${_filename}-i686.tar.bz2"::"${_url}/${_src}-i686.tar.bz2"
             "${_filename}-i686.tar.bz2.asc"::"${_url}/${_src}-i686.tar.bz2.asc"
             "${_filename}-i686.txt"::"${_urlUS}/${_srcUS}-i686.txt")
source_x86_64=("${_filename}-x86_64.tar.bz2"::"${_url}/${_src}-x86_64.tar.bz2"
               "${_filename}-x86_64.tar.bz2.asc"::"${_url}/${_src}-x86_64.tar.bz2.asc"
               "${_filename}-x86_64.txt"::"${_urlUS}/${_srcUS}-x86_64.txt")
sha512sums=('5ea76e94b6ac71f2968a0927ec32344c23884679d8b5991ef192acf4de06e3d2aaa4b84e7417b9c2a618b5dd496120b71df20e9a264f20fe292e72473c782faf'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=(SKIP SKIP SKIP)
sha512sums_x86_64=(SKIP SKIP SKIP)
validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353)

pkgver() {
  echo "${_version}.$(head -n1 ${_filename}-${CARCH}.txt | cut -c-8)"
}

package() {
  OPT_PATH="opt/${pkgname}"

  # Install the package files
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -r ${_name} "${pkgdir}"/${OPT_PATH}
  ln -s "/${OPT_PATH}/${_name}" "${pkgdir}"/usr/bin/${pkgname}

  # Install .desktop files
  install -Dm644 "${srcdir}"/${pkgname}.desktop -t "${pkgdir}"/usr/share/applications

  # Install icons
  SRC_LOC="${srcdir}"/${_name}/browser
  DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
  for i in 16 32 48 64 128
  do
      install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${pkgname}.png
  done

  # Disable auto-updates
  install -Dm644 "${srcdir}"/policies.json -t "${pkgdir}"/${OPT_PATH}/distribution

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
