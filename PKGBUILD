# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tobias Hunger <tobias DOT hunger AT gmail DOT com>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=gitlab
pkgname=gitlab-ee
pkgver=8.13.5
pkgrel=1
pkgdesc="Project management and code hosting application"
arch=('i686' 'x86_64')
url="https://gitlab.com/gitlab-org/gitlab-ce/tree/master#README"
license=('MIT')
conflicts=('gitlab')
provides=('gitlab')
depends=('ruby' 'git' 'ruby-bundler' 'gitlab-shell' 'gitlab-workhorse' 'openssh' 'redis' 'libxslt' 'icu' 'nodejs')
makedepends=('cmake' 'postgresql' 'mariadb')
optdepends=('postgresql: database backend'
            'mysql: database backend'
            'python2-docutils: reStructuredText markup language support'
            'smtp-server: mail server in order to receive mail notifications')
backup=("etc/webapps/${_pkgname}/application.rb"
        "etc/webapps/${_pkgname}/gitlab.yml"
        "etc/webapps/${_pkgname}/resque.yml"
        "etc/webapps/${_pkgname}/unicorn.rb"
        "etc/logrotate.d/${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/gitlab-org/gitlab-ee/repository/archive.tar.gz?ref=v${pkgver}-ee"
        gitlab-unicorn.service
        gitlab-sidekiq.service
        gitlab-backup.service
        gitlab-mailroom.service
        gitlab-backup.timer
        gitlab.target
        gitlab.tmpfiles.d
        gitlab.logrotate
        apache.conf.example
        apache-ssl.conf.example
        apache2.2.conf.example
        apache2.2-ssl.conf.example
        nginx.conf.example
        nginx-ssl.conf.example
        lighttpd.conf.example)
install='gitlab.install'
sha256sums=('bddd0b23e2179b5ca527c7e75b09ea631dbb1f5c5d2f3b88e94beafacb0807a6'
            '0dabb9c10f6ba49404c13d6be2d0d6cf1bf7e5a0b95f0dea566e33c356997307'
            '3f64de78d1221a0ddf75baed19d1706c625c143701d30ad918f15231aeecfb4f'
            'e16a68539eeb49d24d2ab4a53ff95e33c67264a674b611c006dc5c8a24f41e0e'
            'f3863b2906526ba487cb594f7fdca926e6dd8b8cfe95dccbba0ff9171ef2bb62'
            'e2539301fe42869d8fdbaa1b53b30076fb436c4220a37e576ed704458f804852'
            'a1ee236a1f3e65cd26d9adb5f636f66fbab68777fd60d1c796cb26036bd0903f'
            '84614a2bfbd734f09c2c91531dd3c13e795186b50c0780a120c8e5bc2a892607'
            '7b3137b8175db06e97c7577fb1df3d9095ff0797e6428c12d9c633ddd9121ad5'
            '87fa65bc2d8f382d22fe77a6958bac9058e99021b230e2922a5b7e7afff39dcc'
            '5e8c0e5d66ae5039620bd5d92076112bd47d9894a9cfbf06242dad412618f01a'
            'b4b10b401de60a714ebb38b0e17c9efe123967565d9b73297503fbaea4bcf03d'
            '8944a5eb8972a63f962dc34ed1c2843e019b2b521d8f045a2552ddc2f2e28ec3'
            '481427bec661c8bebc652a3349e10dd8c9435f51a0dcbb7b2e6833309ce90a1b'
            '822d0b80f1974c8418a9f4d66fbefb7679313b6de9a49c137c83c0bfe622460f'
            'ea5a5f0b4c0ffd26d977efaf564800ee7fa88579a9e4f0556143a591a7ff198c')

_datadir="/usr/share/webapps/${_pkgname}"
_etcdir="/etc/webapps/${_pkgname}"
_homedir="/var/lib/${_pkgname}"
_logdir="/var/log/${_pkgname}"
_commit="94cc667f4ad84bfedf8714db7e8b4ba6acbb1f9a"
_srcdir="${pkgname}-v${pkgver/_/-}-ee-${_commit}"

prepare() {
  cd "${srcdir}/${_srcdir}"

  export SKIP_STORAGE_VALIDATION='true'

  # Patching config files:
  msg2 "Patching paths in and username gitlab.yml..."
  sed -e "s|# user: git|user: gitlab|" \
      -e "s|/home/git/repositories|${_homedir}/repositories|" \
      -e "s|/home/git/gitlab-satellites|${_homedir}/satellites|" \
      -e "s|# path: /mnt/gitlab|path: ${_homedir}/shared|" \
      -e "s|/home/git/gitlab-shell|/usr/share/webapps/gitlab-shell|" \
      -e "s|tmp/backups|${_homedir}/backups|" \
      config/gitlab.yml.example > config/gitlab.yml

  msg2 "Patching paths and timeout in unicorn.rb..."
  sed -e "s|/home/git/gitlab/tmp/.*/|/run/gitlab/|g" \
      -e "s|/var/run/|/run/|g" \
      -e "s|/home/git/gitlab|${_datadir}|g" \
      -e "s|timeout 30|timeout 300|" \
      -e "s|${_datadir}/log/|${_logdir}/|g" \
      config/unicorn.rb.example > config/unicorn.rb

  # We need this one untouched because otherwise assets will fail
  cp config/database.yml.postgresql config/database.yml.postgresql.orig

  msg2 "Patching username in database.yml.{mysql,postgresql}..."
  sed -i -e "s|username: git|username: gitlab|" config/database.yml.mysql
  sed -i -e "s|username: git|username: gitlab|" config/database.yml.postgresql

  msg2 "Patching redis connection in resque.yml"
  sed -e "s|production: unix:/var/run/redis/redis.sock|production: redis://localhost:6379|" \
      config/resque.yml.example > config/resque.yml

  msg2 "Setting up systemd service files ..."
  for service_file in gitlab-sidekiq.service gitlab-unicorn.service gitlab.logrotate gitlab-backup.service gitlab-mailroom.service; do
    sed -i "s|<HOMEDIR>|${_homedir}|g" "${srcdir}/${service_file}"
    sed -i "s|<DATADIR>|${_datadir}|g" "${srcdir}/${service_file}"
    sed -i "s|<LOGDIR>|${_logdir}|g" "${srcdir}/${service_file}"
  done
}

