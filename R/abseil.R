#' abseil: 'C++' Header Files and Compiled Library from 'Abseil'
#'
#' Wraps the 'Abseil' 'C++' library for use by R packages. Original files are
#'   from <https://github.com/abseil/abseil-cpp>. Patches are located at
#'   <https://github.com/doccstat/abseil-r/tree/main/local/patches>.
#'
#' @keywords internal
"_PACKAGE"

#' Path to the abseil static library
#'
#' Returns the absolute path to \file{libabsl.a} installed with this package.
#' Use this in a downstream package's \file{configure} script to link against
#' the pre-compiled abseil library without recompiling it.
#'
#' @return A single character string: the path to \file{libabsl.a}.
#' @export
#' @examples
#' \donttest{
#' abseil_lib()
#' }
abseil_lib <- function() {
  pkg  <- find.package("abseil")
  arch <- .Platform$r_arch
  candidates <- if (nchar(arch) > 0) {
    c(file.path(pkg, "libs", arch, "libabsl.a"),
      file.path(pkg, "libs", "libabsl.a"))
  } else {
    file.path(pkg, "libs", "libabsl.a")
  }
  lib <- candidates[file.exists(candidates)][1]
  if (is.na(lib)) {
    stop(
      "abseil static library not found. ",
      "Reinstall the abseil package to rebuild libabsl.a."
    )
  }
  lib
}
