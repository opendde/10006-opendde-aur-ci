# Maintainer : Wabuo <spam.wabuo@googlemail.com>

pkgname=hiawatha-monitor
pkgver=1.4
pkgrel=1
pkgdesc="The Hiawatha Monitor is a monitoring tool for the Hiawatha webserver. It can be used to keep track of the performance and security of all your Hiawatha webservers via one single interface."
arch=('any')
url="https://www.hiawatha-webserver.org/monitor"
license=('custom')
source=("https://www.hiawatha-webserver.org/files/monitor-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/hsleisink/monitor/master/LICENSE'
        'https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/hiawatha-monitor/hiawatha_monitor.conf'
        'https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_delete_old_logs.service'
        'https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_delete_old_logs.timer'
        'https://github.com/Wabuo/PKGBUILD/raw/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_fetch_webserver_logs.service'
        'https://github.com/Wabuo/PKGBUILD/raw/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_fetch_webserver_logs.timer'
        'https://github.com/Wabuo/PKGBUILD/raw/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_send_reports.service'
        'https://github.com/Wabuo/PKGBUILD/raw/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_send_reports.timer'
        'https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/hiawatha-monitor/hiawatha_monitor.conf.sig'
        'https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_delete_old_logs.service.sig'
        'https://raw.githubusercontent.com/Wabuo/PKGBUILD/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_delete_old_logs.timer.sig'
        'https://github.com/Wabuo/PKGBUILD/raw/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_fetch_webserver_logs.service.sig'
        'https://github.com/Wabuo/PKGBUILD/raw/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_fetch_webserver_logs.timer.sig'
        'https://github.com/Wabuo/PKGBUILD/raw/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_send_reports.service.sig'
        'https://github.com/Wabuo/PKGBUILD/raw/master/hiawatha-monitor/systemd_timers/hiawatha-monitor_send_reports.timer.sig'
)
validpgpkeys=('E50EF6D35253C390580747781D3F7F8594C766C9') # Wabuo

#The devolopers don't provide any checksums! Checksums generated by me!
sha256sums=('93927b8c720fc2a1d4ab9e87807a70f99da175e16efa0195bc4541ae4edbe2a7'
            'ce91ce4895c9fed0a1719bfeb8ed6e9d63b4350644200b2b2a34f87f1683ce3c'
            '7c260307694248c48b306a8aab2c24d841b763020a908a93a18a5896c188a739'
            '6cb495368e89ad3f5ffc24f1f83de82f62431066578cbf308d2154915ccf0f2e'
            '1ac0f4afbf57aa2189e17d2b6b6490b611b3dbd8563b1ab46023f75ada3632eb'
            '0ffb9c4c6cc73c085d00f7f85d8935cdd509e588558f60d6e11039bf4521e448'
            'eb6ffd6191efe008006cbdcc50dcfe7164a2a99fabada23fdedd1f7e6e9e2175'
            '904a3dd1740f534196838f2056ffd72d7dbcc864fe25180f28a23ee2d33084de'
            '3cd1bff3794b6d7cb2e7a051bb3a724a95e67751c3573eefcc521209f1449a78'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

install=${pkgname}.install

package() {
  install -d "${pkgdir}/etc/webapps/${pkgname}"
  install -d "${pkgdir}/usr/share/webapps/${pkgname}"
  install -d "${pkgdir}/etc/systemd/system/"

  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "${srcdir}/hiawatha_monitor.conf" "${pkgdir}/etc/webapps/${pkgname}/hiawatha_monitor.conf"

  cp -a ./monitor/* "${pkgdir}/usr/share/webapps/${pkgname}"
  cp ./*{.service,.timer} "${pkgdir}/etc/systemd/system/"

  ln -s "/usr/share/webapps/${pkgname}/settings" "${pkgdir}/etc/webapps/${pkgname}/settings"
}
