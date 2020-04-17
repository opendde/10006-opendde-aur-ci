# Maintainer: Gontier Julien <gontierjulien68@gmail.com>
# Contributors: Gontier Julien <gontierjulien68@gmail.com>

_name=firefox
_channel=nightly
_lang=en-US
pkgname=${_name}-${_channel}-every-day
pkgdesc="Standalone Web Browser from Mozilla — Nightly build (Updated every day) (${_lang})"
url="https://www.mozilla.org/${_lang}/${_name}/${_channel}"
_version=77.0a1
pkgver=77.0a1.20200418
pkgrel=1
epoch=1
arch=(i686 x86_64)
license=(MPL GPL LGPL)
depends=(dbus-glib gtk3 libxt nss mime-types)
optdepends=('pulseaudio: audio support'
            'ffmpeg: h.264 video'
            'hunspell: spell checking'
            'hyphen: hyphenation'
            'libnotify: notification integration'
            'networkmanager: location detection via available WiFi networks'
            'speech-dispatcher: text-to-speech'
            'startup-notification: support for FreeDesktop Startup Notification')
conflicts=('firefox-nightly')
_url="https://ftp.mozilla.org/pub/${_name}/nightly/latest-mozilla-central"
_src="${_name}-${_version}.${_lang}.linux"
_filename="$(date +%Y%m%d)-${_src}"
source=("${_name}-${_channel}.desktop" 'policies.json')
source_i686=("${_filename}-i686.tar.bz2"::"${_url}/${_src}-i686.tar.bz2"
             "${_filename}-i686.tar.bz2.asc"::"${_url}/${_src}-i686.tar.bz2.asc"
             "${_filename}-i686.txt"::"${_url}/${_src}-i686.txt")
source_x86_64=("${_filename}-x86_64.tar.bz2"::"${_url}/${_src}-x86_64.tar.bz2"
               "${_filename}-x86_64.tar.bz2.asc"::"${_url}/${_src}-x86_64.tar.bz2.asc"
               "${_filename}-x86_64.txt"::"${_url}/${_src}-x86_64.txt")
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=(SKIP SKIP SKIP)
sha512sums_x86_64=(SKIP SKIP SKIP)
validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353) # Mozilla’s GnuPG release key

package() {
  OPT_PATH="opt/${_name}-${_channel}"

  # Install the package files
  install -d "${pkgdir}"/{usr/bin,opt}
  cp -r ${_name} "${pkgdir}"/${OPT_PATH}
  ln -s "/${OPT_PATH}/${_name}" "${pkgdir}"/usr/bin/${_name}-${_channel}

  # Install .desktop files
  install -Dm644 "${srcdir}"/${_name}-${_channel}.desktop -t "${pkgdir}"/usr/share/applications

  # Install icons
  SRC_LOC="${srcdir}"/${_name}/browser
  DEST_LOC="${pkgdir}"/usr/share/icons/hicolor
  for i in 16 32 48 64 128
  do
      install -Dm644 "${SRC_LOC}"/chrome/icons/default/default${i}.png "${DEST_LOC}"/${i}x${i}/apps/${_name}-${_channel}.png
  done

  # Disable auto-updates
  install -Dm644 "${srcdir}"/policies.json -t "${pkgdir}"/${OPT_PATH}/distribution

  # Use system-provided dictionaries
  rm -rf "${pkgdir}"/${OPT_PATH}/{dictionaries,hyphenation}
  ln -sf /usr/share/hunspell "${pkgdir}"/${OPT_PATH}/dictionaries
  ln -sf /usr/share/hyphen "${pkgdir}"/${OPT_PATH}/hyphenation
}
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('43bb72dd5310e9afb779495b602f7400a467d65080698582a63e467bf9193ebda3e41259dd16161e221eb45399d24141fc0ded703ec3f719c850fdebeb1d665a'
                 'SKIP'
                 '14fc07f42ab44fa71c17d36603276988b8fac73ca500c8755d9a1ab9f91019e886f3eeb37d27711479334389f255b6a714dff85d7ce23b5dff32be91cb409df9')
sha512sums_x86_64=('3a880af1a57e98c4d96a3857a6f0b23f6bad59200f0a1bc2fa6c690099058f8baeff4cd0a9f1069dccc41a531768a04ef94d7de1d246620f39c1d8a06f7a4d4b'
                   'SKIP'
                   'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('43bb72dd5310e9afb779495b602f7400a467d65080698582a63e467bf9193ebda3e41259dd16161e221eb45399d24141fc0ded703ec3f719c850fdebeb1d665a'
                 'SKIP'
                 '14fc07f42ab44fa71c17d36603276988b8fac73ca500c8755d9a1ab9f91019e886f3eeb37d27711479334389f255b6a714dff85d7ce23b5dff32be91cb409df9')
