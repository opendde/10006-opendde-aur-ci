# Release notes https://docs.amd.com/bundle/ROCm_Release_Notes_v5.0/page/ROCm_Installation_Updates.html
major='21.50.2.50002'
minor='1384495'
rocm_major='50002'
rocm_minor='72'
amdgpu_repo='https://repo.radeon.com/amdgpu/21.50.2/ubuntu'
rocm_repo='https://repo.radeon.com/rocm/apt/5.0.2'
opencl_lib='opt/rocm-5.0.2/opencl/lib'
rocm_lib='opt/rocm-5.0.2/lib'
hip_lib='opt/rocm-5.0.2/hip/lib/'
amdgpu="opt/amdgpu/lib/x86_64-linux-gnu"
amdgpu_pro="opt/amdgpu-pro/lib/x86_64-linux-gnu/"

pkgname=opencl-amd-dev
pkgdesc="OpenCL SDK / HIP SDK / ROCM Compiler. This package needs at least 10GB of space."
pkgver=${major}.${minor}
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('opencl-amd')
provides=('rocm-llvm' 'hip-dev' 'hip-doc' 'hip-samples' 'rocblas' 'rocsolver' 'hipblas' 'hipblas-dev' 'rocprim-dev' 'hipcub-dev' 'rocfft' 'hipfft' 'hipfft-dev' 'hipify-clang'
	'rocsparse' 'hipsparse' 'hipsparse-dev' 'rocm-clang-ocl' 'miopen-hip' 'miopen-hip-dev' 'rccl' 'rccl-dev' 'rocrand' 'rocalution' 'rocalution-dev' 'rocblas-dev' 'rocfft-dev'
	'rocm-hip-libraries' 'rocm-hip-runtime-dev' 'rocrand-dev' 'rocsolver-dev' 'rocsparse-dev' 'rocthrust-dev' 'rocm-hip-sdk' 'miopentensile' 'miopentensile-dev' 'rocm-ml-libraries')

source=(
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-llvm/rocm-llvm_14.0.0.22065.50002_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocblas/rocblas_2.42.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocsolver/rocsolver_3.16.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hipblas/hipblas_0.49.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hipblas-dev/hipblas-dev_0.49.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocprim-dev/rocprim-dev_2.10.9.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hipcub-dev/hipcub-dev_2.10.12.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocfft/rocfft_1.0.15.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hipfft/hipfft_1.0.6.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hipfft-dev/hipfft-dev_1.0.6.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hipify-clang/hipify-clang_14.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocsparse/rocsparse_2.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hipsparse/hipsparse_2.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/h/hipsparse-dev/hipsparse-dev_2.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/m/miopen-hip/miopen-hip_2.15.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/m/miopen-hip-dev/miopen-hip-dev_2.15.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rccl/rccl_2.10.3.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rccl-dev/rccl-dev_2.10.3.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocrand/rocrand_2.10.9.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocrand-dev/rocrand-dev_2.10.9.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocalution/rocalution_2.0.1.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocalution-dev/rocalution-dev_2.0.1.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocblas-dev/rocblas-dev_2.42.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocfft-dev/rocfft-dev_1.0.15.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-hip-libraries/rocm-hip-libraries_5.0.2.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-hip-runtime-dev/rocm-hip-runtime-dev_5.0.2.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocsolver-dev/rocsolver-dev_3.16.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocsparse-dev/rocsparse-dev_2.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocthrust-dev/rocthrust-dev_2.10.9.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-hip-sdk/rocm-hip-sdk_5.0.2.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-opencl-sdk/rocm-opencl-sdk_5.0.2.50002-72_amd64.deb"
# MLLIB
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/m/miopentensile/miopentensile_1.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/m/miopentensile-dev/miopentensile-dev_1.0.0.50002-72_amd64.deb"
"https://repo.radeon.com/rocm/apt/5.0.2/pool/main/r/rocm-ml-libraries/rocm-ml-libraries_5.0.2.50002-72_amd64.deb"
)

