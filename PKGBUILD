_phpbase="82"
_suffix=""
pkgver="8.2.0beta1"
pkgrel="3"
pkgbase="php82"
pkgdesc="PHP 8.2.0 pre-release compiled as to not conflict with mainline php"
_cppflags=" -DU_USING_ICU_NAMESPACE=1 "
_build_apache_cfg="etc/httpd/conf/extra"
_build_bundled_gd="0"
_build_conf_d="etc/php82/conf.d"
_build_fpm_name="php-fpm82"
_build_fpm_service_name="php82-fpm"
_build_icu_src_dir="icu/source"
_build_ini_per_sapi="0"
_build_mysql_socket="/run/mysqld/mysqld.sock"
_build_openssl_v10_patch="0"
_build_openssl_v11_patch="0"
_build_per_sapi="0"
_build_phpdbg="1"
_build_sapi_ini_apache="etc/php82"
_build_sapi_ini_cgi="etc/php82"
_build_sapi_ini_cli="etc/php82"
_build_sapi_ini_embed="etc/php82"
_build_sapi_ini_fpm="etc/php82"
_build_sapi_ini_litespeed="etc/php82"
_build_sapi_ini_phpdbg="etc/php82"
_build_sapi_litespeed="--enable-litespeed"
_build_shared_gd="1"
_build_shared_json="0"
_build_shared_libedit="0"
_build_shared_mysqlnd="1"
_build_shared_openssl="1"
_build_shared_pdo="1"
_build_system_timezonedb="1"
_build_update_sqlite="0"
_build_uses_argon="1"
_build_uses_lmdb="1"
_build_with_custom_icu="0"
_pkgver_icu="64-1"
_priority_default="20"
_priority_dom="16"
_priority_json="15"
_priority_mysqlnd="10"
_priority_opcache="10"
_priority_openssl="05"
_priority_pdo="10"
_priority_xml="15"
_suffix=""
_suffix_so=""
pkgname=(
    "php82"
    "php82-cli"
    "php82-cgi"
    "php82-fpm"
    "php82-embed"
    "php82-apache"
    "php82-litespeed"
    "php82-pear"
    "php82-pecl"
    "php82-phpdbg"
    "php82-xml"
    "php82-xsl"
    "php82-xmlreader"
    "php82-xmlwriter"
    "php82-dom"
    "php82-simplexml"
    "php82-openssl"
    "php82-pdo"
    "php82-mysql"
    "php82-phar"
    "php82-pcntl"
    "php82-posix"
    "php82-shmop"
    "php82-sockets"
    "php82-sysvmsg"
    "php82-sysvsem"
    "php82-sysvshm"
    "php82-tokenizer"
    "php82-dba"
    "php82-pgsql"
    "php82-odbc"
    "php82-firebird"
    "php82-dblib"
    "php82-sqlite"
    "php82-gd"
    "php82-exif"
    "php82-tidy"
    "php82-iconv"
    "php82-bcmath"
    "php82-gmp"
    "php82-zip"
    "php82-bz2"
    "php82-fileinfo"
    "php82-ctype"
    "php82-mbstring"
    "php82-pspell"
    "php82-enchant"
    "php82-intl"
    "php82-calendar"
    "php82-gettext"
    "php82-soap"
    "php82-ftp"
    "php82-curl"
    "php82-snmp"
    "php82-ldap"
    "php82-imap"
    "php82-sodium"
    "php82-ffi"
    "php82-opcache"
)
source=(
    "make-tests.patch"
    "pear-config-patcher.php"
    "php-makefile-patcher.php"
    "php-apache.conf"
    "https://downloads.php.net/~pierrick/php-${pkgver}.tar.xz"
)
depends=(
)
checkdepends=(
)
makedepends=(
    "acl"
    "libtool"
    "autoconf"
    "automake"
    "patchelf"
    "gawk"
    "sed"
    "bash"
    "python"
    "libxml2"
    "pam"
    "krb5"
    "zlib"
    "libedit"
    "smtp-forwarder"
    "pcre"
    "apache"
    "ncurses"
    "libxcrypt"
    "systemd"
    "systemd-libs"
    "coreutils"
    "findutils"
    "argon2"
    "libxslt"
    "openssl"
    "e2fsprogs"
    "lmdb"
    "db"
    "postgresql-libs"
    "unixodbc"
    "libfbclient"
    "freetds"
    "sqlite"
    "gd"
    "tidy"
    "gmp"
    "libzip"
    "oniguruma"
    "aspell"
    "enchant"
    "libvoikko"
    "hspell"
    "hunspell"
    "nuspell"
    "aspell"
    "icu"
    "curl"
    "net-snmp"
    "libsasl"
    "libldap"
    "c-client"
    "pam"
    "libsodium"
    "libffi"
)
arch=(
)
_patches=(
)
_sapi_depends=(
    "libxml2"
    "pcre2"
    "libedit"
    "argon2"
)
_ext_depends_snmp=(
    "php82=8.2.0"
    "net-snmp"
    "openssl"
)
_ext_depends_ftp=(
    "php82=8.2.0"
    "openssl"
)
_ext_depends_intl=(
    "php82=8.2.0"
    "icu"
)
_ext_depends_imap=(
    "php82=8.2.0"
    "pam"
    "krb5"
    "c-client"
    "libxcrypt"
    "openssl"
)
_ext_depends_gd=(
    "php82=8.2.0"
    "gd"
)
_ext_depends_mysql=(
    "php82=8.2.0"
    "php82-pdo=8.2.0"
    "php82-openssl=8.2.0"
)
_ext_depends_dba=(
    "php82=8.2.0"
    "db"
    "lmdb"
)
_ext_depends_odbc=(
    "php82=8.2.0"
    "unixodbc"
    "php82-pdo=8.2.0"
)
_ext_depends_pgsql=(
    "php82=8.2.0"
    "postgresql-libs"
    "php82-pdo=8.2.0"
)
_ext_depends_firebird=(
    "php82=8.2.0"
    "libfbclient"
    "php82-pdo=8.2.0"
)
_ext_depends_sqlite=(
    "php82=8.2.0"
    "sqlite"
    "php82-pdo=8.2.0"
)
_ext_depends_mbstring=(
    "php82=8.2.0"
    "oniguruma"
)
_ext_depends_openssl=(
    "php82=8.2.0"
    "krb5"
    "e2fsprogs"
    "openssl"
)
_phpconfig="\
    --prefix=/usr \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --with-layout=GNU \
    --disable-debug \
    --mandir=/usr/share/man \
    --srcdir=../php-${pkgver} \
    --libdir=/usr/lib/php${_phpbase}${_suffix} \
    --datadir=/usr/share/php${_phpbase}${_suffix} \
    --program-suffix=${_phpbase}${_suffix} \
    --with-config-file-scan-dir=/${_build_conf_d} \
    --enable-filter \
    --with-pear \
    --enable-session \
    --with-mhash=/usr \
    --with-kerberos \
    --with-mysql-sock=${_build_mysql_socket} \
    --enable-mysqlnd-compression-support \
    --datarootdir=/usr/share/php${_phpbase}${_suffix} \
    --with-zlib \
    --with-libxml \
    --with-pcre-jit \
    --with-external-pcre=/usr \
    --with-password-argon2=/usr \
    --disable-rpath \
    --config-cache \
    --with-system-tzdata \
    --enable-phpdbg-readline \
    --with-libedit"
