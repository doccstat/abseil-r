#' abseil
#'
#' Wraps the 'Abseil' 'C++' library for use by R packages. Original files are
#'   from <https://github.com/abseil/abseil-cpp>. Patches are located at
#'   <https://github.com/doccstat/abseil-r/tree/main/local/patches>.
#'
#' @docType package
#' @name abseil
#' @rdname abseil-package
#' @examples
#' Rcpp::cppFunction(r"{
#'   #include "absl/strings/str_join.h"
#'   std::string joinString() {
#'     std::vector<std::string> v = {"foo","bar","baz"};
#'     return absl::StrJoin(v, "-");
#'   }
#' }", depends = "abseil")
#' joinString()
NULL
