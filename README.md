
<!-- README.md is generated from README.Rmd. Please edit that file -->

# abseil: Abseil Headers for R

[![CRAN
status](https://www.r-pkg.org/badges/version-last-release/abseil)](https://cran.r-project.org/package=abseil)
[![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/abseil)](https://cran.r-project.org/package=abseil)
[![R-CMD-check](https://github.com/doccstat/abseil-r/workflows/R-CMD-check/badge.svg)](https://github.com/doccstat/abseil-r/actions)
[![Last
Commit](https://img.shields.io/github/last-commit/doccstat/abseil-r)](https://github.com/doccstat/abseil-r)
[![r-universe](https://doccstat.r-universe.dev/badges/abseil)](https://doccstat.r-universe.dev)

## Synopsis

This package provides [R](https://www.r-project.org) with access to
[Abseil](https://abseil.io) header files.

This package is a direct import of [Abseil](https://abseil.io)
libraries.

It can be used via the `LinkingTo:` field in the `DESCRIPTION` field of
an R package — and the R package infrastructure tools will then know how
to set include flags correctly on all architectures supported by R.

## Installation

``` r
# Install from CRAN
install.packages("abseil")
```

<details close>
<summary>
Development version
</summary>

``` r
# Development version from r-universe with CRAN version as a fallback
install.packages(
  "abseil",
  repos = c("https://doccstat.r-universe.dev", "https://cloud.r-project.org")
)

## install.packages("pak")
pak::pak("doccstat/abseil-r")

## install.packages("devtools")
devtools::install_github("doccstat/abseil-r")
```

</details>

## Example

<details open>
<summary>
Directly usage in R
</summary>

``` r
Rcpp::cppFunction(r"{
  #include "absl/strings/str_join.h"
  std::string joinString() {
    std::vector<std::string> v = {"foo","bar","baz"};
    return absl::StrJoin(v, "-");
  }
}", depends = "abseil")

joinString()
#> [1] "foo-bar-baz"
```

</details>
<details close>
<summary>
Usage in Rcpp package
</summary>

``` cpp
#include <Rcpp.h>
#include "absl/strings/str_join.h"

//' @export
// [[Rcpp::export]]
std::string joinString() {
  std::vector<std::string> v = {"foo","bar","baz"};
  return absl::StrJoin(v, "-");
}
```

Bare minimum R package using the `abseil` package can be found at
[doccstat/abseil-r-example](https://github.com/doccstat/abseil-r-example).

</details>

## Authors

Abseil Team, Xingchi Li

## Contact us

For bugs related to Abseil logistics, please report the issue to the
official [Abseil GitHub Repo](https://github.com/abseil/abseil-cpp).

1.  File a ticket at [GitHub
    Issues](https://github.com/doccstat/abseil-r/issues).
2.  Contact the authors specified in
    [DESCRIPTION](https://github.com/doccstat/abseil-r/blob/main/DESCRIPTION#L5-L9).

## Stargazers over time

[![Stargazers over
time](https://starchart.cc/doccstat/abseil-r.svg)](https://starchart.cc/doccstat/abseil-r)

## License

This package is provided under the same license as Abseil itself, the
Apache-2.0 license.
