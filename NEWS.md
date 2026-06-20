# abseil 2026.5.26.0

*   Upgrade to Abseil LTS version 20260526.0.
*   abseil-cpp changes:
        https://github.com/abseil/abseil-cpp/releases/tag/20260526.0
*   Production source file count increases from 153 to 162 after filtering.
*   Extended compile filter to also exclude `*matchers*.cc` (pulls in gmock)
    and `*_win.cc` on non-Windows platforms (requires `<windows.h>`).
*   Patched pragma(s) suppressing important diagnostics:

    *   `inst/include/absl/container/inlined_vector.h`
    *   `inst/include/absl/container/internal/inlined_vector.h`
    *   `inst/include/absl/hash/internal/hash.h`
    *   `inst/include/absl/meta/internal/constexpr_testing.h`
    *   `inst/include/absl/strings/internal/charconv_bigint.h`

*   Patched non-portable pragma(s):

    *   `inst/include/absl/base/casts.h`
    *   `inst/include/absl/container/inlined_vector.h`
    *   `inst/include/absl/container/internal/inlined_vector.h`
    *   `inst/include/absl/functional/internal/any_invocable.h`
    *   `inst/include/absl/strings/internal/cord_internal.h`
    *   `inst/include/absl/strings/internal/cord_rep_flat.h`
    *   `inst/include/absl/types/any_span.h`

*   Patched pragma(s) suppressing diagnostics:

    *   `inst/include/absl/container/internal/hash_policy_traits.h`
    *   `inst/include/absl/container/internal/raw_hash_set_test.cc`
    *   `inst/include/absl/container/internal/test_allocator.h`
    *   `inst/include/absl/flags/commandlineflag.h`
    *   `inst/include/absl/flags/internal/flag.h`
    *   `inst/include/absl/flags/reflection.cc`
    *   `inst/include/absl/random/internal/explicit_seed_seq_test.cc`
    *   `inst/include/absl/random/internal/randen_detect.cc`
    *   `inst/include/absl/random/internal/randen_hwaes.cc`
    *   `inst/include/absl/strings/internal/str_format/bind_test.cc`
    *   `inst/include/absl/strings/internal/utf8_test.cc`
    *   `inst/include/absl/strings/str_split_test.cc`

# abseil 2023.8.2.2

*   Package is now compiled (`NeedsCompilation: yes`).
*   The `configure` script (Unix/macOS) and `configure.win` (Windows) compile all
    153 production Abseil source files in `inst/include/absl/` into a static
    library `libabsl.a`, which is installed into the package's `libs/` directory.
*   Added `abseil_lib()` R function that returns the path to the installed
    `libabsl.a`, allowing downstream packages to link non-header-only Abseil
    components without recompiling the library themselves.

# abseil 2023.8.2.1

*   Import Abseil LTS version 20230802.1.
*   abseil-cpp changes:
        https://github.com/abseil/abseil-cpp/releases/tag/20230802.1

# abseil 2023.8.2.0

*   Import Abseil LTS version 20230802.0
*   Deal with files which contain pragma(s) suppressing important diagnostics:

    *   `inst/include/absl/base/internal/invoke.h`
    *   `inst/include/absl/container/internal/inlined_vector.h`

*   Files which contain non-portable pragma(s):

    *   `inst/include/absl/base/internal/invoke.h`
    *   `inst/include/absl/container/inlined_vector.h`
    *   `inst/include/absl/functional/internal/any_invocable.h`
    *   `inst/include/absl/random/internal/explicit_seed_seq_test.cc`
    *   `inst/include/absl/strings/internal/cord_rep_flat.h`
    *   `inst/include/absl/types/internal/optional.h`

*   Files which contain pragma(s) suppressing diagnostics:

    *   `inst/include/absl/algorithm/algorithm_test.cc`
    *   `inst/include/absl/container/inlined_vector.h`
    *   `inst/include/absl/container/internal/counting_allocator.h`
    *   `inst/include/absl/container/internal/raw_hash_set_test.cc`
    *   `inst/include/absl/functional/internal/any_invocable.h`
    *   `inst/include/absl/random/internal/explicit_seed_seq_test.cc`
    *   `inst/include/absl/random/internal/randen_detect.cc`
    *   `inst/include/absl/random/internal/randen_hwaes.cc`
    *   `inst/include/absl/strings/internal/cord_rep_flat.h`
    *   `inst/include/absl/strings/internal/str_format/bind_test.cc`
    *   `inst/include/absl/strings/internal/utf8_test.cc`
    *   `inst/include/absl/strings/str_split_test.cc`
    *   `inst/include/absl/types/internal/optional.h`
