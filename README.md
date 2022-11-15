## Build
```bash
julia --project=. --startup-file=no --color=yes build_tarballs.jl --verbose --debug --deploy=local
```

## References
- [GitHub: minepy](https://github.com/minepy/minepy)
- [GitHub: BinaryBuilder.jl](https://github.com/JuliaPackaging/BinaryBuilder.jl)
- [GitHub: Yggdrasil](https://github.com/JuliaPackaging/Yggdrasil)
- [BinaryBuilder.jl 入門](https://terasakisatoshi.github.io/MathSeminar.jl/slideshow/binarybuilder/build/#1)
- [BinaryBuilder.jl is amazing ~ Automatically cross-compile with Docker and convert c and Fortran code into Julia library](https://linuxtut.com/en/46d8c40ae840239b4c1d/)
- [使用 gcc 自製 C/C++ 靜態、共享與動態載入函式庫教學](https://blog.gtwang.org/programming/howto-create-library-using-gcc/)
- [Creating a shared library](https://www.ibm.com/docs/en/aix/7.2?topic=memory-creating-shared-library)
- [Shared libraries with GCC on Linux](https://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html)