_phpextensions="\
    --enable-xml=shared \
    --with-xsl=shared \
    --enable-xmlreader=shared \
    --enable-xmlwriter=shared \
    --enable-dom=shared \
    --enable-simplexml=shared \
    --with-openssl=shared \
    --enable-pdo=shared \
    --enable-mysqlnd=shared \
    --with-mysqli=shared,mysqlnd \
    --with-pdo-mysql=shared,mysqlnd \
    --enable-phar=shared \
    --enable-pcntl=shared \
    --enable-posix=shared \
    --enable-shmop=shared \
    --enable-sockets=shared \
    --enable-sysvmsg=shared \
    --enable-sysvsem=shared \
    --enable-sysvshm=shared \
    --enable-tokenizer=shared
    --enable-dba=shared \
    --with-db4=/usr \
    --without-gdbm \
    --with-cdb \
    --with-lmdb=/usr \
    --with-pgsql=shared,/usr \
    --with-pdo-pgsql=shared,/usr \
    --with-unixODBC=shared \
    --with-pdo-odbc=shared,unixODBC,/usr \
    --with-pdo-firebird=shared,/usr \
    --with-pdo-dblib=shared,/usr \
    --with-pdo-sqlite=shared,/usr \
    --with-sqlite3=shared \
    --enable-gd=shared \
    --with-external-gd=/usr \
    --with-jpeg \
    --with-xpm \
    --with-webp \
    --with-freetype \
    --enable-exif=shared \
    --with-tidy=shared,/usr \
    --with-iconv=shared \
    --enable-bcmath=shared \
    --with-gmp=shared,/usr \
    --with-zip=shared \
    --with-bz2=shared,/usr \
    --enable-fileinfo=shared \
    --enable-ctype=shared \
    --enable-mbstring=shared \
    --with-onig=/usr \
    --enable-mbregex \
    --with-pspell=shared,/usr \
    --with-enchant=shared \
    --enable-intl=shared \
    --enable-calendar=shared \
    --with-gettext=shared,/usr \
    --enable-soap=shared \
    --enable-ftp=shared \
    --with-curl=shared \
    --with-snmp=shared,/usr \
    --with-ldap=shared,/usr \
    --with-ldap-sasl \
    --with-imap=shared,/usr \
    --with-imap-ssl=yes \
    --with-sodium=shared \
    --with-ffi=shared \
    --enable-opcache \
    --enable-huge-code-pages"
_phpextensions_fpm="\
    --with-fpm-user=http \
    --with-fpm-group=http \
    --with-fpm-systemd \
    --with-fpm-acl"


options=('!lto')
arch=("$CARCH")
checkdepends=('procps-ng' 'smtp-forwarder')
license=('PHP')
url='http://www.php.net'