build() {
  cd "${srcdir}/${_srcdir}"
  
  export SKIP_STORAGE_VALIDATION='true'

  msg "Fetching bundled gems..."
  # Gems will be installed into vendor/bundle

  bundle config build.nokogiri --use-system-libraries
  bundle install -j$(nproc) --no-cache --deployment --without development test aws kerberos

  # We'll temporarily stick this in here so we can build the assets
  cp config/database.yml.postgresql.orig config/database.yml

  sed -i '/ensure_secret_token/d' config/initializers/gitlab_shell_secret_token.rb
  bundle exec rake assets:precompile RAILS_ENV=production
  # After building assets, clean this up again
  rm config/database.yml config/database.yml.postgresql.orig
}

package() {
  cd "${srcdir}/${_srcdir}"

  install -d "${pkgdir}/usr/share/webapps"

  cp -r "${srcdir}/${_srcdir}" "${pkgdir}${_datadir}"
  chown -R root:root "${pkgdir}${_datadir}"
  chmod 755 "${pkgdir}${_datadir}"

  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/satellites"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/shared/"{,artifacts,lfs-objects}
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/builds"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/uploads"
  install -dm750 -o 105 -g 105 "${pkgdir}${_homedir}/backups"
  install -dm750 -o 105 -g 105 "${pkgdir}${_etcdir}"
  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"

  ln -fs /run/gitlab "${pkgdir}${_homedir}/pids"
  ln -fs /run/gitlab "${pkgdir}${_homedir}/sockets"
  ln -fs ${_datadir}/log "${pkgdir}${_homedir}/log"

  rm -rf "${pkgdir}${_datadir}/public/uploads" && ln -fs "${_homedir}/uploads" "${pkgdir}${_datadir}/public/uploads"
  rm -rf "${pkgdir}${_datadir}/builds" && ln -fs "${_homedir}/builds" "${pkgdir}${_datadir}/builds"
  rm -rf "${pkgdir}${_datadir}/tmp" && ln -fs /var/tmp "${pkgdir}${_datadir}/tmp"
  rm -rf "${pkgdir}${_datadir}/log" && ln -fs "${_logdir}" "${pkgdir}${_datadir}/log"

  mv "${pkgdir}${_datadir}/.gitlab_workhorse_secret" "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  chmod 660 "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  chown root:105 "${pkgdir}${_etcdir}/gitlab_workhorse_secret"
  ln -fs "${_etcdir}/gitlab_workhorse_secret" "${pkgdir}${_datadir}/.gitlab_workhorse_secret"

  ln -fs /etc/webapps/gitlab-shell/secret "${pkgdir}${_datadir}/.gitlab_shell_secret"

  sed -i "s|require_relative '../lib|require '${_datadir}/lib|" config/application.rb

  # Install config files
  for config_file in application.rb gitlab.yml unicorn.rb resque.yml; do
    mv "config/${config_file}" "${pkgdir}${_etcdir}/"
    [[ -f "${pkgdir}${_datadir}/config/${config_file}" ]] && rm "${pkgdir}${_datadir}/config/${config_file}"
    ln -fs "${_etcdir}/${config_file}" "${pkgdir}${_datadir}/config/"
  done

  # Install database symlink
  ln -fs "${_etcdir}/database.yml" "${pkgdir}${_datadir}/config/database.yml"

  # Install secrets symlink
  ln -fs "${_etcdir}/secrets.yml" "${pkgdir}${_datadir}/config/secrets.yml"

  # Install license and help files
  mv README.md MAINTENANCE.md CONTRIBUTING.md CHANGELOG.md PROCESS.md VERSION config/*.{example,mysql,postgresql} "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # https://gitlab.com/gitlab-org/gitlab-ce/issues/765
  cp -r "${pkgdir}${_datadir}/doc" "${pkgdir}${_datadir}/public/help"
  find "${pkgdir}${_datadir}/public/help" -name "*.md" -exec rm {} \;
  find "${pkgdir}${_datadir}/public/help/" -depth -type d -empty -exec rmdir {} \;

  chown 105:105 "${pkgdir}${_datadir}/db/schema.rb"

  # Install systemd service files
  for service_file in gitlab-unicorn.service gitlab-sidekiq.service gitlab-backup.service gitlab-backup.timer gitlab.target gitlab-mailroom.service; do
    install -Dm644 "${srcdir}/${service_file}" "${pkgdir}/usr/lib/systemd/system/${service_file}"
  done

  install -Dm644 "${srcdir}/gitlab.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/gitlab.conf"
  install -Dm644 "${srcdir}/gitlab.logrotate" "${pkgdir}/etc/logrotate.d/gitlab"

  # Install webserver config templates
  for config_file in apache apache-ssl apache2.2 apache2.2-ssl nginx nginx-ssl lighttpd; do
    install -m644 "${srcdir}/${config_file}.conf.example" "${pkgdir}/usr/share/doc/${_pkgname}"
  done
}

# vim:set ts=2 sw=2 et:
