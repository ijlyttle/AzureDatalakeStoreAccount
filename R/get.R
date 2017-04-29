#' Get information on a Data Lake account.
#'
#'
#' @inheritParams adla_list
#' @inheritParams adla_url
#' @param name              character name of the data lake account
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
#'   adla_get(
#'     token = token,
#'     subscription_id = "kkkkkkkk-llll-mmmm-nnnn-oooooooooooo",
#'     resource_group = "bar",
#'     name = "baz"
#'   )
#' }
#'
adla_get <- function(token, subscription_id, resource_group_name, name) {

  # TODO: pagination

  result <-
    adla_url(
      subscription_id = subscription_id,
      resource_group_name = resource_group_name,
      name = name
    ) %>%
    httr::GET(
      httr::content_type_json(),
      httr::accept_json(),
      config = httr::config(token = token)
    ) %>%
    httr::stop_for_status(
      task = "access Azure Datalake Account API: Get Account"
    ) %>%
    unpack_response()

  result
}