################################################################################
# Prepare it
################################################################################
prepare() {
    pushd "php-${pkgver}"

    echo "[SED] scripts/phpize.in"
    sed -E "s|(includedir[\t ]*=.*/php)|\1${_phpbase}${_suffix}|g" \
        -i scripts/phpize.in

    echo "[SED] scripts/phpize.m4"
    sed -e "s|\[php-config\]|\[php-config${_phpbase}${_suffix}\]|g" \
        -e "s|\(PHP_ARG_WITH(\[php-config\)${_phpbase}${_suffix}\]|\1]|g" \
        -e "s|php-config, no|php-config${_phpbase}${_suffix}, no|g" \
        -i "scripts/phpize.m4"

    echo "[SED] scripts/Makefile.frag"
    sed -E "s|(phpincludedir[\t ]*=.*/php)|\1${_phpbase}${_suffix}|g" \
        -i scripts/Makefile.frag

    echo "[SED] scripts/php-config.in"
    sed -E "s|(include_dir[\t ]*=.*php)|\1${_phpbase}${_suffix}|g" \
        -i scripts/php-config.in

    echo "[SED] sapi/apache2handler/config.m4"
    sed -e '/APACHE_THREADED_MPM=/d' \
        -i sapi/apache2handler/config.m4

    echo "[SED] sapi/fpm/Makefile.frag"
    # sed -e 's#php-fpm\$(program_suffix)#php\$(program_suffix)-fpm#'
    sed -e 's/.conf.default/.conf/g' \
        -i sapi/fpm/Makefile.frag

    echo "[SED] sapi/fpm/php-fpm.service.in"
    sed -E "s|ExecStart[\s]?=[\s]?@([a-zA-Z_]+)@/php-fpm|ExecStart=@\1@/${_build_fpm_name}|g; \
            s|PIDFile[\s]?=[\s]?@([a-zA-Z_]+)@/run/php-fpm.pid|PIDFile=/run/${_build_fpm_service_name}/php-fpm.pid|g" \
        -i sapi/fpm/php-fpm.service.in

    local _check_files=("sapi/fpm/www.conf.in" "sapi/fpm/php-fpm.conf.in");
    for file_conf in "${_check_files[@]}"; do
        if [[ ! -f $file_conf  ]]; then
            continue;
        fi
        echo "[SED] ${file_conf}"
        sed -e "s#^listen =.*#listen = /run/${_build_fpm_service_name}/php-fpm.sock#" \
            -e "s#run/php-fpm.pid#/run/${_build_fpm_service_name}/php-fpm.pid#" \
            -e 's#^;*[ \t]*listen.owner =#listen.owner =#' \
            -e 's#^;*[ \t]*listen.group =#listen.group =#' \
            -e 's#^;*[ \t]*error_log =.*#error_log = syslog#' \
            -e 's#^;*[ \t]*chdir =.*#;chdir = /srv/http#' \
            -i "${file_conf}"
    done

    echo "[SED] php.ini-production"
    sed -e 's#^;*[ \t]*extension_dir[\t ]*=.*/.*$#extension_dir = "___EXTENSIONDIR___"#' \
        -e "s#___EXTENSIONDIR___#/usr/lib/${pkgbase}/modules#g" \
        -e "s#^;*[ \t]*extension=#;extension=#g" \
        -e "s#^;*[ \t]*session.save_path[\t ]*=.*#session.save_path=___SESSIONS___#g" \
        -e "s#___SESSIONS___#/var/lib/${pkgbase}/sessions#g" \
        -i php.ini-production

    for patch_name in "${_patches[@]}"; do
        echo "[PATCH] Applying source patch ${patch_name}";
        patch -p1 -i "../${patch_name}"
    done

    if ((_phpbase <= 53)); then
        PHP_AUTOCONF="/usr/bin/autoconf-2.13" ./buildconf --force
    else
        ./buildconf --force
    fi
    rm -f tests/output/stream_isatty_*.phpt
    rm -f Zend/tests/arginfo_zpp_mismatch*.phpt
    rm -f Zend/tests/bug79919.phpt
    popd
}

_build_sapi() {
    _sapi="${1}"
    _commands="${2}"
    if (( _sapi == "cli" )); then
        if [[ ! -d "build-${_sapi}" ]]; then
            mkdir "build-${_sapi}"
        fi
        pushd "build-${_sapi}"
        if [[ -L configure ]]; then
            rm configure
        fi
        ln -s "../php-${pkgver}/configure"
        popd
    else
        cp -Ta "build-cli" "build-${_sapi}"
    fi

    pushd "build-${_sapi}"
     ./configure ${_phpconfig} ${_commands}
    patch -p1 -i "${srcdir}/make-tests.patch"

    if (($_sapi != "cli")); then
        make clean
    fi
    if ((! _build_with_custom_icu)); then
        sed -i -e 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' \
            -e 's|^runpath_var=LD_RUN_PATH|runpath_var=LIBTOOL_IS_BROKED|g' \
            libtool
    fi
    make
    popd
}

################################################################################
# BUILD them all
################################################################################
build() {
    export EXTENSION_DIR="/usr/lib/${pkgbase}/modules"
    if ((_build_openssl_v10_patch)); then
        export PHP_OPENSSL_DIR="/usr/lib/openssl-1.0"
    fi
    if [[ ! -z "${_cppflags}" ]]; then
        CPPFLAGS+=" $_cppflags "
    fi
    if ((_build_with_custom_icu )); then
        local _php5_icu_first="${srcdir}/${_build_icu_src_dir}/php${_phpbase}${suffix}-icu${_pkgver_icu}"
            LDFLAGS+="-Wl,-rpath=$ORIGIN/usr/lib/${pkgbase}/icu${_pkgver_icu}/lib"
        _phpextensions+=" --with-icu-dir=${_php5_icu_first} "
        if [[ ! -d $_php5_icu_first ]]; then
            mkdir -p "${_php5_icu_first}"
        fi
        pushd "${_build_icu_src_dir}"
        ./configure --prefix="${_php5_icu_first}" \
            --sysconfdir="${_php5_icu_first}/etc" \
            --mandir="${_php5_icu_first}/share/man" \
            --sbindir="${_php5_icu_first}/bin" \
            --libdir="${_php5_icu_first}/lib" \
            --includedir="${_php5_icu_first}/include" \
            --disable-tests \
            --disable-debug
        make -j$(nproc)
        make install
        ./configure --prefix="/usr/lib/${pkgbase}/icu${_pkgver_icu}" \
            --sysconfdir="/usr/lib/${pkgbase}/icu${_pkgver_icu}/etc" \
            --mandir="/usr/lib/${pkgbase}/icu${_pkgver_icu}/share/man" \
            --sbindir="/usr/lib/${pkgbase}/icu${_pkgver_icu}/bin" \
            --libdir="/usr/lib/${pkgbase}/icu${_pkgver_icu}/lib" \
            --includedir="/usr/lib/${pkgbase}/icu${_pkgver_icu}/include" \
            --disable-tests \
            --disable-debug
        make -j$(nproc)
        popd
    fi

    if ((_build_ini_per_sapi || _build_per_sapi)); then

    # CLI
    _cli_addons=''
    if (( ! _build_per_sapi )); then
        # CGI enabled here only for tests passing, then overriden later by cgi build
        _cli_addons+=" --enable-cgi "
    fi
    _build_sapi "cli" "\
        --sysconfdir=/${_build_sapi_ini_cli} \
        --with-config-file-path=/${_build_sapi_ini_cli} \
        --enable-cli \
        ${_phpextensions} \
        ${_cli_addons} \
        --disable-fpm \
        --disable-embed \
        --disable-phpdbg \
    "

    # phpdbg
    if ((_build_phpdbg)); then
        _sapi="phpdbg"
        _build_sapi "phpdbg" "\
            --sysconfdir=/${_build_sapi_ini_phpdbg} \
            --with-config-file-path=/${_build_sapi_ini_phpdbg} \
            --disable-all \
            --enable-phpdbg \
            --disable-cgi \
            --disable-cli \
            --disable-fpm \
            --disable-embed \
        "
    fi

    # embed
    _build_sapi "embed" "\
        --sysconfdir=/${_build_sapi_ini_embed}  \
        --with-config-file-path=/${_build_sapi_ini_embed}  \
        --disable-all \
        --enable-embed=shared \
        --disable-cgi \
        --disable-cli \
        --disable-fpm \
        --disable-phpdbg \
    "

    # cgi
    _build_sapi "cgi" "\
        --sysconfdir=/${_build_sapi_ini_cgi} \
        --with-config-file-path=/${_build_sapi_ini_cgi} \
        --disable-all \
        --enable-cgi \
        --disable-cli \
        --disable-fpm \
        --disable-embed \
        --disable-phpdbg \
    "

    # litespeed
    _cflags="${CFLAGS}"
    export CFLAGS="${CFLAGS} -Wno-error=format-security"
    _build_sapi "litespeed" "\
        --sysconfdir=/${_build_sapi_ini_litespeed} \
        --with-config-file-path=/${_build_sapi_ini_litespeed} \
        --disable-all \
        --disable-cgi \
        --disable-cli \
        --disable-fpm \
        --disable-embed \
        --disable-phpdbg \
        ${_build_sapi_litespeed} \
    "
    export CFLAGS="${_cflags}"

    # fpm
    _build_sapi "fpm" "\
        --sysconfdir=/${_build_sapi_ini_fpm} \
        --with-config-file-path=/${_build_sapi_ini_fpm} \
        --disable-all \
        --enable-fpm \
        ${_phpextensions_fpm} \
        --disable-cli \
        --disable-cgi \
        --disable-embed \
        --disable-phpdbg \
    "
    else

    # CLI
    if ((_build_phpdbg)); then
        _cli_addons+=" --enable-phpdbg "
    fi
    _build_sapi "cli" "\
        --sysconfdir=/${_build_sapi_ini_cli} \
        --with-config-file-path=/${_build_sapi_ini_cli} \
        --enable-cli \
        ${_phpextensions} \
        ${_cli_addons} \
        --enable-fpm \
        --enable-cgi \
        --enable-embed=shared \
        --enable-fpm \
        ${_phpextensions_fpm} \
        ${_build_sapi_litespeed} \
    "
    fi

    # apache
    _build_sapi "apache" "\
        --disable-all \
        --disable-cli \
        --disable-cgi \
        --disable-fpm \
        --disable-embed \
        --disable-phpdbg \
        --with-apxs2 \
        --sysconfdir=/${_build_sapi_ini_apache} \
        --with-config-file-path=/${_build_sapi_ini_apache} \
    "

}

