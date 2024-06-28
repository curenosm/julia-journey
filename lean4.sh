# TODO: Ensure GMP build for each platform, darwin can use clang
# https://ftp.gnu.org/gnu/gcc/gcc-14.1.0/gcc-14.1.0.tar.gz

cd lean4/
export CMAKE_CXX_COMPILER="${pwd}/gcc-14.1.0/bin/g++"
export GMP_INSTALL_PREFIX="$prefix"
export GMP_INCLUDE_DIR="$GMP_INSTALL_PREFIX/include"
export GMP_LIBRARIES="$GMP_INSTALL_PREFIX/lib"
export USE_GMP="ON"
export CL_ARGS="-DUSE_GMP=$USE_GMP -DGMP_INSTALL_PREFIX=$GMP_INSTALL_PREFIX -DGMP_INCLUDE_DIR=$GMP_INCLUDE_DIR -DGMP_LIBRARIES=$GMP_LIBRARIES"
cmake -DCMAKE_CXX_COMPILER=g++ \
      --preset release \
      -DCL_ARGS:STRING="$CL_ARGS" \
      -DSTAGE0_GMP_INSTALL_PREFIX:PATH=$GMP_INSTALL_PREFIX \
      -DSTAGE0_GMP_INCLUDE_DIR:PATH=$GMP_INCLUDE_DIR \
      -DSTAGE0_GMP_LIBRARIES:PATH=$GMP_LIBRARIES
cmake -LAH build/release/CMakeCache.txt
make -C build/release -j$(nproc)
exit
