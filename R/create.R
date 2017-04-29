#' Create an Azure Datalake store
#'
#' @inheritParams adla_url
#' @inheritParams adla_get
#' @param body          named list of parameters
#'
#' @return logical indicating success to launch provisioning
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
#'   adla_create(
#'     token = token,
#'     subscription_id = "kkkkkkkk-llll-mmmm-nnnn-oooooooooooo",
#'     resource_group = "bar",
#'     name = "baz",
#'     body = list(location = "centralus")
#'   )
#' }
#' @export
#'
adla_create <- function(token, subscription_id, resource_group_name,
                        name, body) {

  result <-
    adla_url(
      subscription_id = subscription_id,
      resource_group_name = resource_group_name,
      name = name
    ) %>%
    httr::PUT(
      httr::content_type_json(),
      httr::accept_json(),
      config = httr::config(token = token),
      body = jsonlite::toJSON(body, auto_unbox = TRUE),
      encode = "raw"
    ) %>%
    httr::stop_for_status(
      task = "create Azure Datalake account"
    ) %>%
    httr::content(type = "text", encoding = "UTF-8") %>%
    adla_parse_status()

  result
}
