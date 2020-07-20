# Maintainer: alex4ip <alex4ip@gmail.com>

pkgname=porter-bin
pkgver=0.27.1
pkgrel=3
epoch=1
pkgdesc='A utility to help make your application + etc (env/tool) as a versioned bundle that you can distribute, and then install with a single command'
arch=(x86_64)
url='https://github.com/deislabs/porter'
license=(MIT)
#depends=('docker')
optdepends=('kubernetes-bin'
            'helm'
            'terraform'
            'azure-cli: Command-line tools for Azure'
            'aws-cli: cli for Amazon Web Services'
            'google-cloud-sdk: gcloud - command-line tools for the Google Cloud Platform')
provides=('porter')
#makedepends=('go')
source=("$pkgname-$pkgver::https://cdn.porter.sh/v${pkgver}/porter-linux-amd64")
sha512sums=('d9d5a20d21164e4bb61a54fa4681689e50986915a50e54a07db81d805eff7a2163103a64da1557abc0b91730e77dcd13d3be0cc728d42d91a732c68df93e03f6')

package() {  
  #mkdir -p "${pkgdir}/opt"
  install -Dm 755 "$srcdir/$pkgname-$pkgver" "${pkgdir}/opt/${pkgname}/porter"

  PORTER_HOME="${pkgdir}"/opt/"${pkgname}"  

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${pkgdir}"/opt/${pkgname}/porter "${pkgdir}"/usr/bin/porter

  # Add command completion
  # install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  # install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  # "$pkgdir/usr/bin/provides" completion bash > "$pkgdir/usr/share/bash-completion/completions/provides"
  # "$pkgdir/usr/bin/provides" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_provides"

# Add mixin

  PKG_PERMALINK=${PKG_PERMALINK:-latest}
  
  cd "${pkgdir}"/opt/"${pkgname}"
  ./porter mixin install exec --version $PKG_PERMALINK
  ./porter mixin install kubernetes
  ./porter mixin install helm --version $PKG_PERMALINK
  ./porter mixin install arm --version $PKG_PERMALINK
  ./porter mixin install terraform
  ./porter mixin install az --version $PKG_PERMALINK
  ./porter mixin install aws --version $PKG_PERMALINK
  ./porter mixin install gcloud --version $PKG_PERMALINK

  ./porter plugin install azure --version $PKG_PERMALINK
}

# vim:set ts=2 sw=2 et:
