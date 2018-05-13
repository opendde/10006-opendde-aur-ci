# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

_name='baselines'
pkgname="openai-${_name}-git"
pkgver=r121.9cf95a0
pkgrel=1
pkgdesc='OpenAI Baselines: high-quality implementations of reinforcement learning algorithms'
provides=(openai-${_name})
url="https://github.com/openai/${_name}"
depends=('python' 'openmpi')
makedepends=('cmake' 'python-setuptools')
license=('MIT')
arch=('x86_64')

pkgver() {
  cd "${srcdir}/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("git+${url}.git")
	
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_name}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

