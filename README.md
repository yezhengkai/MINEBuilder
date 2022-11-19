## Build
Build tarball and write `MINE_jll` package to `~/.julia/dev/`
```bash
julia --project=. --startup-file=no --color=yes build_tarballs.jl --verbose --debug --deploy=local
```

Build tarball and deploy `MINE_jll` package to `https://github.com/<yourgithubaccountname>/<name>_jll.jl`
```bash
julia --project=. --startup-file=no --color=yes build_tarballs.jl --verbose --debug --deploy=<yourgithubaccountname>/<name>_jll.jl
```

## Problems and possible solutions for building tarball on Windows
### Path separator for checking if dll openable
Check `BinaryBuilderBase/src/Products.jl: L228`
We may need to change L228 to this
```julia
if success(`$(Base.julia_cmd()) --startup-file=no -e "import Libdl; Libdl.dlopen(\"$(replace(dl_path, "\\" => "/"))\")"`)
```

### Accessability of dll
Check `BinaryBuilderBase/src/Prefix.jl: L177`.
We may need to add this line
```julia
Sys.iswindows() && chmod(artifact_path(tree_hash), 0o755; recursive=true)
```

## Problems compiling .so files for linux
```bash
[ Info: Making D:\side-project\MINEBuilder\build\x86_64-linux-gnu\jQxePDdt\x86_64-linux-gnu-libgfortran3-cxx03\destdir\lib\libmine.so executable
[ Info: Checking lib\libmine.so with RPath list Any[]
[ Info: Ignored system libraries libc.so.6
patchelf: getting info about 'lib\libmine.so': No such file or directory
┌ Warning: Unable to set SONAME on lib\libmine.so
└ @ BinaryBuilder.Auditor C:\Users\kai\.julia\packages\BinaryBuilder\0CUml\src\auditor\soname_matching.jl:83
```

#### References
- https://github.com/JuliaLang/julia/issues/38993




## References
- [GitHub: minepy](https://github.com/minepy/minepy)
- [GitHub: BinaryBuilder.jl](https://github.com/JuliaPackaging/BinaryBuilder.jl)
- [GitHub: Yggdrasil](https://github.com/JuliaPackaging/Yggdrasil)
- [BinaryBuilder.jl 入門](https://terasakisatoshi.github.io/MathSeminar.jl/slideshow/binarybuilder/build/#1)
- [BinaryBuilder.jl is amazing ~ Automatically cross-compile with Docker and convert c and Fortran code into Julia library](https://linuxtut.com/en/46d8c40ae840239b4c1d/)
- [使用 gcc 自製 C/C++ 靜態、共享與動態載入函式庫教學](https://blog.gtwang.org/programming/howto-create-library-using-gcc/)
- [Creating a shared library](https://www.ibm.com/docs/en/aix/7.2?topic=memory-creating-shared-library)
- [Shared libraries with GCC on Linux](https://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html)