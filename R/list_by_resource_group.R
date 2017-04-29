#' List the available accounts by resource group.
#'
#' This function does not (yet) support the query parameters.
#' Perhaps this can be achieved using (`...`). Perhaps is can be achieved by
#' using some sort of OData-query S3 object
#'
#' @inheritParams adla_list
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
#'   adla_list_by_resource_group(
#'     token = token,
#'     subscription_id = "kkkkkkkk-llll-mmmm-nnnn-oooooooooooo",
#'     resource_group = "bar"
#'   )
#' }
#' @export
#'
adla_list_by_resource_group <- function(token, subscription_id,
                                        resource_group_name) {

  # TODO: pagination

  result <-
    adla_url(
      subscription_id = subscription_id,
      resource_group_name = resource_group_name
    ) %>%
    httr::GET(
      httr::content_type_json(),
      httr::accept_json(),
      config = httr::config(token = token)
    ) %>%
    httr::stop_for_status(
      task = "access Azure Datalake Account API: List by Resource Group"
    ) %>%
    unpack_response(flatten = TRUE)

  tibble::as.tibble(result$value)
}
