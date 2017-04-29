#' Delete an Azure Datalake store
#'
#' @inheritParams adla_url
#' @inheritParams adla_get
#'
#' @return logical indicating success to delete account
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
#'   adla_delete(
#'     token = token,
#'     subscription_id = "kkkkkkkk-llll-mmmm-nnnn-oooooooooooo",
#'     resource_group = "bar",
#'     name = "baz"
#'   )
#' }
#' @export
#'
adla_delete <- function(token, subscription_id, resource_group_name, name) {

  result <-
    adla_url(
      subscription_id = subscription_id,
      resource_group_name = resource_group_name,
      name = name
    ) %>%
    httr::DELETE(
      httr::content_type_json(),
      httr::accept_json(),
      config = httr::config(token = token)
    ) %>%
    httr::stop_for_status(
      task = "delete Azure Datalake account"
    )

  TRUE
}
