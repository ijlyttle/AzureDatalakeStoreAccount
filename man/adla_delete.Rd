% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/delete.R
\name{adla_delete}
\alias{adla_delete}
\title{Delete an Azure Datalake store}
\usage{
adla_delete(token, subscription_id, resource_group_name, name)
}
\arguments{
\item{token}{token, can be created using \code{\link[AzureOAuth:oauth_token_azure]{AzureOAuth::oauth_token_azure()}} or
\code{\link[AzureOAuth:oauth_service_token_azure]{AzureOAuth::oauth_service_token_azure()}}}

\item{subscription_id}{character, has form \code{"aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"}}

\item{resource_group_name}{character}

\item{name}{character}
}
\value{
logical indicating success to delete account
}
\description{
Delete an Azure Datalake store
}
\examples{
\dontrun{
  library("httr")
  library("AzureOAuth")

  # assumes this is an Azure native app.
  token <- oauth_token_azure(
    tenant_id = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee",
    application_id = "ffffffff-gggg-hhhh-iiii-jjjjjjjjjjjj",
    name = "foo"
  )

  adla_delete(
    token = token,
    subscription_id = "kkkkkkkk-llll-mmmm-nnnn-oooooooooooo",
    resource_group = "bar",
    name = "baz"
  )
}
}
