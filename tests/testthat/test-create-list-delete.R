context("create-list-delete")

#
# see helper.R for definition of helper list
#

library("dplyr")
library("tibble")

test_that("confirm that account does not exist", {
  skip_on_cran()
  skip_on_travis()
  skip_if_not(interactive())

  account_info <-
    adla_list(
      token = helper$token,
      subscription_id = helper$subscription_id
    )

  if (helper$account_test_name %in% account_info$name){
    warning("Account exists")
    account_exists <<- TRUE
  } else {
    account_exists <<- FALSE
  }

  expect_true(TRUE)
})


test_that("we can create an account", {
  skip_on_cran()
  skip_on_travis()
  skip_if_not(interactive())
  skip_if_not(!account_exists)

  account_info <-
    adla_create(
      token = helper$token,
      subscription_id = helper$subscription_id,
      resource_group_name = helper$resource_group_name,
      name = helper$account_test_name,
      body = list(location = "centralus")
    )

  expect_identical(account_info$name, helper$account_test_name)

  # TODO: loop to wait for properties.state to be "Active"
  Sys.sleep(60)

})


test_that("we can delete an account", {
  skip_on_cran()
  skip_on_travis()
  skip_if_not(interactive())
  skip_if_not(!account_exists)

  success <-
    adla_delete(
      token = helper$token,
      subscription_id = helper$subscription_id,
      resource_group_name = helper$resource_group_name,
      name = helper$account_test_name
    )

  expect_true(success)

  # make sure it is not in the "list"
  account_info <-
    adla_list(
      token = helper$token,
      subscription_id = helper$subscription_id
    )

  expect_false(helper$account_test_name %in% account_info$name)

})



