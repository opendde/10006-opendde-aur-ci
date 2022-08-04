# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Sven Niese <Fd3querm@yahoo.de>
# Contributor: Daniel Murphy <mosquitogang201@gmail.com>

# NOTE: the option "!makeflag" is needed because the compilation
#       may fail if make uses more than one job.

pkgname=calculix
pkgver=2.20
pkgrel=2
pkgdesc="CalculiX: 3D finite element solver and post-processor (executables)"
arch=('i686' 'x86_64')
options=(!makeflags !buildflags)
url="http://www.calculix.de/"
license=('GPL2')
depends=('arpack' 'spooles' 'libsnl-svn' 'blas' 'mesa' 'glu' 'libxmu' 'libxi')
optdepends=('calculix-doc: documentation and examples'
            'tetgen: for tet meshing')
makedepends=('gcc-fortran' 'perl')
checkdepends=('perl')

source=("http://www.dhondt.de/ccx_${pkgver}.src.tar.bz2"
        "http://www.dhondt.de/ccx_${pkgver}.test.tar.bz2"
        "http://www.dhondt.de/ccx_${pkgver}.fluidtest.tar.bz2"
        "http://www.dhondt.de/ccx_${pkgver}.structest.tar.bz2"
      	"http://www.dhondt.de/cgx_${pkgver}.all.tar.bz2"
        "calculix_${pkgver}_archlinux.patch")

sha256sums=('63bf6ea09e7edcae93e0145b1bb0579ea7ae82e046f6075a27c8145b72761bcf'
            '79848d88dd1e51839d1aed68fb547ff12ad3202c3561c02c2f3a8ceda0f2eb82'
            '1b73ab8df8d7266fd612846f3052114c1a7dceb1d28edebec1701bda64cd1240'
            '85026b25f2753178b5a1ab36f0f86faafb08df27acbba7b73ebda33ddd04aa6b'
            'f4c840c3633718547e33f86b2d7bc6b35608dd8d6cbf9fa192cecef34f2dc908'
            '6d9e86c9bcbe2953a3e7697c3c84945e8abeac4607ca519f69cd6f43cc8eb4e5')

prepare()
{
    cd "${srcdir}"

    msg "Patching makefiles..."
    rm -rf CalculiX/libSNL
    patch -p0 -f -l -s -i calculix_${pkgver}_archlinux.patch
    msg2 "Done"
}

build()
{   
    msg "Building..."
    
    msg2 "Building solver..."
    cd "${srcdir}/CalculiX/ccx_${pkgver}/src"
    make CFLAGS="${CFLAGS} -Wall -O2 -fopenmp -I /usr/include/spooles -DARCH=\"Linux\" -DSPOOLES -DARPACK -DMATRIXSTORAGE -DNETWORKOUT -DUSE_MT=1" FFLAGS='-Wall -O2 -fopenmp -fpic -fallow-argument-mismatch' LIBS='-lpthread -lm -lc -lspooles -larpack -lblas -llapack -lgomp'
    
    msg2 "Building gui..."
    cd "${srcdir}/CalculiX/cgx_${pkgver}/src"
    make  CFLAGS='-O2 -Wall -Wno-narrowing -I./ -I/usr/include/libSNL -I../../glut-3.5/src' LFLAGS='-lGL -lGLU -lX11 -lXi -lXmu -lXext -lXt -lSM -lICE -lSNL -lm -lpthread -lrt'

    msg2 "Build complete"
}

check()
{
  tests=('beamp' 'ball' 'pipe' 'pipe2' 'planestress'
         'gap' 'gap2' 'capacitor' 'carbonseal' 'beamptied1'
         'beamp1rotate' 'beamp2' 'beamp2rotate' 'beamf' 'beamhf'
         'furnace' 'gaspipe1' 'gaspipe1-oil' 'gaspipe2'
         'gaspipe3' 'gaspipe4' 'gaspipe5' 'gaspipe6' 'gaspipe7'
         'gaspipe8' 'gaspipe-cfd-pressure' 'gaspipe8-cfd-pressure'
         'gaspipe8-cfd-massflow' 'gaspipe8-cfd-pressure'
         'gaspipe8-cfd-pressure-split' 'green1' 'green2' 'green3'
         'green4' 'hinge' 'hueeber1' 'hueeber2' 'induction' 'induction2'
         'inistrain' 'largerot1' 'linearnet' 'mass1' 'mass2' 'mass3'
         'massflow_percent_ccx' 'membrane1' 'metalforming' 'modelchel'
         'networkmpc' 'oneel' 'pendel' 'resstress1'
         'restrictor' 'segment' 'sensitivity_I' 'shell1'
         'shellbeam' 'shellf' 'simplebeam' 'spring1' 'spring2'
         'small_pressure_gradient' 'square' 'substructure' 'swing'
         'thermomech' 'transition' 'truss' 'vortex1' 'wire')

  msg "Testing solver..."
  cd ${srcdir}/CalculiX/ccx_${pkgver}/test

  error_status=0
  start_time="$(date -u +%s)"
  for test_name in "${tests[@]}" ; do
    ref_file=${test_name}.dat.ref
    dat_file=${test_name}.dat
    frd_file=${test_name}.frd
    log_file=${test_name}.log

    msg2 "testing ${test_name}"
    rm -f ${dat_file}
    rm -f ${frd_file}

    # Testing on maximum 4 cores
    OMP_NUM_THREADS=4 ../src/ccx_${pkgver} ${test_name} &> ${log_file} ||\
        warning "check $(pwd)/${log_file}"

    if [ ! -f ${dat_file} ]; then
	    warning "${dat_file} does not exist"
       error_status=1
    fi

    sum1="$(wc -l ${dat_file})"
    sum2="$(wc -l ${ref_file})"
    if [ ${sum1%* *} != ${sum2%* *} ]; then
	    warning "The data file generated by ccx is not valid"
      error_status=1
    fi

    if grep "NaN" ${dat_file} ; then
      warning "${dat_file} contains NaNs!"
      error_status=1
    fi

    if ! ./datcheck.pl ${test_name} ; then
      warning "Result is inconsistent with reference data!"
      error_status=1
    fi
  done
  
  cd ${srcdir}/CalculiX/ccx_${pkgver}/fluidtest  
  for test_name in ./*.inp ; do
    msg2 "testing ${test_name}"
    OMP_NUM_THREADS=4 ../src/ccx_${pkgver} ${test_name} &> ${log_file} ||\
        error_status=1 warning "check $(pwd)/${log_file}"
  done
    
  cd ${srcdir}/CalculiX/ccx_${pkgver}/structest  
  for test_name in ./*.inp ; do
    msg2 "testing ${test_name}"
    OMP_NUM_THREADS=4 ../src/ccx_${pkgver} ${test_name} &> ${log_file} ||\
        error_status=1 warning "check $(pwd)/${log_file}"
  done
  end_time="$(date -u +%s)"
  elapsed="$(($end_time-$start_time))"
  
  msg "Total of $elapsed seconds elapsed for tesing"
  
  return $error_status
}

package() 
{
    msg "Copying files"

    install -d  ${pkgdir}/usr/bin

    install -Dm755 ${srcdir}/CalculiX/ccx_${pkgver}/src/ccx_${pkgver} ${pkgdir}/usr/bin/ccx
    install -Dm755 ${srcdir}/CalculiX/cgx_${pkgver}/src/cgx ${pkgdir}/usr/bin/cgx

    msg2 "Done"  
}
