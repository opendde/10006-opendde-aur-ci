# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-common-extensions
_name=${pkgname:7}
pkgver=0.2.1
pkgrel=1
pkgdesc="A meta package aggregating colcon-core as well as a set of common extensions."
arch=(any)
url="https://pypi.org/project/$_name"
license=('Apache')
depends=('python-yaml'
         'python-pyaml'
         'python-colcon-core' 
         'python-colcon-ros' 
         'python-colcon-metadata' 
         'python-colcon-argcomplete' 
         'python-colcon-notification' 
         'python-colcon-powershell' 
         'python-colcon-test-result' 
         'python-colcon-package-information'
         'python-colcon-parallel-executor'
         'python-colcon-cmake'
         'python-colcon-bash'
         'python-colcon-defaults'
         'python-colcon-devtools'
         'python-colcon-package-selection'
         'python-colcon-output'
         'python-colcon-zsh')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('73af96598efc24748234d68c0f3a7419cb1e47a4c3c90f6b0d70bcffef034826')


package() {
    cd ${srcdir}/${_name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}

