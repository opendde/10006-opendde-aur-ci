# Maintainer: M0Rf30

pkgname=airtime-git
pkgver=12396.4940c73
pkgrel=1
pkgdesc="Open broadcast software for scheduling and station management."
arch=('i686' 'x86_64')
url="http://www.sourcefabric.org/en/airtime"
license=('GPL3')
depends=('php56' 'php56-gd' 'php56-pear' 'zendframework' 'php56-pgsql' 'php56-apcu'
         'python2' 'python2-virtualenv' 'python2-pip'
         'python2-configobj' 'python2-anyjson' 'python2-amqplib'
         'python2-argparse' 'python2-configobj' 'python2-docopt'
         'python2-kombu' 'mutagen' 'python2-poster'
         'python2-pydispatcher' 'python2-pyinotify' 'python2-pytz'
         'python2-wsgiref'
         'ocaml-soundtouch' 'ocaml-taglib' 'ocaml-ao' 'ocaml-mad' 'ocaml-camomile'
         'ecasound' 'portaudio' 'libsamplerate' 'vo-aacenc'
         'patch'
         'mpg123' 'vorbisgain' 'pwgen' 'vorbis-tools' 'silan' 'lsof'
         'libpulse' 'alsa-utils'
         'liquidsoap'
         'coreutils' 'sudo'
         'curl'
         'opus' 'flac' 'lame'
         'multitail'
         'perl'
         'tar>=1.22' 'unzip' 'gzip>=1.3.12')
optdepends=('rabbitmq: localy hosted rabbitmq server'
            'postgresql: localy hosted Database server'
            'apache: Apache webserver (webserver needed)'
            'nginx: Nginx webserver (webserver needed)')
makedepends=('git' 'python2' 'python2-setuptools')
provides=('airtime')
replaces=('airtime')
backup=('etc/airtime/airtime.conf'
        'etc/airtime/airtime.ini'
        'etc/logrotate.d/airtime-liquidsoap'
        'etc/logrotate.d/airtime-php')
install=airtime.install
source=("airtime::git+https://github.com/sourcefabric/airtime"
        'airtime-media-monitor.service'
        'airtime-liquidsoap.service'
        'airtime-playout.service'
        'airtime.tmpfiles.conf'
	'httpd-airtime.conf')
branch=2.5.x

prepare() {
    cd "$srcdir/airtime"
    grep -rl '/usr/bin/python' 'python_apps' 'utils' | xargs  sed -i "s%/usr/bin/python%/usr/bin/python2%g"
    grep -rl 'www-data' . | xargs  sed -i "s%www-data%http%g"
}

package() {
    cd "$srcdir/airtime"

    web_user=http

    # web frontend
    install -d -m755 "${pkgdir}/usr/share/airtime"
    cp -r "airtime_mvc" "${pkgdir}/usr/share/airtime"
    cp -r "python_apps" "${pkgdir}/usr/share/airtime"
    cp -r "utils" "${pkgdir}/usr/share/airtime"
    chmod -R 755 "${pkgdir}/usr/share/airtime"

    install -d -m644 "${pkgdir}/usr/share/doc/airtime/examples/"
    cp -r "widgets" "${pkgdir}/usr/share/doc/airtime/examples/"
    chmod -R 755 "${pkgdir}/usr/share/doc/airtime/examples/"
    install -D -m644 "CREDITS" "${pkgdir}/usr/share/doc/airtime/CREDITS"
    install -D -m644 "README" "${pkgdir}/usr/share/doc/airtime/README"
    install -D -m644 "changelog" "${pkgdir}/usr/share/doc/airtime/changelog"

    install -D -m644 "LICENSE" "${pkgdir}/usr/share/doc/airtime/LICENSE"
    install -D -m644 "LICENSE_3RD_PARTY" "${pkgdir}/usr/share/licenses/airtime/LICENSE_3RD_PARTY"

    install -D -m644 "../airtime.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/airtime.conf"
    install -D -m644 "airtime_mvc/build/airtime-php.logrotate" "${pkgdir}/etc/logrotate.d/airtime-php"
    install -D -m644 "python_apps/pypo/liquidsoap/airtime-liquidsoap.logrotate" "${pkgdir}/etc/logrotate.d/airtime-liquidsoap"

    install -d -m777 "${pkgdir}/var/tmp/airtime/show-recorder/"

    install -d -m755 "${pkgdir}/var/log/airtime"

    install -d -m777 "${pkgdir}/var/tmp/airtime"

    install -d -m655 "${pkgdir}/etc/airtime"
    install -d -m655 "${pkgdir}/usr/share/php/"
#Zend
    ln -sr /usr/share/zendframework "${pkgdir}/usr/share/php/Zend"
    ln -sr /usr/share/zendframework "${pkgdir}/usr/share/php/libzend-framework-php"
 
   install -D -m644 "airtime_mvc/build/airtime.example.conf" "${pkgdir}/etc/airtime/airtime.conf"
    install -D -m644 "installer/php/airtime.ini" "${pkgdir}/etc/php56/conf.d/airtime.ini"
    install -D -m644 ../httpd-airtime.conf "${pkgdir}/etc/httpd/conf/extra/httpd-airtime.conf"

    install -D -m644 ../airtime-media-monitor.service "${pkgdir}/usr/lib/systemd/system/airtime-media-monitor.service"
    install -D -m644 ../airtime-liquidsoap.service "${pkgdir}/usr/lib/systemd/system/airtime-liquidsoap.service"
    install -D -m644 ../airtime-playout.service "${pkgdir}/usr/lib/systemd/system/airtime-playout.service"

    # python apps
    python2 "python_apps/std_err_override/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
    python2 "python_apps/api_clients/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
    python2 "python_apps/media-monitor/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
    python2 "python_apps/pypo/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin

    chmod -R 777 "${pkgdir}/var/tmp/airtime"
    chmod -R 755 "${pkgdir}/var/log/airtime"

    chown -R ${web_user}:${web_user} "${pkgdir}/var/tmp/airtime"
    chown -R ${web_user}:${web_user} "${pkgdir}/var/log/airtime"
    chown -R ${web_user}:${web_user} "${pkgdir}/etc/airtime"
    
msg2 "Cleaning..."
    rm -r "${pkgdir}/etc/init"
    rm -r "${pkgdir}/etc/init.d"
}

pkgver() {
  cd airtime
  echo $(git rev-list --count $branch).$(git rev-parse --short $branch)
}

md5sums=('SKIP'
         '4e40e6b0f7fa9ec7eb8e5356bf817bd3'
         'fc4a319d43a96f0003f348c7ddd8aca2'
         '93f750480f7c49d72cdcdb10cd97c089'
         'd9c15aaa7b1da14acc99e047f58aac66'
         '8eefec225e6686d40cdebed21e7ae876')