check() {
    pushd "build-cli"
    # Check if sendmail was configured correctly (FS#47600)
    export REPORT_EXIT_STATUS=1
    export NO_INTERACTION=1
    export SKIP_ONLINE_TESTS=1
    export SKIP_SLOW_TESTS=1
    export TESTS='tests Zend'
    if ((_phpbase > 73)); then
        export TEST_PHP_ARGS="-j$(nproc)"
    fi
    # Patch tests to run PHP modules in needed order
    sapi/cli/php -n ../php-makefile-patcher.php Makefile
    make test
    popd
}

################################################################################
# Custom code
################################################################################
_install_module_ini() {
    local extension=$(echo "${1}" | sed 's/\.so//')
    local priority="${_priority_default}"
    case "${extension}" in
        "json")
            priority="${_priority_json}"
            ;;
        "xml")
            priority="${_priority_xml}"
            ;;
        "openssl")
            priority="${_priority_openssl}"
            ;;
        "mysqlnd")
            priority="${_priority_mysqlnd}"
            ;;
        "pdo")
            priority="${_priority_pdo}"
            ;;
        "opcache")
            priority="${_priority_opcache}"
            ;;
        "dom")
            priority="${_priority_dom}"
            ;;
    esac
    local extension_type="extension"
    case "${extension}" in
        "opcache" | "xdebug")
            extension_type="zend_extension"
            ;;
        "recode")
            extension_type=";extension"
            ;;
    esac

    if [[ ! -d "${pkgdir}/${_build_conf_d}" ]]; then
        mkdir -p "${pkgdir}/${_build_conf_d}"
    fi
    echo "${extension_type}=${extension}.so" > "${pkgdir}/${_build_conf_d}/${priority}-${extension}.ini"
    chmod 0644 "$pkgdir/${_build_conf_d}/${priority}-${extension}.ini"
    _last_priority=${priority}
    _last_extension=${extension}
}

_install_module() {
    if [[ -f "build-cli/modules/${1}.so" ]]; then
        install -D -m755 "build-cli/modules/${1}.so" "${pkgdir}/usr/lib/${pkgbase}/modules/${1}.so";
        _install_module_ini "${1}"
    else
        echo "[DEBUG]: Install_module can't find ${1}.so, skipped"
    fi
}

###############################################################################
# PHP: SAPI's
###############################################################################