sha256sums=(
"3b8bd5229e4f6c28e4410d4bbfa43c86492159f36cac3a0139f0070a81dea492"
"eece3d658fe812e1509d5fadfbbaf2d224a69105b1bb3152aaf32753566be55b"
"e2889a5eca1e8a2ec8a39a0038dc600e365ff0b8243390465158cfc7c460b289"
"a9148d2b2f88f35808c5b963ffe55bc8805ef0536fa7286da0ad6081824156db"
"eeebf34d13aac7b8bfc70910215260f50d859216454c4aa2a994dfc1963faad1"
"01a9db76942f72ad2bb777dca98821fc05ba181a9509c9adde5d6708c22a0c54"
"ddf23de84973f147ac16d4738dcc13d9c636bf5813caa1da439a2b5d661eb66c"
"39df22b6097d878dc32b82929facb73271ea54ee7f084cec027800ed37a2e4ae"
"7bf5582a0cdc103cfb40ad9eee3d7d9d61d9b46cda039aca2b2449e41e1e14a6"
"b8c002f3c1691df16a34b9de3d79c73dec1ce487a0c3271b6219317308c24c66"
"15ea5915d90fb4ec6ad540d4a96fc8ca08861cee191deff9e1c8669b6d5168e7"
"0f42ad3d17797378c57e623f18aecf1b40f1c2d0a49c71ea3b0bac311d0a7f62"
"81c9185d08cc7b2220bcdbea34cca82fabcde0be38e4819e5f79ce9446c9a289"
"bbf44110b8b82aed6b5ab639a99617954c1c1250dc83ee4467681315efbb5f0d"
"daf23899ef0b4c4867c9e6c1bae7d1902df5522b7160cf6424ba98cfba4d5d84"
"29e4d8fc65f9ff4e85261eea3ea1c8265fa5f192228438f750a44bbcc88f4177"
"b8121a583fa0743312f7a7493c83128f92e6d7803b3ac195a953fa938a050d92"
"16e5a101fdee138bf562c71ecd6374dbbfb32ed18045ed202ab747905b008c1e"
"5717980095c2d976f20411a32d8626bd7f1b380afd9f2aa8e9256c93e04b34a9"
"585f75a32041f54d296b524d5d41705d3336660b6c2a71c5399520e069e19cbc"
"a1592aa1e07c542afe67a8d185ea4add27c988e5de43cbee877c4e67d9b25076"
"4b10e5bcd1190de8ab962d89736625f4850c6a7a81d0aa2db64aa62ce9f5f401"
"831c962f9f952a49f15151660631aa71a1561752f2c2bc5a589bd233c9ffb5a5"
"dc99acb3df3f5fc821e4ce7a1543b82b19f7a5d5156a012360d73d7bda2dfa60"
"87fdfc1d90922a62fc763168984b174408c3980224e6fb7bec4b6d136756727f"
"daa9e3d35cc9940c33a7c01f29166cfe2dc8e1828c7cc210d37be91947015dc1"
"4ebdaf6a94525e7961bd78232e12c7ec36ab4cfc557087aef94929ba33a5a679"
"475b6ed30f489af3d5403fd1b3884e48b853617a082006f4e2c82a924cdc838d"
"d201c034948f7bd4a373ccf447eec4096319f335737e0a9bfcf90c8d2488e666"
"0a50469a6f2d08dddc6dea94e18c71382ca86e2245bcceec71c76ec5811fe069"
"13095d9f6223f832629e919be75f788d412439f4db5c57043796ca23593e593a"
# MLLIB
"3ed0ef781041d4a25480dd76bab02b7ac05f5d437e823da463d5817dcea366ea"
"93bc701c6bf31357e0bfaf51f855a319839d494719d335bc826fc91273bffb93"
"e0c172464a9bab952f6a033146d7b235ddcf79e8cf81e268f40bf3f9dee591be"
)

#Extract .xz files
exz() {
	ar x $1
	tar xJf data.tar.xz
	rm data.tar.xz
}
#Extract .gz files
egz() {
	ar x $1
	tar xfx data.tar.gz
	rm data.tar.gz
}

package() {
	exz "${srcdir}/rocm-llvm_14.0.0.22065.50002_amd64.deb"
	egz "${srcdir}/rocblas_2.42.0.50002-72_amd64.deb"
	egz "${srcdir}/rocsolver_3.16.0.50002-72_amd64.deb"
	egz "${srcdir}/hipblas_0.49.0.50002-72_amd64.deb"
	egz "${srcdir}/hipblas-dev_0.49.0.50002-72_amd64.deb"
	egz "${srcdir}/rocprim-dev_2.10.9.50002-72_amd64.deb"
	egz "${srcdir}/hipcub-dev_2.10.12.50002-72_amd64.deb"
	egz "${srcdir}/rocfft_1.0.15.50002-72_amd64.deb"
	egz "${srcdir}/hipfft_1.0.6.50002-72_amd64.deb"
	egz "${srcdir}/hipfft-dev_1.0.6.50002-72_amd64.deb"
	egz "${srcdir}/hipify-clang_14.0.0.50002-72_amd64.deb"
	egz "${srcdir}/rocsparse_2.0.0.50002-72_amd64.deb"
	egz "${srcdir}/hipsparse_2.0.0.50002-72_amd64.deb"
	egz "${srcdir}/hipsparse-dev_2.0.0.50002-72_amd64.deb"
	egz "${srcdir}/miopen-hip_2.15.0.50002-72_amd64.deb"
	egz "${srcdir}/miopen-hip-dev_2.15.0.50002-72_amd64.deb"
	egz "${srcdir}/rccl_2.10.3.50002-72_amd64.deb"
	egz "${srcdir}/rccl-dev_2.10.3.50002-72_amd64.deb"
	egz "${srcdir}/rocrand_2.10.9.50002-72_amd64.deb"
	egz "${srcdir}/rocalution_2.0.1.50002-72_amd64.deb"
	egz "${srcdir}/rocalution-dev_2.0.1.50002-72_amd64.deb"
	egz "${srcdir}/rocblas-dev_2.42.0.50002-72_amd64.deb"
	egz "${srcdir}/rocfft-dev_1.0.15.50002-72_amd64.deb"
	egz "${srcdir}/rocm-hip-libraries_5.0.2.50002-72_amd64.deb"
	egz "${srcdir}/rocm-hip-runtime-dev_5.0.2.50002-72_amd64.deb"
	egz "${srcdir}/rocrand-dev_2.10.9.50002-72_amd64.deb"
	egz "${srcdir}/rocsolver-dev_3.16.0.50002-72_amd64.deb"
	egz "${srcdir}/rocsparse-dev_2.0.0.50002-72_amd64.deb"
	egz "${srcdir}/rocthrust-dev_2.10.9.50002-72_amd64.deb"
	egz "${srcdir}/rocm-hip-sdk_5.0.2.50002-72_amd64.deb"
	egz "${srcdir}/miopentensile_1.0.0.50002-72_amd64.deb"
	egz "${srcdir}/miopentensile-dev_1.0.0.50002-72_amd64.deb"
	egz "${srcdir}/rocm-ml-libraries_5.0.2.50002-72_amd64.deb"
	mv "${srcdir}/opt/" "${pkgdir}/"
}