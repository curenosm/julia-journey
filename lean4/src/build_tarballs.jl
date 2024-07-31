using BinaryBuilder, Pkg

name = "LEAN"
version = v"4.7.0"

# Collection of source required to complete
# the build
sources = [
  GitSource(
    "https://github.com/leanprover/lean4",
    "6fce8f7d5cd18a4419bca7fd51780c71c9b1cc5a",
  ),
  DirectorySource("./bundled"),
]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/lean4

mkdir -p build/release
cd build/release
cmake ../..
make
"""

# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = expand_cxxstring_abis(supported_platforms())

# The products that we will ensure are always built
products =
  [ExecutableProduct("lean", :lean), ExecutableProduct("leanchecker", :leanchecker)]

# Dependencies that must be installed before this package can be built
dependencies =
  [Dependency(PackageSpec(name = "GMP_jll", uuid = "781609d7-10c4-51f6-84f2-b8444358ff6d"))]

# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(
  ARGS,
  name,
  version,
  sources,
  script,
  platforms,
  products,
  dependencies;
  preferred_gcc_version = v"13.2",
)