# Main package
package_php82() {
    # Binary names
    pkgdesc='PHP. A general-purpose scripting language that is especially suited to web development'
    depends=('zlib' 'pcre' 'libedit')
    if ((_build_with_custom_icu)); then
        pushd "${_build_icu_src_dir}"
        make DESTDIR="${pkgdir}" install
        popd
        pushd "${pkgdir}/usr/lib/${pkgbase}/icu${_pkgver_icu}"
        rm -rf bin include share
        popd
    fi

    # Install session dir
    install -d -m1733 "${pkgdir}/var/lib/${pkgbase}/sessions"

    # conf.d dir with shared modules
    install -d -m755 "${pkgdir}/${_build_conf_d}/"

    pushd "build-cli"
    make -j1 INSTALL_ROOT=${pkgdir} install-{modules,build,headers,programs}
    # Cleanup for CGI"
    rm -rf "${pkgdir}/usr/bin/${pkgbase}-cgi"
    popd

    pushd "${pkgdir}/usr/lib/${pkgbase}/modules/"
    # remove static modules
    rm -f *.a
    # remove modules provided by subpackages
    rm -f {enchant,imap,intl,pspell,snmp,tidy,curl,ldap,bz2,bcmath,soap,zip,gmp,dba,opcache,json,gd,mcrypt,sodium,recode}.so
    rm -f {pdo_dblib,mssql}.so
    rm -f {dom,simplexml,xml,xmlreader,xmlwriter,xsl,wddx,xmlrpc}.so
    rm -f {pgsql,pdo_pgsql}.so
    rm -f {odbc,pdo_odbc}.so
    rm -f {pdo_sqlite,sqlite3}.so
    rm -f {pdo_firebird.so,interbase.so}
    rm -f {mysqli,pdo_mysql,mysqlnd,mysql}.so
    rm -f {openssl,ffi,pcntl,ftp,calendar,ctype,fileinfo,iconv,mbstring,exif,pdo,phar,posix,shmop}.so
    rm -f {sockets,tokenizer,gettext,sysvmsg,sysvsem,sysvshm}.so
    popd
    pushd build-cli
    if (( ! _build_ini_per_sapi )); then
        backup=("${_build_sapi_ini_cli}/php.ini")
        install -d -m755 "${pkgdir}/${_build_sapi_ini_cli}"
        install -D -m644 "../php-${pkgver}/php.ini-production" "${pkgdir}/${_build_sapi_ini_cli}/php.ini"
    fi
    popd
}

# Cli + phar
package_php82-cli() {
    _sapi="cli"
    pkgdesc="cli (command-line executable) version for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
    depends+=("${_sapi_depends[@]}")
    pushd "build-${_sapi}"
    make -j1 INSTALL_ROOT="${pkgdir}" install-cli
    make -j1 INSTALL_ROOT="${pkgdir}" install-pharcmd
    if ((_build_ini_per_sapi)); then
        backup=("${_build_sapi_ini_cli}/php.ini")
        install -d -m755 "${pkgdir}/${_build_sapi_ini_cli}"
        install -D -m644 "../php-${pkgver}/php.ini-production" "${pkgdir}/${_build_sapi_ini_cli}/php.ini"
    fi
    # Cleanup for CGI
    rm -rf "${pkgdir}/usr/bin/${pkgbase}-cgi"
    popd
}
# End cli

# CGI
package_php82-cgi() {
    _sapi="cgi"
    pkgdesc="CGI and FCGI SAPI for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
    depends+=("${_sapi_depends[@]}")
    if ((_build_ini_per_sapi || _build_per_sapi)); then
        pushd "build-${_sapi}"
    else
        pushd "build-cli"
    fi
    if ((_build_ini_per_sapi)); then
        install -D -m644 "../php-${pkgver}/php.ini-production" "${pkgdir}/${_build_sapi_ini_cgi}/php.ini"
        backup=("${_build_sapi_ini_cgi}/php.ini")
    fi
    case "${_phpbase}" in
        53 | 54)
            install -D -m755 sapi/cgi/php-cgi "${pkgdir}/usr/bin/${pkgbase}-cgi"
            ;;
        *)
            make -j1 INSTALL_ROOT="${pkgdir}" install-cgi
            ;;
    esac
    popd
}
# CGI end

# Apache
package_php82-apache() {
    _sapi="apache"
    _build_mod_php_so="libphp${_suffix_so}.so"
    _build_mod_php_module="php_module${_suffix_so}"
    _build_build_php_script_name="php${_suffix_so}-script"
    _apache_module_conf="${pkgbase}-module.conf"
    pkgdesc="Apache SAPI for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'apache')
    depends+=("${_sapi_depends[@]}")
    depends+=('libxcrypt');
    depends+=('ncurses');
    backup=("${_build_apache_cfg}/${_apache_module_conf}")
    echo "# End of LoadModule in httpd.conf - see ArchWiki Apache HTTP Server"
    echo "LoadModule ${_build_mod_php_module} modules/lib${pkgbase}.so"
    echo "AddHandler ${_build_php_script_name} .php"
    echo "# End of Include List"
    echo "Include conf/extra/${_apache_module_conf}"

    pushd "build-${_sapi}"
    if ((_build_ini_per_sapi)); then
        backup+=("${_build_sapi_ini_apache}/php.ini")
        install -d -m755 "${pkgdir}/${_build_sapi_ini_apache}"
        install -D -m644 "../php-${pkgver}/php.ini-production" "${pkgdir}/${_build_sapi_ini_apache}/php.ini"
    fi
    install -D -m755 "libs/${_build_mod_php_so}" "${pkgdir}/usr/lib/httpd/modules/lib${pkgbase}.so"
    patchelf --set-soname \
        "lib${pkgbase}.so" \
        "${pkgdir}/usr/lib/httpd/modules/lib${pkgbase}.so"
    popd

    install -D -m644 "php-apache.conf" "${pkgdir}/${_build_apache_cfg}/${_apache_module_conf}"
    echo "[SED] ${pkgdir}/${_build_apache_cfg}/${_apache_module_conf}"
    sed -e "s#@MODULE@#${_build_mod_php_module}#" \
        -i "${pkgdir}/${_build_apache_cfg}/${_apache_module_conf}"
}
# Apache end

# FPM
package_php82-fpm() {
    _sapi="fpm"
    install="php-fpm.install"
    pkgdesc="FastCGI Process Manager for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'systemd-libs' 'acl')
    depends+=("${_sapi_depends[@]}")
    backup=("${_build_sapi_ini_fpm}/php-fpm.conf")
    if ((_phpbase >= 70)); then
        backup+=("${_build_sapi_ini_fpm}/php-fpm.d/www.conf")
    fi
    options=('!emptydirs')
    if ((_build_ini_per_sapi || _build_per_sapi)); then
        pushd "build-${_sapi}"
    else
        pushd "build-cli"
    fi
    if ((_build_ini_per_sapi)); then
        backup+=("${_build_sapi_ini_fpm}/php.ini")
        install -d -m755 "${pkgdir}/${_build_sapi_ini_fpm}/"
        install -D -m644 "../php-${pkgver}/php.ini-production" "${pkgdir}/${_build_sapi_ini_fpm}/php.ini"
    fi
    make -j1 INSTALL_ROOT="${pkgdir}" install-fpm
    install -D -m644 "sapi/fpm/php-fpm.service" "${pkgdir}/usr/lib/systemd/system/${_build_fpm_service_name}.service"
    echo "d /run/${_build_fpm_service_name} 755 root root" > php-fpm.tmpfiles
    install -D -m644 "php-fpm.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_build_fpm_service_name}.conf"
    popd
}
# FPM end

