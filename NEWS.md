# seader 0.1.2

* Adjusted tests for CRAN compatibility when using Arrow-backed datasets.
* Tests that materialize Arrow datasets are now skipped on CRAN to avoid
  failures caused by codec availability in the CRAN build environment.

# seader 0.1.1

* Initial CRAN submission.

# seader 0.1.0

* First public version of the package.
* Functions to access SEADE vital statistics data:
  - `read_birth_sex()`
  - `read_birth_mother_age()`
* Arrow-backed datasets enabling lazy queries with `dplyr`.
