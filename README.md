
<!-- README.md is generated from README.Rmd. Please edit that file -->
AzureDatalakeStoreAccount
=========================

[![Travis-CI Build Status](https://travis-ci.org/ijlyttle/AzureDatalakeStoreAccount.svg?branch=master)](https://travis-ci.org/ijlyttle/AzureDatalakeStoreAccount) [![Coverage Status](https://img.shields.io/codecov/c/github/ijlyttle/AzureDatalakeStoreAccount/master.svg)](https://codecov.io/github/ijlyttle/AzureDatalakeStoreAccount?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/AzureDatalakeStoreAccount)](https://cran.r-project.org/package=AzureDatalakeStoreAccount)

Overview
--------

This package is used to access the account.

<https://docs.microsoft.com/en-us/azure/data-lake-store/data-lake-store-get-started-rest-api>

It looks like we should use API version `2016-11-01`.

What we will need
-----------------

-   **done** [List](https://docs.microsoft.com/en-us/rest/api/datalakestore/account#Account_List)

-   **error** [List by Resource Group](https://docs.microsoft.com/en-us/rest/api/datalakestore/account#Account_ListByResourceGroup)

-   [Create](https://docs.microsoft.com/en-us/rest/api/datalakestore/account#Account_Create)

-   **error** [Get](https://docs.microsoft.com/en-us/rest/api/datalakestore/account#Account_Get)

-   **done** [Delete](https://docs.microsoft.com/en-us/rest/api/datalakestore/account#Account_Delete)

There seems to be a werid error in list-by-resource and get - I will have to try from the command-line using `curl` to try to reproduce.

Installation
------------

**AzureDatalakeStoreAccount** is not yet available on CRAN. You may install from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("ijlyttle/AzureDatalakeStoreAccount")
```

If you encounter a clear bug, please file a minimal reproducible example on [github](https://github.com/ijlyttle/AzureDatalakeStoreAccount/issues).

Code of conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
