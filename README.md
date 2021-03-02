# Key paths are slow

After cloning, run

```sh
$ swift run -c release
```

On my computer, the result is

```
swift run -c release                                                                                                                                                                            main 
running key path sorted :: name... done! (1525.94 ms)
running key path sorted :: age... done! (1545.78 ms)
running key path expressions sorted :: name... done! (1546.89 ms)
running key path expressions sorted :: age... done! (1545.76 ms)
running functions sorted :: name... done! (1502.57 ms)
running key path sorted :: age... done! (2177.66 ms)

name                                time            std        iterations
-------------------------------------------------------------------------
key path sorted :: name             12759325.500 ns ±   2.57 %        108
key path sorted :: age              14797394.000 ns ±   3.27 %         93
key path expressions sorted :: name 13089546.000 ns ±   3.94 %        106
key path expressions sorted :: age  14440162.000 ns ±   2.42 %         95
functions sorted :: name              102494.000 ns ±   9.12 %      13123
key path sorted :: age                 69360.000 ns ±   6.88 %      19774
```

# Swift forum link

In [this discussion](https://forums.swift.org/t/runtime-performance-cost-of-key-paths/36095), some reasons are provided as to why.
