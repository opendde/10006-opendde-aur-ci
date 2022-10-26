# Maintainer: ZhangHua<zhanghua.00@qq.com>

pkgname=aria2cd
pkgver=1.3
pkgrel=1
pkgdesc="A systemd Service to start aria2 automatically."
arch=("any")
url="https://aur.archlinux.org/packages/aria2cd"
license=(custom:WTFPL)
depends=(aria2 systemd)
optdepends=(
	'curl: for getting tracker list')
source=(
	tracker-config.sh
	update-aria2-tracker
	notify-user-and-copy-config
	${pkgname}.hook
	aria2.conf
	aria2.sysusers
	aria2.tmpfiles
	aria2-tracker-update-user.service
	aria2-tracker-update-user.timer
	aria2-user.service
	aria2-user.target
	aria2-tracker-update-system.service
	aria2-tracker-update-system.timer
	aria2-system.service
	aria2-system.target
	aria2@.service
	LICENSE::http://www.wtfpl.net/txt/copying
)
sha256sums=('85f465f6f32a1713f65c389b57f81d26cecfb1e7baf06c38f6b9477818fc4f85'
            '0439636c692c98af9c62298b702e174b03f0f44b98ac102a886abcdbb2b237f6'
            '1046d5807ff575276aad2307560d4281215b3f8fadcc6993864af93dbcde8a2e'
            'bdfecc359414d95396c6d19990e262d82a3240a01645a96e38e351fc8c27846e'
            'd3dc278eeddbc910c775124bf474aa2c68b7bbba30226f6322ffc2c457785d27'
            'ada4e985d9023c6e0f79a8bf8bc77af609f56f832dccd287c45bb62a2bb74946'
            '6c02f6fd75db7070f152689121a7485514f1b59aa8ec5afa92d4aaaf300ab2b2'
            'b029289fcd6f2f157a5fbd873dc9d4b9bf3cfde28539aae4b42a1d9508514a1b'
            '1af86e36a0c23c082c953f344a8399197e376dce45bcd1cb185531c9dd70c298'
            '3101ff77a7c9a44461b8dc77f0a1608b24973e828b2eacb3b39ada647a338355'
            '52cc83e9bb223fd69f297df0cd3364af3797d48b938d306bd6e698943cf2d6ef'
            '5413e0e4be63ed2e9492100969417377094fb6751de990671ba5eefc417a28aa'
            'dd36e49fb24c65bbf6685ebe52933a795a69f65d19c43a498d947342a322b8fa'
            'f1f893ebb83c91e36b58176e223fe1248a6ad7fdd7579da4597d5452ad7c698f'
            '747eb9007dd65175c433d81e873840dca1482dfaa0b847ec8661be108fd59877'
            '1ee51459337fafc9767734d1274cedbc1d5bf5c3092c98040235b7360a9b5925'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5')
package(){
	mkdir -p "${pkgdir}/usr/share/aria2"
	touch "${pkgdir}/usr/share/aria2/dht.dat"
	touch "${pkgdir}/usr/share/aria2/dht6.dat"
	touch "${pkgdir}/usr/share/aria2/aria2.session"
	install -Dm644 "${srcdir}/aria2.conf" "${pkgdir}/usr/share/aria2/aria2.conf"
	install -Dm644 "${srcdir}/tracker-config.sh" "${pkgdir}/usr/share/aria2/tracker-config.sh"
	install -Dm644 "${srcdir}/aria2@.service" "${pkgdir}/usr/lib/systemd/system/aria2@.service"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
	install -Dm755 "${srcdir}/notify-user-and-copy-config" \
		"${pkgdir}/usr/share/libalpm/scripts/notify-user-and-copy-config"
	install -Dm755 "${srcdir}/update-aria2-tracker" "${pkgdir}/usr/bin/update-aria2-tracker"
	install -Dm644 "${srcdir}/aria2.sysusers" "${pkgdir}/usr/lib/sysusers.d/aria2cd.conf"
	install -Dm644 "${srcdir}/aria2.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/aria2cd.conf"
	for target in user system
	do
		install -Dm644 "${srcdir}/aria2-tracker-update-${target}.service" \
			"${pkgdir}/usr/lib/systemd/${target}/aria2-tracker-update.service"
		install -Dm644 "${srcdir}/aria2-tracker-update-${target}.timer" \
			"${pkgdir}/usr/lib/systemd/${target}/aria2-tracker-update.timer"
		install -Dm644 "${srcdir}/aria2-${target}.service" \
			"${pkgdir}/usr/lib/systemd/${target}/aria2.service"
		install -Dm644 "${srcdir}/aria2-${target}.target" \
			"${pkgdir}/usr/lib/systemd/${target}/aria2.target"
	done
}
