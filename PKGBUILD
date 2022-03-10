# Maintainer: Khorne <khorne AT khorne DOT me>
# Contributor: Knut Ahlers <knut at ahlers dot me>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tyler Langlois <ty |at| tjll |dot| net>

pkgbase=beats
pkgname=(metricbeat filebeat packetbeat heartbeat-elastic auditbeat)
pkgver=8.1.0
pkgrel=1
pkgdesc='Data shippers for Elasticsearch'
arch=('x86_64')
url='https://www.elastic.co/products/beats'
license=('Apache')
depends=('glibc')
makedepends=('go' 'git' 'libpcap' 'rsync' 'python-virtualenv' 'audit' 'systemd')
optdepends=('elasticsearch: for standalone installation'
            'python: for migration script')
options=('!makeflags')
source=("https://github.com/elastic/beats/archive/v$pkgver/beats-$pkgver.tar.gz"
        "glibc2.35-compatibility.patch::https://patch-diff.githubusercontent.com/raw/elastic/beats/pull/30620.patch"
        "filebeat.service"
        "packetbeat.service"
        "metricbeat.service"
        "heartbeat.service"
        "auditbeat.service"
        "tmpfile.conf")
sha512sums=('dd2cf3c7f9788fd083b07cef325c431e0960b81ccaf82e9bf4aaf5ac499638522fa375eb65251d304d12fba9e9d73e05b35a53a0892e0dcbe0112f8fa705e0b7'
            '232f467a5cc2bd04a9ccb1c62edd18860a43b223f9e9a56b5aedbcbb29c7d188190b433f51c6c83606a95b9fedfb01e8ad2d1bbbc739675fc0c627c657389bda'
            '4d8b160482ba27bdc63c79592f310f2c9bcd2e8e5d3aec5ba9d953f37916bffef57c0f21e3776f4712f87e9a1b90e42dba6058f72bbc4c75380a959276183a59'
            'f1e6fe6b677db31326433f4e3eef72356573c6947d653dbe6bc2151581444f80e09343fbf8544952aae82a061b87705e39c8741ea8e402ad53ac3552f532cfea'
            '7e4081b5173d1b58a783f1808f1a9ba4548498de87bdfc1960538d6df4f4da8f900f0e027aeff83ebfe0d81e6aa91db77c520bda76441e6bcaa6fd8a79fbb57a'
            '5f20f160fea1d517d98cf220dc15ca7fa883fbbb3fde78255bbdd6f70ae556b4d750462af49599e27fefdc435761eedcc8bd06f4870211bc35bffa246e1e9dd3'
            'f9e015a0789946ff78a62839c9d0af40e557774e14df6de9008d5fa7786377131c74111332496ec7e6303467eb4151b185a2a4cfaa8a1e77c894be50fc22d69b'
            'b6bf266c04395c6733f0e57c5acf1d8f385a2b898c36f0af201c0702ac8c8c77cbad925c01670d799a1f173e85745a17baa13fda48119b2e022f9c47f9ce4fc9')

prepare() {
    export GOPATH="$srcdir"/go
    mkdir -p "$GOPATH"
    cd "$srcdir"/beats-$pkgver
    patch -p1 < ../../glibc2.35-compatibility.patch
    git init # git root required by one of the build scripts

    # Perform some timestomping to avoid make warnings
    LANG=C _t="$(date -r Makefile +'%Y-%m-%d %k:%M:%S')"
    touch -m -d "$_t" */Makefile

    # Use version instead of commit id
    sed -ri "s/^COMMIT_ID=.*/COMMIT_ID=$pkgver/" libbeat/scripts/Makefile
    sed -ri "s/\bcommitHash, err =.*/commitHash = \"$pkgver\"\nerr = nil/;/github.com\/magefile\/mage\/sh/d" dev-tools/mage/settings.go

    # Use version of MarkupSafe with fix for setuptools
    sed -i "s/MarkupSafe==1\.0/MarkupSafe==1.1.1/" libbeat/tests/system/requirements.txt

    # Missing BEAT_NAME in metricbeat Makefile
    sed -i '1i BEAT_NAME?=metricbeat' metricbeat/Makefile
}

build() {
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GOPATH="$srcdir"/go
    export PATH="$GOPATH/bin:$PATH"

    cd "$srcdir"/beats-$pkgver
    cd libbeat
    make update

    for beat in ${pkgname[@]}; do
        beat="${beat%-elastic}"
        echo "-> Building $beat..."
        cd ../$beat
        if [[ $beat == "metricbeat" ]]; then
            make mage
            mage build
        else
            make $beat
        fi
        mage update
    done
}

_do_package_beat() {
    _pkgname="${pkgname%-elastic}"

    backup=(etc/$_pkgname/$_pkgname.yml)

    install -dm755 "$pkgdir"/{etc,usr/share,usr/share/licenses,var/lib}/$_pkgname
    install -dm755 "$pkgdir"/usr/lib/tmpfiles.d

    cd "$srcdir"/beats-$pkgver
    install -Dm644 NOTICE.txt "$pkgdir"/usr/share/licenses/$pkgname/NOTICE.txt

    cd $_pkgname

    cp $_pkgname.{yml,reference.yml} "$pkgdir"/etc/$_pkgname
    install -Dm644 fields.yml "$pkgdir"/etc/$_pkgname/fields.yml

    install -Dm755 $_pkgname \
                   "$pkgdir"/usr/bin/$_pkgname
    install -Dm644 "$srcdir"/$_pkgname.service \
                   "$pkgdir"/usr/lib/systemd/system/$_pkgname.service

    sed "s/BEATNAME/$_pkgname/g" "$srcdir"/tmpfile.conf > "$pkgdir"/usr/lib/tmpfiles.d/$_pkgname.conf

    if [ -d build/kibana ]; then
        cp -R build/kibana "$pkgdir"/usr/share/$_pkgname/
    elif [ -d _meta/kibana.generated ]; then
        cp -R _meta/kibana.generated "$pkgdir"/usr/share/$_pkgname/kibana
    fi
}

package_filebeat() {
    pkgdesc='Sends log files to Logstash or directly to Elasticsearch'

    _do_package_beat
    cp -R build/package/modules.d "$pkgdir"/etc/$_pkgname/
    cp -R build/package/module "$pkgdir"/usr/share/$_pkgname/
}

package_packetbeat() {
    pkgdesc='Analyzes network traffic and sends the data to Elasticsearch'
    depends=('libpcap')

    _do_package_beat
}

package_metricbeat() {
    pkgdesc='Server monitoring agent that sends metrics to Elasticsearch'
    conflicts=('topbeat')
    replaces=('topbeat')

    _do_package_beat
    cp -R modules.d "$pkgdir"/etc/$_pkgname/
}

package_heartbeat-elastic() {
    pkgdesc='Ping remote services for availability and log results to Elasticsearch or send to Logstash'
    conflicts=('heartbeat')
    replaces=('heartbeat')

    _do_package_beat
    cp -R monitors.d "$pkgdir"/etc/$_pkgname/
}

package_auditbeat() {
    pkgdesc='Audit the activities of users and processes on your system'
    depends=('audit')
    install='auditbeat.install'

    _do_package_beat
    install -D module/auditd/_meta/audit.rules.d/sample-rules-linux-64bit.conf "$pkgdir"/etc/$_pkgname/audit.rules.d/sample-rules.conf.disabled
}

# vim: ts=4 sw=4 et:
