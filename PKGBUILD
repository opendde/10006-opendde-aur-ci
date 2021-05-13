# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-2.1
pkgname=('dotnet-runtime-2.1' 'dotnet-sdk-2.1')
pkgver=2.1.28.sdk816
_runtimever=2.1.28
_sdkver=2.1.816
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/ea408766-09d2-4380-87c4-06648783d0f3/eacfa729764eb187057c864bf2d0099d/dotnet-sdk-2.1.816-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/364c342f-4bdb-446a-acb2-849d15521857/6924364bd7d88c64201d6afff0a28821/dotnet-sdk-2.1.816-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/745ce65b-e1b7-442d-aebf-8fe18c4fceba/73d02f94e66602d4b6531b0b2003c798/dotnet-sdk-2.1.816-linux-x64.tar.gz')
sha512sums_armv7h=('1358c17e2f8dc8e3bb754618fb80b4a6104ea1c1fa85177676320af194b8adb0e115b5709b8d409989cea2bda28d5a23d275f9457032a13052d97942fe94f00e')
sha512sums_aarch64=('32e72e26062444405f8d94918948ebd3a6eb4c4fa5d5c144fab35e23d2c44c9e4ab0d2f12e70c249b2972d5fef32bcbd2551f7920cd0fe778a38457368d477af')
sha512sums_x86_64=('58f0bc1f67de034ffd0dafb9c0fdb082786fc5057e89396ff574428d57331cd8d5b3e944e103918e05f7b66e354d56cdb242350a6ef932906c9c3d4b08d177e9')

# Versioning details for dependencies
# https://docs.microsoft.com/en-us/dotnet/core/versions/#versioning-details

package_dotnet-runtime-2.1() {
  pkgdesc='The .NET Core runtime version 2.1'
  depends=('dotnet-host' 'glibc' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=("dotnet-runtime-2.1" "dotnet-runtime=${_runtimever}")
  conflicts=("dotnet-runtime-2.1" "dotnet-runtime=${_runtimever}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-runtime-2.1
}

package_dotnet-sdk-2.1() {
  pkgdesc='The .NET Core SDK version 2.1'
  depends=('dotnet-runtime-2.1' 'glibc')
  provides=("dotnet-sdk-2.1" "dotnet-sdk=${pkgver}")
  conflicts=("dotnet-sdk-2.1" "dotnet-sdk=${pkgver}")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/dotnet-sdk-2.1
}
