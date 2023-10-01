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
