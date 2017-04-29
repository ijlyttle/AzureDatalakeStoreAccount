context("url_utils")

library("httr")

subscription_id <- "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
resource_group_name <- "foo"
name <- "bar"

url_name <- "https://management.azure.com/subscriptions/aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee/resourceGroups/foo/providers/Microsoft.DataLakeStore/accounts/bar?api-version=2016-11-01"
url_noname <- "https://management.azure.com/subscriptions/aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee/resourceGroups/foo/providers/Microsoft.DataLakeStore/accounts?api-version=2016-11-01"
url_noresource <- "https://management.azure.com/subscriptions/aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee/providers/Microsoft.DataLakeStore/accounts?api-version=2016-11-01"

test_that("adla_url works", {
  expect_identical(
    adla_url(subscription_id, resource_group_name, name) %>% build_url(),
    url_name
  )
  expect_identical(
    adla_url(subscription_id, resource_group_name) %>% build_url(),
    url_noname
  )
  expect_identical(
    adla_url(subscription_id) %>% build_url(),
    url_noresource
  )

})