# embed sapi
package_php82-embed() {
    _sapi="embed"
    pkgdesc="Embedded PHP SAPI library for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'ncurses' 'systemd-libs' 'libxcrypt' 'acl' 'ncurses')
    depends+=("${_sapi_depends[@]}")
    options=('!emptydirs')
    if ((_build_ini_per_sapi || _build_per_sapi)); then
        pushd "build-${_sapi}"
    else
        pushd "build-cli"
    fi
    install -d -m755 "${pkgdir}/${_build_sapi_ini_embed}"
    if ((_build_ini_per_sapi)); then
        install -D -m644 "../php-${pkgver}/php.ini-production" "${pkgdir}/${_build_sapi_ini_embed}/php.ini"
        backup=("${_build_sapi_ini_embed}/php.ini")
    fi
    make -j1 INSTALL_ROOT="${pkgdir}" PHP_SAPI=embed install-sapi
    mv "${pkgdir}/usr/lib/libphp${_suffix_so}.so" "${pkgdir}/usr/lib/lib${pkgbase}.so"
    popd
    patchelf --set-soname "lib${pkgbase}.so" "${pkgdir}/usr/lib/lib${pkgbase}.so"
}
# embed sapi end

# phpdbg sapi
package_php82-phpdbg() {
    _sapi="phpdbg"
    options=('!emptydirs')
    pkgdesc="Interactive PHP debugger for ${pkgbase} ($_sapi)"
    depends=("${pkgbase}=${pkgver}")
    depends+=("${_sapi_depends[@]}")
    if ((_build_ini_per_sapi || _build_per_sapi)); then
        pushd "build-${_sapi}"
    else
        pushd "build-cli"
    fi
    if ((_build_ini_per_sapi)); then
        backup=("${_build_sapi_ini_phpdbg}/php.ini")
        install -d -m755 "${pkgdir}/${_build_sapi_ini_phpdbg}"
        install -D -m644 "../php-${pkgver}/php.ini-production" "${pkgdir}/${_build_sapi_ini_phpdbg}/php.ini"
    fi
    make -j1 INSTALL_ROOT="${pkgdir}" "install-${_sapi}"
    popd
}
# phpdbg sapi end

# litespeed sapi
package_php82-litespeed() {
    _sapi="litespeed"
    pkgdesc="LiteSpeed SAPI for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
    depends+=("${_sapi_depends[@]}")
    if ((_build_ini_per_sapi || _build_per_sapi)); then
        pushd "build-${_sapi}"
    else
        pushd "build-cli"
    fi
    if ((_build_ini_per_sapi)); then
        install -D -m644 "../php-${pkgver}/php.ini-production" "${pkgdir}/${_build_sapi_ini_cgi}/php.ini"
        backup=("${_build_sapi_ini_cgi}/php.ini")
    fi
    case "${_phpbase}" in
        *)
            install -D -m755 sapi/litespeed/php "${pkgdir}/usr/bin/ls${pkgbase}"
            ;;
    esac
    popd
}
# litespeed sapi end

###############################################################################
# PEAR + PECL
###############################################################################

# PEAR
package_php82-pear() {
    pkgdesc="PHP Extension and Application Repository (PEAR) for ${pkgbase}"
    depends=(
        "${pkgbase}=${pkgver}"
        "php${_phpbase}-xml${_suffix}=${pkgver}"
        "php${_phpbase}-cli${_suffix}=${pkgver}"
        "php${_phpbase}-phar${_suffix}=${pkgver}"
    )
    #backup=("${_build_sapi_ini_cli}/pear.conf")
    install -d "${pkgdir}/usr/share/${pkgbase}/pear/htdocs"
    install -d "${pkgdir}/usr/share/${pkgbase}/pear/data"
    install -d "${pkgdir}/usr/share/${pkgbase}/pear/doc"
    install -d "${pkgdir}/usr/share/${pkgbase}/pear/test"
    install -d "${pkgdir}/usr/share/${pkgbase}/pear/cfg"
    install -d "${pkgdir}/var/lib/${pkgbase}/pear/cache"
    install -d "${pkgdir}/var/lib/${pkgbase}/pear/metadata"
    install -d "${pkgdir}/var/lib/${pkgbase}/pear/download"
    install -d "${pkgdir}/var/lib/${pkgbase}/pear/temp"
    export PHP_PEAR_SYSCONF_DIR="${_build_sapi_ini_cli}"
    pushd build-cli

    cp "${srcdir}/php-${pkgver}/pear/install-pear-nozlib.phar" "pear/install-pear-nozlib.phar"

    INSTALL_ROOT="${pkgdir}/" ./sapi/cli/php -n \
        -d extension=modules/xml.so \
        -d extension=modules/phar.so \
        -d date.timezone=UTC -d memory_limit=64M -d short_open_tag=0 -d safe_mode=0 \
        -d 'error_reporting=E_ALL&~E_DEPRECATED' -d detect_unicode=0 "pear/install-pear-nozlib.phar" \
        -ds       "${_phpbase}${_suffix}" \
        --php      "/usr/bin/${pkgbase}" \
        --bin      "/usr/bin" \
        --man      "/usr/share/man" \
        --dir      "/usr/share/${pkgbase}/pear" \
        --data     "/usr/share/${pkgbase}/pear/data" \
        --doc      "/usr/share/${pkgbase}/pear/doc" \
        --test     "/usr/share/${pkgbase}/pear/test" \
        --www      "/usr/share/${pkgbase}/pear/htdocs" \
        --config   "/usr/share/${pkgbase}/pear/cfg" \
        --force
    # fix pear.conf with unserialize
    # first arg: path to pear.conf
    # second arg: PEAR base /var path
    ./sapi/cli/php -n ../pear-config-patcher.php \
        "${pkgdir}/${_build_sapi_ini_cli}/pear.conf" \
        "/var/lib/${pkgbase}/pear"
    popd
    # remove unneeded files
    rm -rf "${pkgdir}"/.{channels,depdb,depdblock,filemap,lock,registry}
    #rename binaries
    for i in pear peardev pecl; do
        _target="${pkgbase/php/$i}"
        # fix hardcoded paths
        sed "s|PHP=php|PHP=\"/usr/bin/${pkgbase}\"|g; s|\"/usr/bin/php\"|\"/usr/bin/${pkgbase}\"|g; s| -n | |g" \
            -i "${pkgdir}/usr/bin/${i}"
        if [[ "$i" == "pecl" ]]; then
            echo "Moving ${pkgdir}/usr/bin/${i} => ${srcdir}/${pkgbase}-pecl-bin/"
            mkdir -p "${srcdir}/${pkgbase}-pecl-bin/"
            mv "${pkgdir}/usr/bin/pecl" "${srcdir}/${pkgbase}-pecl-bin/"
        else
            echo "Moving ${pkgdir}/usr/bin/${i} => ${pkgdir}/usr/bin/${_target}"
            mv "${pkgdir}/usr/bin/${i}" "${pkgdir}/usr/bin/${_target}"
        fi
    done
}
# PEAR end

