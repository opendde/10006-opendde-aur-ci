# Maintainer: Benjamin Denhartog <ben@sudoforge.com>
# Contributor: Mansour Behabadi <mansour@oxplot.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>
# Contributor: Geoff Hill <geoff@geoffhill.org>
# Contributor: Sebastien Bariteau <numkem@numkem.org>
# Contributor: Justin Dray <justin@dray.be>

pkgname="google-cloud-sdk"
pkgver=276.0.0
pkgrel=2
pkgdesc="A set of command-line tools for the Google Cloud Platform. Includes gcloud (with beta and alpha commands), gsutil, and bq."
url="https://cloud.google.com/sdk/"
license=("Apache")
arch=('x86_64')
depends=('python' 'python2')
optdepends=(
  "python-crcmod: [gsutil] verify the integrity of GCS object contents"
)
options=('!strip' 'staticlibs')
source=(
  "https://dl.google.com/dl/cloudsdk/release/downloads/for_packagers/linux/${pkgname}_${pkgver}.orig.tar.gz"
  "google-cloud-sdk.sh"
)
sha256sums=('ad3d711e372fdcef141106d33e150aee4922a88c76484798a40b48a2fc779c3c'
            'a54f88947a2593fae4aa8f65e42de4ad735583ae743735305c0f36710a794295')

package() {
  echo "Copying core SDK components"
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/opt"

  echo "Running bootstrapping script"

  # The Google code uses a _TraceAction() method which spams the screen even
  # in "quiet" mode, we're throwing away output on purpose to keep it clean
  #  ref: lib/googlecloudsdk/core/platforms_install.py
  python "${pkgdir}/opt/${pkgname}/bin/bootstrapping/install.py" \
    --quiet \
    --usage-reporting False \
    --path-update False \
    --bash-completion False \
    --additional-components "" \
    1 > /dev/null

  echo "Cleaning up artifacts of the bootstrap script"
  rm -rf "${pkgdir}/opt/${pkgname}/.install/.backup"
  mkdir "${pkgdir}/opt/${pkgname}/.install/.backup"

  echo "Setting up profile environment variables"
  install -Dm755 "${srcdir}/${source[1]}" \
    "${pkgdir}/etc/profile.d/google-cloud-sdk.sh"

  echo "Installing bash completion script"
  install -Dm755 "${pkgdir}/opt/${pkgname}/completion.bash.inc" \
    "${pkgdir}/etc/bash_completion.d/google-cloud-sdk"

  echo "Installing man pages"
  mkdir -p "${pkgdir}/usr/share"
  mv -f "${pkgdir}/opt/${pkgname}/help/man" "${pkgdir}/usr/share/"
  chmod 0755 "${pkgdir}/usr/share/man"
  chmod 0755 "${pkgdir}/usr/share/man/man1"

  echo "Creating symlinks for applications"
  mkdir -p "${pkgdir}/usr/bin"
  for i in "${pkgdir}/opt/${pkgname}/bin"/*; do
    ln -st "${pkgdir}/usr/bin/" "${i#${pkgdir}}"
  done
  rm -f "${pkgdir}"/usr/bin/{bq,dev_appserver.py*,endpointscfg.py*,java_dev_appserver.sh}

  echo "Fixing file permissions"
  chmod -x "${pkgdir}"/usr/share/man/man1/*
  find "${pkgdir}/opt/${pkgname}" -name "*.html" -o -name "*.json" -exec chmod -x {} \;
  find "${pkgdir}/opt/${pkgname}" -name "*_test.py" -exec chmod +x {} \;
}
