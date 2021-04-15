# Maintainer: DuckSoft <realducksoft@gmail.com>
# Maintainer: database64128 <free122448@hotmail.com>

pkgbase=shadowsocks-uri-generator-git
pkgname=(ss-uri-gen-git ss-uri-gen-chatbot-telegram-git ss-uri-gen-rescue)
pkgver=20210413.r130.3ca93b1
pkgrel=1
arch=(x86_64)
url="https://github.com/database64128/shadowsocks-uri-generator"
license=('GPL3')
makedepends=('git' 'dotnet-sdk>=5.0')
source=("$pkgbase::git+$url")
options=(!strip)
b2sums=(SKIP)

pkgver() {
	cd $srcdir/$pkgbase
	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local count=$(git rev-list --count HEAD)
	local commit=$(git rev-parse --short HEAD)
	echo "$date.r${count}.$commit"
}

build() {
    _build ShadowsocksUriGenerator.CLI
    _build ShadowsocksUriGenerator.Chatbot.Telegram
    _build ShadowsocksUriGenerator.Rescue.CLI
}

_build() {
	pushd $pkgbase
	dotnet publish $1 -c Release \
		-p:DefineConstants=PACKAGED \
		-p:PublishSingleFile=true \
		-p:PublishTrimmed=true \
		-p:TrimMode=link \
		-p:DebuggerSupport=false \
		-p:EnableUnsafeBinaryFormatterSerialization=false \
		-p:EnableUnsafeUTF7Encoding=false \
		-p:InvariantGlobalization=true \
		-r linux-x64 --self-contained
	popd
}

package_ss-uri-gen-git() {
	pkgdesc="CLI for managing federated Shadowsocks servers, automating deployments of Outline servers, and SIP008 online config"
	provides=(ss-uri-gen)
	conflicts=(ss-uri-gen)
	install -Dm755 -t $pkgdir/usr/bin/ $srcdir/$pkgbase/ShadowsocksUriGenerator.CLI/bin/Release/net5.0/linux-x64/publish/ss-uri-gen
	install -Dm644 -t $pkgdir/usr/lib/systemd/user/ $srcdir/$pkgbase/systemd/user/ss-uri-gen.service
}

package_ss-uri-gen-chatbot-telegram-git() {
	pkgdesc="Telegram bot allowing easy user interactions with Shadowsocks URI Generator"
	provides=(ss-uri-gen-chatbot-telegram)
	conflicts=(ss-uri-gen-chatbot-telegram)
	install -Dm755 -t $pkgdir/usr/bin/ $srcdir/$pkgbase/ShadowsocksUriGenerator.Chatbot.Telegram/bin/Release/net5.0/linux-x64/publish/ss-uri-gen-chatbot-telegram
	install -Dm644 -t $pkgdir/usr/lib/systemd/user/ $srcdir/$pkgbase/systemd/user/ss-uri-gen-chatbot-telegram.service
}

package_ss-uri-gen-rescue-git() {
	pkgdesc="Rescue tool for restoring ss-uri-gen config from generated online config directory"
	provides=(ss-uri-gen-rescue)
	conflicts=(ss-uri-gen-rescue)
	install -Dm755 -t $pkgdir/usr/bin/ $srcdir/$pkgbase/ShadowsocksUriGenerator.Rescue.CLI/bin/Release/net5.0/linux-x64/publish/ss-uri-gen-rescue
}
