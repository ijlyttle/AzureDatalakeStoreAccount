#' List the available accounts.
#'
#' This function does not (yet) support the query parameters.
#' Perhaps this can be achieved using (`...`). Perhaps is can be achieved by
#' using some sort of OData-query S3 object
#'
#' @param token   token, can be created using [`AzureOAuth::oauth_token_azure()`] or
#'   [`AzureOAuth::oauth_service_token_azure()`]
#' @inheritParams adla_url
#'
#' @return List
#' @seealso [Azure Datalake Store Account API reference](https://docs.microsoft.com/en-us/rest/api/datalakestore/account#Account_List)
#' @examples
#' \dontrun{
#'   library("httr")
#'   library("AzureOAuth")
#'
#'   # assumes this is an Azure native app.
#'   token <- oauth_token_azure(
#'     tenant_id = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee",
#'     application_id = "ffffffff-gggg-hhhh-iiii-jjjjjjjjjjjj",
#'     name = "foo"
#'   )
#'
#'   adla_list(
#'     token = token,
#'     subscription_id = "kkkkkkkk-llll-mmmm-nnnn-oooooooooooo",
#'   )
#' }
#' @export
#'
adla_list <- function(token, subscription_id) {

  # TODO: pagination
  #
  # we will want to keep rbinding value
  #

  result <-
    adla_url(subscription_id) %>%
    httr::GET(
      httr::content_type_json(),
      httr::accept_json(),
      config = httr::config(token = token)
    ) %>%
    httr::stop_for_status(
      task = "access Azure Datalake Account API: List"
    ) %>%
    unpack_response(flatten = TRUE)

  tibble::as.tibble(result$value)
}