sha512sums_x86_64=('3a880af1a57e98c4d96a3857a6f0b23f6bad59200f0a1bc2fa6c690099058f8baeff4cd0a9f1069dccc41a531768a04ef94d7de1d246620f39c1d8a06f7a4d4b'
                   'SKIP'
                   'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('43bb72dd5310e9afb779495b602f7400a467d65080698582a63e467bf9193ebda3e41259dd16161e221eb45399d24141fc0ded703ec3f719c850fdebeb1d665a'
                 'SKIP'
                 '14fc07f42ab44fa71c17d36603276988b8fac73ca500c8755d9a1ab9f91019e886f3eeb37d27711479334389f255b6a714dff85d7ce23b5dff32be91cb409df9')
sha512sums_x86_64=('3a880af1a57e98c4d96a3857a6f0b23f6bad59200f0a1bc2fa6c690099058f8baeff4cd0a9f1069dccc41a531768a04ef94d7de1d246620f39c1d8a06f7a4d4b'
                   'SKIP'
                   'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('15b1dffc3d2d03d8d24cc7ed7108ccc9bad77b1c981508e4a7f2b3ec2f300e5832d6ed7d74ec6576a691c6cf53e7d4c676df13f59efa61ec7a224cbaad8d3ef6'
                 'SKIP'
                 'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums_x86_64=('3a880af1a57e98c4d96a3857a6f0b23f6bad59200f0a1bc2fa6c690099058f8baeff4cd0a9f1069dccc41a531768a04ef94d7de1d246620f39c1d8a06f7a4d4b'
                   'SKIP'
                   'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('15b1dffc3d2d03d8d24cc7ed7108ccc9bad77b1c981508e4a7f2b3ec2f300e5832d6ed7d74ec6576a691c6cf53e7d4c676df13f59efa61ec7a224cbaad8d3ef6'
                 'SKIP'
                 'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums_x86_64=('3a880af1a57e98c4d96a3857a6f0b23f6bad59200f0a1bc2fa6c690099058f8baeff4cd0a9f1069dccc41a531768a04ef94d7de1d246620f39c1d8a06f7a4d4b'
                   'SKIP'
                   'b39aa809ba729537bdb1b783f36ac58eb9e5da5252a5dc031c90e18c77f4e9f13f73f62f499a638363f4b59f2b1eaa8b7f428279ba3efaac082e9b621a901bc8')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('6d1ba87b8b2061b57a116d43e0c2ffa0d7ea75014734a3e5d163b47552f1bddfddd6fe59ec2d7e171d3f94bc685776c4a2ce1ecfcf288b792be76965028ead8c'
                 'SKIP'
                 '8927ea3b0a85691229e0215634fff87e6d267079c60a9d9a4ff6ae0438efbc02fe46acb4e66b30de708f25f5fc01288b8ee39a88d9add9bf220f1b03968ada55')
sha512sums_x86_64=('acb2cf2c854f8fda216659fa84192da5a2aedc53e6a6573d12f7ef4b1ed373715ba8c2e389b0d6235b8f09d6c072213d0a2f7b9a4a9eb68d37be73fef798681a'
                   'SKIP'
                   '8927ea3b0a85691229e0215634fff87e6d267079c60a9d9a4ff6ae0438efbc02fe46acb4e66b30de708f25f5fc01288b8ee39a88d9add9bf220f1b03968ada55')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('6d1ba87b8b2061b57a116d43e0c2ffa0d7ea75014734a3e5d163b47552f1bddfddd6fe59ec2d7e171d3f94bc685776c4a2ce1ecfcf288b792be76965028ead8c'
                 'SKIP'
                 '8927ea3b0a85691229e0215634fff87e6d267079c60a9d9a4ff6ae0438efbc02fe46acb4e66b30de708f25f5fc01288b8ee39a88d9add9bf220f1b03968ada55')
sha512sums_x86_64=('87bdf41aabd3aee09b517b07cb776dd6b9c75db32373d3df976efc98406275735e7d70d5e357efc4e779601ef27431e75d87a7d4645c274676be35f6a86a4b29'
                   'SKIP'
                   '7b4f9b96b0a883d314ff81190ea20ddbc858ec87b085be15d1582f7184d888776e2959fb8da51a427e002b8810fdeb48d2612414a63fc78d58852f3c7f721a64')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('642e216078dc3d94bbb7d4d4a7dc6d89031acfe16d7dfcb4b840d90daad29d568aad9f27ce1fea4e2ad26bf40c3196fb5260ea292ac7af3d5d095a11bc8c4ec9'
                 'SKIP'
                 '7b4f9b96b0a883d314ff81190ea20ddbc858ec87b085be15d1582f7184d888776e2959fb8da51a427e002b8810fdeb48d2612414a63fc78d58852f3c7f721a64')
