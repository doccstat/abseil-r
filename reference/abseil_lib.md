# Path to the abseil static library

Returns the absolute path to `libabsl.a` installed with this package.
Use this in a downstream package's `configure` script to link against
the pre-compiled abseil library without recompiling it.

## Usage

``` r
abseil_lib()
```

## Value

A single character string: the path to `libabsl.a`.

## Examples

``` r
# \donttest{
abseil_lib()
#> [1] "/home/runner/work/_temp/Library/abseil/libs/libabsl.a"
# }
```
