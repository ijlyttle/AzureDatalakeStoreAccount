context("list")

#
# see helper.R for definition of helper list
#

test_that("adla_list works", {
  skip_on_cran()
  skip_on_travis()
  skip_if_not(interactive())

  result <- adla_list(
    token = helper$token,
    subscription_id = helper$subscription_id
  )

  expect_is(result, "tbl_df")
  expect_identical(names(result), helper$names_status)

})