sha512sums_x86_64=('87bdf41aabd3aee09b517b07cb776dd6b9c75db32373d3df976efc98406275735e7d70d5e357efc4e779601ef27431e75d87a7d4645c274676be35f6a86a4b29'
                   'SKIP'
                   '7b4f9b96b0a883d314ff81190ea20ddbc858ec87b085be15d1582f7184d888776e2959fb8da51a427e002b8810fdeb48d2612414a63fc78d58852f3c7f721a64')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('a7091d8f3671b0579d25571bca45e78643bc79a49dbaf0a066622e5daf5ff2ade331face7e3389743a351febed88b27951b0f7bb957a06fc5f3a3ff406f84f8b'
                 'SKIP'
                 'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums_x86_64=('cd6a1ca03154b83bdce5c5e665b94cd89f1daa4df3f7e6f355ed6c11835e95344436eb6291184c7b6d7113054ab70b0bb5dbc21d8eb00c9cc33c921e7905318f'
                   'SKIP'
                   'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('a7091d8f3671b0579d25571bca45e78643bc79a49dbaf0a066622e5daf5ff2ade331face7e3389743a351febed88b27951b0f7bb957a06fc5f3a3ff406f84f8b'
                 'SKIP'
                 'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums_x86_64=('cd6a1ca03154b83bdce5c5e665b94cd89f1daa4df3f7e6f355ed6c11835e95344436eb6291184c7b6d7113054ab70b0bb5dbc21d8eb00c9cc33c921e7905318f'
                   'SKIP'
                   'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('a7091d8f3671b0579d25571bca45e78643bc79a49dbaf0a066622e5daf5ff2ade331face7e3389743a351febed88b27951b0f7bb957a06fc5f3a3ff406f84f8b'
                 'SKIP'
                 'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums_x86_64=('cd6a1ca03154b83bdce5c5e665b94cd89f1daa4df3f7e6f355ed6c11835e95344436eb6291184c7b6d7113054ab70b0bb5dbc21d8eb00c9cc33c921e7905318f'
                   'SKIP'
                   'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('a7091d8f3671b0579d25571bca45e78643bc79a49dbaf0a066622e5daf5ff2ade331face7e3389743a351febed88b27951b0f7bb957a06fc5f3a3ff406f84f8b'
                 'SKIP'
                 'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums_x86_64=('cd6a1ca03154b83bdce5c5e665b94cd89f1daa4df3f7e6f355ed6c11835e95344436eb6291184c7b6d7113054ab70b0bb5dbc21d8eb00c9cc33c921e7905318f'
                   'SKIP'
                   'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('a7091d8f3671b0579d25571bca45e78643bc79a49dbaf0a066622e5daf5ff2ade331face7e3389743a351febed88b27951b0f7bb957a06fc5f3a3ff406f84f8b'
                 'SKIP'
                 'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums_x86_64=('cd6a1ca03154b83bdce5c5e665b94cd89f1daa4df3f7e6f355ed6c11835e95344436eb6291184c7b6d7113054ab70b0bb5dbc21d8eb00c9cc33c921e7905318f'
                   'SKIP'
                   'dacad011497cc8443210c2df8936ffe3defbb06d3678a4ec223e05ea2cbb2efeb6a8799a3d3881790ace3f02019f4e956a74711a097a662062a5fe93ce19190f')
sha512sums=('42426e7b510bd88cbf7b246bf66d7768afa5d71389bf15f7a4231dc24f99fd73284dd9a0a8eb4342b42337c2c7dd843e570a93afa7d3b44c97ecbf5e38e433ac'
            '5ed67bde39175d4d10d50ba5b12063961e725e94948eadb354c0588b30d3f97d2178b66c1af466a6e7bd208ab694227a1391c4141f88d3da1a1178454eba5308')
sha512sums_i686=('6df4ef50b0adb1a1c1ce4484b831a494e1b4542c114d78a4e740a2294af2355f10b077ee108bd8c819acb8feb6a85aaec68380f1f1aacbb19d4bf353a4add39b'
                 'SKIP'
                 '36db069fcd6685f65c29052d56c2591de01e6ced4dba695746ec7e3966ae8c63ebe771ca3d5213bf90a70f7c97a5d0c6f3fddd7f3b3bce10b29050ccce8f6ff0')
sha512sums_x86_64=('e7811175e1e9fe4143d9e9972c58bcf43ffb1ad39f842e50271a27829df0dad3d92294b12d232a55d8ff0feead997fb0971f9995bbe6e410eb1154d8e370645f'
                   'SKIP'
                   '36db069fcd6685f65c29052d56c2591de01e6ced4dba695746ec7e3966ae8c63ebe771ca3d5213bf90a70f7c97a5d0c6f3fddd7f3b3bce10b29050ccce8f6ff0')