# PECL
package_php82-pecl() {
    pkgdesc="PHP Extension Community Library (PECL) for ${pkgbase}"
    depends=("php${_phpbase}-pear${_suffix}=${pkgver}")
    _target="${pkgbase/php/pecl}"
    install -D -m755 "${srcdir}/${pkgbase}-pecl-bin/pecl" "${pkgdir}/usr/bin/${_target}"
}
# PECL end

###############################################################################
# PHP Modules: First need
###############################################################################

# OpenSSL
package_php82-openssl() {
    pkgdesc="OpenSSL module for ${pkgbase}"
    depends=("${_ext_depends_openssl[@]}")
    _install_module openssl
}

# Json
package_php82-json() {
    pkgdesc="json module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
    _install_module json
}

# pdo
package_php82-pdo() {
    pkgdesc="pdo module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module pdo
}


# mbstring
package_php82-mbstring() {
    pkgdesc="mbstring module for ${pkgbase}"
    depends=("${_ext_depends_mbstring[@]}")
   _install_module mbstring
}


# phar
package_php82-phar() {
    pkgdesc="phar module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module phar
}


###############################################################################
# PHP modules: XML
###############################################################################

# XML modules combined package
package_php82-xml() {
    pkgdesc="xml modules for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'libxml2')
    _install_module xml
}

package_php82-wddx() {
    pkgdesc="wddx module for ${pkgbase}"
    depends=("php${_phpbase}-xml${_suffix}=${pkgver}")
    _install_module wddx
}

package_php82-simplexml() {
    pkgdesc="simplexml module for ${pkgbase}"
    depends=("php${_phpbase}-xml${_suffix}=${pkgver}")
    _install_module simplexml
}

package_php82-dom() {
    pkgdesc="dom module for ${pkgbase}"
    depends=("php${_phpbase}-xml${_suffix}=${pkgver}")
    _install_module dom
}

package_php82-xmlreader() {
    pkgdesc="xmlreader module for ${pkgbase}"
    depends=("php${_phpbase}-xml${_suffix}=${pkgver}")
    _install_module xmlreader
}

package_php82-xmlwriter() {
    pkgdesc="xmlwriter module for ${pkgbase}"
    depends=("php${_phpbase}-xml${_suffix}=${pkgver}")
    _install_module xmlwriter
}

# Tidy
package_php82-tidy() {
    pkgdesc="tidy module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'tidy')
    _install_module tidy
}

# XSL
package_php82-xsl() {
    pkgdesc="xsl module for ${pkgbase}"
    depends=("php${_phpbase}-xml${_suffix}=${pkgver}" "php${_phpbase}-dom${_suffix}=${pkgver}")
    depends+=('libxslt')
    _install_module xsl
}

###############################################################################
# PHP modules: Databases
###############################################################################

# MySQL
package_php82-mysql() {
    pkgdesc="MySQL modules for ${pkgbase}"
    depends=("${_ext_depends_mysql[@]}")
    _install_module mysqlnd
    _install_module mysql
    _install_module mysqli
    _install_module pdo_mysql
}

# pdo_sqlite + sqlite3
package_php82-sqlite() {
    pkgdesc="sqlite module for ${pkgbase}"
    depends=("${_ext_depends_sqlite[@]}")
    _install_module sqlite3
    _install_module pdo_sqlite
}

# ODBC
package_php82-odbc() {
    pkgdesc="ODBC modules for ${pkgbase}"
    depends=("${_ext_depends_odbc[@]}")
    _install_module odbc
    _install_module pdo_odbc
}

# PostgreSQL
package_php82-pgsql() {
    pkgdesc="PostgreSQL modules for ${pkgbase}"
    depends=("${_ext_depends_pgsql[@]}")
    _install_module pgsql
    _install_module pdo_pgsql
}

# interbase
package_php82-interbase() {
    pkgdesc="interbase module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" "libfbclient")
    _install_module interbase
}

# firebird
package_php82-firebird() {
    pkgdesc="pdo_firebird module for ${pkgbase}"
    depends=("${_ext_depends_firebird[@]}")
    _install_module pdo_firebird
}

# pdo_dblib
package_php82-dblib() {
    depends=("${pkgbase}=${pkgver}" 'freetds')
    pkgdesc="pdo_dblib module for ${pkgbase}"
    _install_module pdo_dblib
}

# mssql
package_php82-mssql() {
    depends=("${pkgbase}=${pkgver}" 'freetds')
    pkgdesc="mssql module for ${pkgbase}"
    _install_module mssql
}

