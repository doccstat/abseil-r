## abseil: Abseil Headers for R

[![Last Commit](https://img.shields.io/github/last-commit/doccstat/abseil-r)](https://github.com/doccstat/abseil-r)

### Synopsis

This package provides [R](https://www.r-project.org) with access to
[Abseil](https://abseil.io) header files.

This package is a direct import of [Abseil](https://abseil.io) libraries.

It can be used via the `LinkingTo:` field in the `DESCRIPTION` field of an R
package --- and the R package infrastructure tools will then know how to set
include flags correctly on all architectures supported by R.

### Installation

```r
pak::pak("doccstat/abseil-r")

devtools::install_github("doccstat/abseil-r")
```

### Example

```cpp
#include <Rcpp.h>
// [[Rcpp::depends(abseil)]]
#include "absl/strings/str_join.h"

// [[Rcpp::export]]
std::string joinString() {
  std::vector<std::string> v = {"foo","bar","baz"};
  return absl::StrJoin(v, "-");
}
```

Bare minimum R package using the `abseil` package can be found at
[doccstat/abseil-r-example](https://github.com/doccstat/abseil-r-example).

### Authors

Xingchi (Anthony) Li

## License

This package is provided under the same license as Abseil itself, the
Apache-2.0 license.
