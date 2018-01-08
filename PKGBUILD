# Maintainer: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Idares <idares at seznam dot cz>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# Contributor: Vadym Abramchuk <abramm@gmail.com>
# Contributor: karol_007 <karol.blazewicz@gmail.com>

pkgname=zabbix-agent-lts
pkgver=3.0.14
pkgrel=1
pkgdesc="Software designed for monitoring availability and performance of IT infrastructure components"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.zabbix.com"
license=('GPL')
backup=('etc/zabbix/zabbix_agent.conf'
        'etc/zabbix/zabbix_agentd.conf'
		)
install="zabbix-agent.install"
source=("http://downloads.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/$pkgver/zabbix-$pkgver.tar.gz"
        "zabbix-agent.install"
		"zabbix-agentd.service"
		"zabbix-agentd.tmpfiles"
		)
provides=(zabbix-agent)
replaces=(zabbix-agent)
conflicts=(zabbix-agent)

sha512sums=('b024de610b86bd45fc0be655e8275daf53b1de813e13a1e78cfad149b1191a7f118862646f5ded43938bc489ff0b0f325de36d4b2c076ce6fe768ee4234eb944'
            '2a918643877e102a1e7055b423efa800ab45c5566b0329bddeeae019aed8d8cd3989b7303640e5d28b37c49e612a4287ab7f8745771dd7ebcaac2f1abf2e0645'
            '95cb6edb45e8dd45120657bb2a9fef1b3fca3950059820deb7cb5b55efd0ff00ef08f2da539c6ceed98f80421b77fa35079ccb1673d21c7bec94f78e7f111359'
            '3c63a2791e6ac77cb3144eb47a275cc8748f5c8943a076052300d6964994b95b18d60f504584fdcb683739dc514261402895e3f30ae2fbdb218acbc42c3d72df')


build() {
	cd $srcdir/zabbix-$pkgver
	./configure \
		--prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/zabbix \
		--enable-ipv6 \
		--with-libcurl \
		--with-openssl \
		--enable-agent
	make
}

package() {
	cd $srcdir/zabbix-$pkgver
	make DESTDIR=$pkgdir install

	install -d -m0750 $pkgdir/var/log/zabbix

	install -D -m0644 $srcdir/zabbix-agentd.service $pkgdir/usr/lib/systemd/system/zabbix-agentd.service

	# change pid file location
	sed -i 's:# PidFile=.*:PidFile=/run/zabbix/zabbix_agentd.pid:' $pkgdir/etc/zabbix/zabbix_agentd.conf
	# change log file location
	sed -i 's:^LogFile=.*:LogFile=/var/log/zabbix/zabbix_agentd.log:' $pkgdir/etc/zabbix/zabbix_agentd.conf

	# tmpfile
	install -D -m 0644 $srcdir/zabbix-agentd.tmpfiles $pkgdir/usr/lib/tmpfiles.d/zabbix-agentd.conf
}

