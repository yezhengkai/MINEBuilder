# Note that this script can accept some limited command-line arguments, run
# `julia build_tarballs.jl --help` to see a usage message.
using BinaryBuilder, Pkg

name = "MINE"
version = v"1.2.6"

# Collection of sources required to complete build
sources = [
    ArchiveSource("https://github.com/minepy/minepy/archive/refs/tags/$(version).tar.gz",
                  "933a3b770cdfdec760096e3ba61eb72ef21e671fd0915dc13da654bf6c419720"),
]

# Bash recipe for building across all platforms
# TODO: Check for correctness
script = raw"""
cd ${WORKSPACE}/srcdir/minepy*/libmine
mkdir -p ${libdir}

# Ref: https://discourse.julialang.org/t/binarybuilder-jl-mingw-problem/73815/7
#CFLAGS="-DWIN32 -DWIN_DLL -DENAGLO -DENAGAL -DENAQZS -DENACMP -DENAIRN -DTRACE -DNFREQ=5 -DNEXOBS=3 -DSVR_REUSEADDR -I. -fPIC -Wall -O3 -ansi -pedantic -Wno-unused-but-set-variable -g"
#LDFLAGS="-lwinmm -lws2_32 -lrtm -lrtutils -lm -lpthread -shared -Wl,-no-undefined"
CFLAGS="-fPIC"
LDFLAGS="-shared"

${CC} ${CFLAGS} ${LDFLAGS} -o ${libdir}/libmine.${dlext} mine.c

install_license ../gpl-3.0.txt
"""

# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = [
    Platform("x86_64", "linux"; libc = "glibc"),
    Platform("x86_64", "windows")
]

# The products that we will ensure are always built
products = [
    LibraryProduct("libmine", :libmine)
]

# Dependencies that must be installed before this package can be built
dependencies = Dependency[
]

# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies; julia_compat="1.6")
