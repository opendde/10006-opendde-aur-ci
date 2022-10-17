# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
pkgver=4.28.184
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, using the system Electron package"
arch=('x86_64')
url="https://slack.com/downloads/linux"
license=('custom:proprietary')
depends=('electron20')
optdepends=('libappindicator-gtk3: for notification indicator in the status bar on GNOME')
provides=("slack-desktop")
conflicts=("slack-desktop")
source=("$pkgname-$pkgver.deb::https://downloads.slack-edge.com/releases/linux/$pkgver/prod/x64/slack-desktop-$pkgver-amd64.deb"
        'slack.sh')
sha256sums=('a8073dac725b33b966a8dc4e70e4a7aa7ba26f9cc9d11cb78401ab8bc0ca225a'
            'cda3a8ac300697ff5a5516eb9662e7a4f482894ddd17fdf07abc7027d7de8bbe')

prepare() {
	bsdtar -xf data.tar.xz

	# Enable slack silent mode and fix icon
	sed -ri \
	-e 's|^(Exec=.+/slack)(.+)|\1 -s\2|' \
	-e 's/^Icon=.+slack\.png/Icon=slack/' \
	"usr/share/applications/slack.desktop"
}

package() {
	install -D "slack.sh" "$pkgdir/usr/bin/slack"
	install -d "$pkgdir/usr/lib/slack/"
	cp -a --no-preserve=ownership usr/lib/slack/resources/* "$pkgdir/usr/lib/slack/"
	install -Dm644 "usr/share/applications/slack.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "usr/share/pixmaps/slack.png" -t "$pkgdir/usr/share/pixmaps"
	install -Dm644 "usr/lib/slack/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