# Dba
package_php82-dba() {
    pkgdesc="dba module for ${pkgbase}"
    depends=("${_ext_depends_dba[@]}")
    _install_module dba
}

###############################################################################
# PHP Modules: internationalization, text, datetime
###############################################################################

# Intl
package_php82-intl() {
    pkgdesc="intl module for ${pkgbase}"
    depends=("${_ext_depends_intl[@]}")
    if ((_build_with_custom_icu)); then
        # Patch to proper path inside intl.so
        patchelf --set-rpath "/usr/lib/${pkgbase}/icu${_pkgver_icu}/lib" "build-cli/modules/intl.so"
    fi
    _install_module intl
}

# Recode
package_php82-recode() {
    pkgdesc="recode module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'recode')
    _install_module recode
}

# gettext
package_php82-gettext() {
    pkgdesc="gettext module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module gettext
}

# iconv
package_php82-iconv() {
    pkgdesc="iconv module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module iconv
}

# calendar
package_php82-calendar() {
    pkgdesc="calendar module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module calendar
}


###############################################################################
# PHP Modules: multimedia
###############################################################################

# GD
package_php82-gd() {
    pkgdesc="gd module for ${pkgbase}"
    depends=("${_ext_depends_gd[@]}")
    _install_module gd
}

# exif
package_php82-exif() {
    pkgdesc="exif module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module exif
}

# fileinfo
package_php82-fileinfo() {
    pkgdesc="fileinfo module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module fileinfo
}


###############################################################################
# PHP modules: math
###############################################################################

# bcmath
package_php82-bcmath() {
    pkgdesc="bcmath module for ${pkgbase}"
    depends=("${pkgbase}")
    _install_module bcmath
}

# gmp
package_php82-gmp() {
    pkgdesc="gmp module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'gmp')
    _install_module gmp
}

###############################################################################
# PHP modules: spell checking
###############################################################################

# Enchant
package_php82-enchant() {
    pkgdesc="enchant module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'enchant' 'libvoikko' 'hspell' 'hunspell' 'nuspell' 'aspell')
    _install_module enchant
}

# Pspell
package_php82-pspell() {
    pkgdesc="pspell module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'aspell')
    _install_module pspell
}

###############################################################################
# PHP modules: compression
###############################################################################

# bz2
package_php82-bz2() {
    pkgdesc="bz2 module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'bzip2')
    _install_module bz2
}

# Zip
package_php82-zip() {
    pkgdesc="zip module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'libzip')
    _install_module zip
}

###############################################################################
# PHP modules: network client/servers
###############################################################################

# curl
package_php82-curl() {
    pkgdesc="curl module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" "curl")
    _install_module curl
}

# SOAP
package_php82-soap() {
    pkgdesc="soap module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'libxml2')
    _install_module soap
}

# FTP
package_php82-ftp() {
    pkgdesc="FTP module for ${pkgbase}"
    depends=("${_ext_depends_ftp[@]}")
    _install_module ftp
}

# ldap
package_php82-ldap() {
    pkgdesc="ldap module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'libldap' 'libsasl')
    _install_module ldap
}

# SNMP
package_php82-snmp() {
    pkgdesc="snmp module for ${pkgbase}"
    depends=("${_ext_depends_snmp[@]}")
    _install_module snmp
}

# XML-RPC
package_php82-xmlrpc() {
    pkgdesc="xmlrpc module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'libxml2')
    _install_module xmlrpc
}

# Imap
package_php82-imap() {
    pkgdesc="imap module for ${pkgbase}"
    depends=("${_ext_depends_imap[@]}")
   _install_module imap
}

# sockets
package_php82-sockets() {
    pkgdesc="sockets module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module sockets
}

###############################################################################
# PHP Modules: cryptography
###############################################################################

# Sodium
package_php82-sodium() {
    pkgdesc="sodium (libsodium) module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" "libsodium")
    _install_module sodium
}

# Mcrypt
package_php82-mcrypt() {
    pkgdesc="mcrypt module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'libmcrypt')
    _install_module mcrypt
}


###############################################################################
# PHP Zend modules: opcache/jit
###############################################################################

# Opcache
package_php82-opcache() {
    pkgdesc="opcache zend module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
    _install_module opcache
}

###############################################################################
# PHP posix, pcntl, shmop and System V modules
###############################################################################

# posix
package_php82-posix() {
    pkgdesc="posix module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module posix
}

# pcntl
package_php82-pcntl() {
    pkgdesc="pcntl module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module pcntl
}

# shmop
package_php82-shmop() {
    pkgdesc="shmop module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module shmop
}

# sysvmsg
package_php82-sysvmsg() {
    pkgdesc="sysvmsg module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module sysvmsg
}

# sysvsem
package_php82-sysvsem() {
    pkgdesc="sysvsem module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module sysvsem
}

# sysvshm
package_php82-sysvshm() {
    pkgdesc="sysvshm module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module sysvshm
}

###############################################################################
# PHP Misc modules
###############################################################################

# Ffi
package_php82-ffi() {
    pkgdesc="ffi module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'libffi')
   _install_module ffi
}

# ctype
package_php82-ctype() {
    pkgdesc="ctype module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module ctype
}

# tokenizer
package_php82-tokenizer() {
    pkgdesc="tokenizer module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}")
   _install_module tokenizer
}

# libedit/readline
package_php82-readline() {
    pkgdesc="readline (libedit version) module for ${pkgbase}"
    depends=("${pkgbase}=${pkgver}" 'libedit')
   _install_module readline
}


sha256sums=('e6b8530d747000eebb0089249ec70a3b14add7b501337046700544883f62b17b'
            '0b7e98dca9c996ec10cb9b3f6296bb7547c68797fd5f35006fdfd3e97700672d'
            'ba72fc64f77822755a469314160d5889d5298f4eb5758dd7939dac9b811afe52'
            '6d0ad9becb5470ce8e5929d7d45660b0f32579038978496317544c5310281a91'
            '46ebb4be04b98833bab649314775cc100bdd825c73d9bc3646df5c1ec7ebb2a6')
