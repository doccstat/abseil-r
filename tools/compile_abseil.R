#!/usr/bin/env Rscript
# Compiles all abseil source files in inst/include/absl/ into src/libabsl.a.
# Invoked by configure (Unix) and configure.win (Windows).
# Running from the package source root is assumed.

get_r_config <- function(key) {
  r_bin <- file.path(R.home("bin"), if (.Platform$OS.type == "windows") "R.exe" else "R")
  out <- tryCatch(
    system2(r_bin, c("CMD", "config", key), stdout = TRUE, stderr = FALSE),
    error = function(e) character(0)
  )
  if (length(out) > 0 && nzchar(out[1])) out[1] else NA_character_
}

cxx17  <- get_r_config("CXX17")
if (is.na(cxx17))  cxx17  <- Sys.getenv("CXX17",  "g++")
cxx17std <- get_r_config("CXX17STD")
if (is.na(cxx17std)) cxx17std <- "-std=c++17"
# Use minimal flags only (no CXX17FLAGS) to avoid platform-specific ABI flags
# such as -mbranch-protection or -mno-omit-leaf-frame-pointer that would
# produce CRAN notes about non-portable flags.
fpic <- if (.Platform$OS.type == "unix") "-fPIC" else ""

incl_dir <- "inst/include"
obj_dir  <- file.path("src", "absl_objs")
dir.create(obj_dir, recursive = TRUE, showWarnings = FALSE)

cc_files <- list.files(
  file.path(incl_dir, "absl"),
  pattern = "\\.cc$",
  recursive = TRUE,
  full.names = TRUE
)
# Exclude test helpers (need gtest/gmock) and benchmark files (need benchmark.h).
cc_files <- cc_files[!grepl(
  "test|mock|benchmark",
  basename(cc_files),
  ignore.case = TRUE
)]
cc_files <- normalizePath(cc_files, winslash = "/")

extra_flags <- paste(c(cxx17std, fpic), collapse = " ")
message(sprintf("* abseil: compiling %d source files...", length(cc_files)))

objs   <- character(length(cc_files))
failed <- 0L
for (i in seq_along(cc_files)) {
  obj <- normalizePath(
    file.path(obj_dir, sprintf("absl_%05d.o", i)),
    mustWork = FALSE, winslash = "/"
  )
  cmd <- paste(
    shQuote(cxx17),
    extra_flags,
    paste0("-I", shQuote(incl_dir)),
    "-c", shQuote(cc_files[i]),
    "-o", shQuote(obj)
  )
  ret <- system(cmd, ignore.stdout = TRUE, ignore.stderr = TRUE)
  if (ret == 0L) objs[i] <- obj else failed <- failed + 1L
}

objs <- objs[nzchar(objs)]
message(sprintf(
  "* abseil: compiled %d/%d files (%d failed).",
  length(objs), length(cc_files), failed
))

lib <- file.path("src", "libabsl.a")
ar  <- Sys.getenv("AR", "ar")
ret <- system(paste(ar, "rcs", shQuote(lib), paste(shQuote(objs), collapse = " ")))
if (ret == 0L && file.exists(lib)) {
  message(sprintf("* abseil: created %s (%.1f KB).", lib, file.size(lib) / 1024))
} else {
  stop("* abseil: failed to create libabsl.a")
}
