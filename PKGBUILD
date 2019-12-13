# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>
# Contributor: Morris Jobke <hey AT morrisjobke DOT de>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=blackfire-agent
pkgver=1.30.2
pkgrel=1
pkgdesc='Blackfire Profiler Agent - Fire up your PHP Apps Performance'
arch=('i686' 'x86_64')
url='https://blackfire.io'
license=('custom')
install='blackfire-agent.install'
depends=('glibc')

source=('blackfire-agent.service')
source_i686=("blackfire-agent-${pkgver}_i686::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_386")
source_x86_64=("blackfire-agent-${pkgver}_x86_64::http://packages.blackfire.io/binaries/blackfire-agent/$pkgver/blackfire-agent-linux_amd64")

sha256sums=('aec343bca2f712d0dd22ccb43128d479e0280847e9573c2f37c183478f1ebcf6')
sha256sums_i686=('ce6e3be96e5f242decd8c5c3e0f372efa5f02c09930f107526c186691b91c434')
sha256sums_x86_64=('f94949c50a0d326b48576fa834d02846a3531a8acf62dbfd8f70cca09c7d0cd1')

package(){
  install -dm 755 "$pkgdir"/etc/blackfire
  chown 487:487 "$pkgdir"/etc/blackfire
  install -dm 755 "$pkgdir"/var/log/blackfire

  install -Dm 755 blackfire-agent.service "$pkgdir"/usr/lib/systemd/system/blackfire-agent.service
  install -Dm 755 blackfire-agent-${pkgver}_$CARCH "$pkgdir"/usr/bin/blackfire-agent
}
