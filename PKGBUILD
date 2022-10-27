# Maintainer: ZhangHua<zhanghua.00@qq.com>

pkgname=aria2cd
pkgver=1.3
pkgrel=12
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
            'c97d987a51925c4a8b76ca45f97df63c0ea2f9301040c7460294407117b49bc6'
            '1046d5807ff575276aad2307560d4281215b3f8fadcc6993864af93dbcde8a2e'
            'bdfecc359414d95396c6d19990e262d82a3240a01645a96e38e351fc8c27846e'
            'd3dc278eeddbc910c775124bf474aa2c68b7bbba30226f6322ffc2c457785d27'
            'ada4e985d9023c6e0f79a8bf8bc77af609f56f832dccd287c45bb62a2bb74946'
            '6c02f6fd75db7070f152689121a7485514f1b59aa8ec5afa92d4aaaf300ab2b2'
            '98f23383ca1a1264fe9c418580c70eaba3fde2811ae57dab7c9bb48f0d924572'
            'f3a81fd686335d8f45bc3aa3075979da40b93945d9b155c0e00d259de94499c1'
            '1ab7c6bc690f82838205aec3ecd7482c3e582017c5462119e6ac57603fd12f3b'
            '2ab0b3c87f29f0b37fff593f9379fb6662775c6d3ce11342a0136a267c5fc8a2'
            '0ef8368cf4c9aaf4b04268ce71163da4ae3c26bd8b2093516f855ba98b6f3d86'
            'f11e1d678b0fcd14f961b1e3ba7888f7ce76fc27e81fc5d6e8e442527e7a0d0d'
            '5797ee69e214f2c59cfd8d20c4287da97e0955264fa25cb43add56d5097981a0'
            'ce7de392ff23ac33fda6fa0eebe347aa591e9760b8aee140353b8e00cb93c80e'
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
