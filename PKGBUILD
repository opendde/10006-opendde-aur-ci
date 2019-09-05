# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=discord-ptb
_pkgname=DiscordPTB
pkgver=0.0.16
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure. - Public Test Build"
arch=('x86_64')
url='https://discordapp.com'
license=('custom')
depends=('libnotify' 'libxss' 'nspr' 'nss'
         'opera-ffmpeg-codecs' 'libegl' 'libgles') # Replacements
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://dl-ptb.discordapp.net/apps/linux/$pkgver/$pkgname-$pkgver.tar.gz"
        'LICENSE'
        'OSS-LICENSES::https://discordapp.com/licenses')
sha512sums=('654f2b600ebce5058dd74d5676a6d40e70a9eecf8351a61601206ccbcd88631fd25b42f0db532b5195285bb8e227d746d433d132b09fae4f77f5dfabc154f8c8'
            '2478ed8c0c3f086cfa9e6f8a7f8264a3a0f20364b940f888efe7a695f54f103523547e9b95db046776d7d9c820447436fbf65e557daf583947a6bbef5620971d'
            'SKIP')

prepare() {
  cd $_pkgname

  sed -i "s|Exec=.*|Exec=/usr/bin/$pkgname|" $pkgname.desktop
  echo 'Path=/usr/bin' >> $pkgname.desktop
}

package() {
  # Install the app
  install -d "$pkgdir"/opt/$pkgname
  cp -a $_pkgname/. "$pkgdir"/opt/$pkgname

  chmod 755 "$pkgdir"/opt/$pkgname/$_pkgname

  rm "$pkgdir"/opt/$pkgname/postinst.sh

  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  ln -s /opt/$pkgname/$_pkgname "$pkgdir"/usr/bin/$pkgname
  ln -s /opt/$pkgname/discord.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  ln -s /opt/$pkgname/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Replacement symlinks
  ln -sf /usr/lib/opera/lib_extra/libffmpeg.so "$pkgdir"/opt/$pkgname/libffmpeg.so
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$pkgname/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$pkgname/libGLESv2.so
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$pkgname/swiftshader/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$pkgname/swiftshader/libGLESv2.so

  # Licenses
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 OSS-LICENSES "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES

  # Cut HTML from licenses file (remove lines 1-34 and everything from '">' to EOF)
  sed -i '1,34d;/^">/,$d' "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES
}

