context("count_identifiers")

test_that("count_identifiers - basic functionality", {
  skip_on_cran()

  aa <- count_identifiers()

  expect_is(aa, "data.frame")
  expect_is(aa$url, "character")
  expect_is(aa$count, "numeric")
  expect_match(aa$url, "export.arxiv.org/oai2")
})

# commented out - takes too long
# test_that("count_identifiers - works with many input urls", {
#   skip_on_cran()

#   aa <- count_identifiers(c(
#     "https://www.hindawi.com/oai-pmh/oai.aspx",
#     "http://archivesic.ccsd.cnrs.fr/oai/oai.php"
#   ))

#   expect_is(aa, "data.frame")
#   expect_is(aa$url, "character")
#   expect_is(aa$count, "numeric")

#   expect_equal(NROW(aa), 2)
# })

# commented out - takes too long
# test_that("count_identifiers - prefix param works", {
#   skip_on_cran()

#   aa <- count_identifiers(prefix = "oai_dc")
#   bb <- count_identifiers(prefix = "oai_dc_agris")

#   expect_is(aa, "data.frame")
#   expect_is(bb, "data.frame")

#   expect_equal(aa, bb)
# })

test_that("count_identifiers - curl options", {
  skip_on_cran()

  library("httr")

  expect_error(count_identifiers(config = timeout(0.001)), "Timeout was reached")
})

test_that("count_identifiers fails well", {
  skip_on_cran()

  expect_error(count_identifiers(5), "One or more of your URLs")
})
