# Installs libabsl.a into the package's libs/ directory after compilation.
# R CMD INSTALL invokes this file automatically after building src/.
#
# When install.libs.R runs, R sets R_PACKAGE_SOURCE to the src/ directory of
# the source package. libabsl.a was produced there by configure.

pkg_src <- Sys.getenv("R_PACKAGE_SOURCE")
lib_src <- file.path(pkg_src, "libabsl.a")
if (!file.exists(lib_src)) {
  # Fallback: script runs from src/ build dir, try CWD too.
  if (file.exists("libabsl.a")) {
    lib_src <- "libabsl.a"
  } else {
    message("* abseil install.libs.R: libabsl.a not found; skipping.")
    q("no")
  }
}

# Determine install destination (R_ARCH is "/x64" on 64-bit Windows, "" elsewhere).
arch     <- Sys.getenv("R_ARCH", "")
arch_sub <- if (nchar(arch) > 0) sub("^/", "", arch) else ""
pkg_dir  <- Sys.getenv("R_PACKAGE_DIR")
lib_dst  <- if (nchar(arch_sub) > 0) {
  file.path(pkg_dir, "libs", arch_sub)
} else {
  file.path(pkg_dir, "libs")
}
dir.create(lib_dst, recursive = TRUE, showWarnings = FALSE)

dest <- file.path(lib_dst, "libabsl.a")
if (file.copy(lib_src, dest, overwrite = TRUE)) {
  message(sprintf("* abseil: installed %s (%.1f KB).", dest, file.size(dest) / 1024))
} else {
  stop(sprintf("* abseil: failed to install libabsl.a to %s", lib_dst))
}
