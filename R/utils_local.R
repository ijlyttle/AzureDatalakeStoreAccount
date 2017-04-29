#' Base URL
#'
#' This is a convenience function to return the base URL for the service.
#'
#' @param subscription_id     character, has form `"aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"`
#' @param resource_group_name character
#' @param name                character
#'
#' @return `url` object returned by [`httr::parse_url()`]
#' @keywords internal
#' @examples
#'   adla_url(
#'     subscription_id = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee",
#'     resource_group_name = "foo",
#'     name = "bar"
#'   )
#' @export
#'
adla_url <- function(subscription_id, resource_group_name = NULL,
                     name = NULL) {

  # base URL, subscription
  url <-
    httr::parse_url("https://management.azure.com") %>%
    url_path("subscriptions", subscription_id)

  # (optional) resource
  if (!is.null(resource_group_name)) {
    url <- url_path_append(url, "resourceGroups", resource_group_name)
  }

  # provider, (optional) name
  # add api version
  #
  # oddly enough, we still put "accounts" in the path
  #
  url <-
    url %>%
    url_path_append(
      "providers",  "Microsoft.DataLakeStore",
      "accounts", name
    ) %>%
    url_query_append(`api-version` = alda_api_version())

  url
}

alda_api_version <- function() {
  "2016-11-01"
}

# horrible function to parse a response that has a
# single "row"
#
# x, text
adla_parse_status <- function(x){

  tmp <- jsonlite::fromJSON(x)

  properties <- tmp$properties
  tmp$properties <- NULL

  convert_null <- function(x) {
    if (is.null(x)) {
      return(NA)
    } else {
      x
    }
  }

  tmp <- purrr::map(tmp, convert_null)
  properties <- purrr::map(properties, convert_null)

  names(properties) <- paste("properties", names(properties), sep = ".")

  tibble::as_data_frame(c(tmp, properties))
}


