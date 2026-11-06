# IP2Location.io R SDK — IP Geolocation, IP Intelligence & Hosted Domain Lookup

[![CRAN Version](https://www.r-pkg.org/badges/version/ip2locationio)](https://CRAN.R-project.org/package=ip2locationio)
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/grand-total/ip2locationio)](https://CRAN.R-project.org/package=ip2locationio)

**IP2Location.io R SDK** (`ip2locationio`) is an R package for retrieving **IPv4 and IPv6 geolocation, network, and IP intelligence data** using the [IP2Location.io API](https://www.ip2location.io/). It also supports **hosted domain lookup** and provides convenient R functions for getting an IP address's country, coordinates, ASN, and formatted location. The package uses the IP2Location.io Python library through R's `reticulate` interface.

**Quick links:** [Get an API key](https://www.ip2location.io/pricing) · [Developer documentation](https://ip2location-io-r.readthedocs.io/en/latest/index.html) · [R function reference](https://ip2location-io-r.readthedocs.io/en/latest/code.html) · [CRAN package](https://CRAN.R-project.org/package=ip2locationio)

## Features

- **IPv4 and IPv6 geolocation:** Look up country, region, city, district, ZIP/postal code, latitude, longitude, and time zone.
- **Network and ASN data:** Retrieve available ASN, AS name, ISP, associated domain, connection speed, usage type, and other network attributes.
- **Proxy and threat-related signals:** Access plan-dependent proxy and security data, including available proxy indicators and fraud scores.
- **Additional IP intelligence:** Access eligible mobile carrier information (MCC/MNC), country metadata, advertising categories, and other supported fields.
- **Hosted domain lookup:** Find domains hosted on an IPv4 or IPv6 address, with optional pagination.
- **Convenience lookup functions:** Get just a country name, coordinates, AS name/number, or formatted city/region/country location without manually extracting each field.
- **R and Python interoperability:** Use the SDK from R/RStudio via `reticulate` and the underlying IP2Location.io Python library.

> **Plan availability:** Not all attributes are included in every plan, and some fields can be unavailable for particular IP addresses. Refer to the [pricing page](https://www.ip2location.io/pricing) and [API field reference](https://www.ip2location.io/ip2location-documentation) for details.

## R package functions

The package provides the following functions for IP geolocation and hosted-domain lookups:

| Function | Description |
| --- | --- |
| [`setApiKey(api_key)`](https://ip2location-io-r.readthedocs.io/en/latest/code.html) | Configures the API key for subsequent lookups. |
| [`lookup(ip)`](https://ip2location-io-r.readthedocs.io/en/latest/code.html) | Retrieves geolocation, network, and available security information. |
| [`lookupCountryByIP(ip)`](https://ip2location-io-r.readthedocs.io/en/latest/code.html) | Returns the country name for an IP address. |
| [`lookupCoordinateByIP(ip)`](https://ip2location-io-r.readthedocs.io/en/latest/code.html) | Returns latitude and longitude. |
| [`lookupASNByIP(ip)`](https://ip2location-io-r.readthedocs.io/en/latest/code.html) | Returns the AS name and ASN. |
| [`lookupLocationByIP(ip)`](https://ip2location-io-r.readthedocs.io/en/latest/code.html) | Returns a formatted city, region, and country string. |
| [`lookupHostedDomain(ip, page)`](https://ip2location-io-r.readthedocs.io/en/latest/code.html) | Retrieves hosted domains; `page` is optional. |

## API access and query limits

IP2Location.io offers keyless IP geolocation queries through its REST API and a Free plan with an API key:

| API service | Keyless (no API key) | Free plan (with API key) |
| --- | --- | --- |
| IP Geolocation API | **1,000 queries/day** | **50,000 queries/month** |
| Hosted Domain API | — | **50 queries/month** |

- **Keyless access:** No registration is required for the limited [IP Geolocation REST API](https://www.ip2location.io/ip2location-documentation). The allowance resets daily at **00:00 UTC**. The R package examples below use an API key.
- **Free plan:** Sign up for an API key to use the published monthly allowances.
- **Attribution:** The keyless and Free offerings require attribution; see the [pricing page](https://www.ip2location.io/pricing) for the current conditions.
- **Paid plans:** See the [pricing page](https://www.ip2location.io/pricing) for higher quotas, available features, and current pricing.

For details about API authentication and rate limits, see the [IP Geolocation API documentation](https://www.ip2location.io/ip2location-documentation).

## Requirements

- R and, optionally, [RStudio](https://posit.co/products/open-source/rstudio/) for interactive development.
- Python with `pip` available in the Python environment used by R.
- The **IP2Location.io Python package** (`ip2location-io`).
- The R packages `ip2locationio`, `reticulate` (>= 1.13), and `jsonlite` (>= 1.6). `reticulate` and `jsonlite` are declared package imports and are normally installed automatically with the R package.
- An [IP2Location.io API key](https://www.ip2location.io/pricing) for the SDK examples.

> **Important:** This R package wraps the Python SDK. Install `ip2location-io` in the **same Python environment that `reticulate` uses**. Installing the Python package in another environment may cause a Python module-not-found error.

## Installation

### 1. Install the Python dependency

In your terminal, run:

```bash
python -m pip install ip2location-io
```

On systems where Python 3 is invoked as `python3`, use `python3 -m pip install ip2location-io` instead.

### 2. Install the R package

**Option A — CRAN (recommended):**

```r
install.packages("ip2locationio")
```

**Option B — GitHub development repository:**

```r
install.packages("remotes")
remotes::install_github("ip2location/ip2location-io-r")
```

The official Read the Docs quickstart also documents installation from GitHub using `devtools::install_github()`.

### 3. Set your API key

Set the API key as an environment variable rather than placing it in the source code.

**Linux / macOS terminal:**

```bash
export IP2LOCATION_API_KEY='YOUR_API_KEY'
```

**Windows Command Prompt:**

```bat
set IP2LOCATION_API_KEY=YOUR_API_KEY
```

Alternatively, configure the variable in your R environment (such as a project `.Renviron` file that is not committed to source control). Restart your R session after modifying `.Renviron`.

## Quickstart: IP geolocation lookup

The [official Read the Docs quickstart](https://ip2location-io-r.readthedocs.io/en/latest/quickstart.html) demonstrates a geolocation lookup with the following code:

```r
library(ip2locationio)

ip2locationio::setApiKey("YOUR_API_KEY")
result = ip2locationio::lookup("8.8.8.8")
print(result)
```

Replace `YOUR_API_KEY` with your IP2Location.io API key. To run the example as a script, save it as `lookup.R` and use:

```bash
Rscript lookup.R
```

The returned fields depend on your API plan and the IP address. See the [R SDK function reference](https://ip2location-io-r.readthedocs.io/en/latest/code.html) for the available response fields.

## More usage examples

Initialize the package and API key before running the following individual examples:

```r
library(ip2locationio)
ip2locationio::setApiKey("YOUR_API_KEY")
```

### Get a country name

```r
lookupCountryByIP("1.0.241.135")
```

### Get geographic coordinates

```r
lookupCoordinateByIP("1.0.241.135")
```

The result contains latitude and longitude.

### Get AS name and ASN

```r
lookupASNByIP("1.0.241.135")
```

The result contains the AS name and AS number.

### Get a formatted location

```r
lookupLocationByIP("1.0.241.135")
```

The function formats the city, region, and country into a single location string.

### Inspect available proxy data

Security indicators depend on your API plan and may be unavailable for some addresses.

```r
result <- lookup("8.8.8.8")

if (!is.null(result$is_proxy)) {
  print(result$is_proxy)
}
if (!is.null(result$proxy)) {
  print(result$proxy)
}
```

### Find domains hosted on an IP address

The [official Read the Docs example](https://ip2location-io-r.readthedocs.io/en/latest/quickstart.html) uses:

```r
library(ip2locationio)

ip2locationio::setApiKey("YOUR_API_KEY")
result = ip2locationio::lookupHostedDomain("8.8.8.8")
print(result)
```

The `lookupHostedDomain()` function accepts an optional page number for pagination:

```r
lookupHostedDomain("8.8.8.8", page = 2)
```

Hosted-domain responses can contain `total_domains`, `page`, `per_page`, `total_pages`, and `domains`.

## R and Python environment troubleshooting

If R reports that it cannot import Python module `ip2locationio`, check which Python environment `reticulate` is using:

```r
reticulate::py_config()
reticulate::py_module_available("ip2locationio")
```

If needed, select the Python executable containing the installed Python package **before** Python is initialized in your R session:

```r
reticulate::use_python("/path/to/python", required = TRUE)
```

Restart R after changing Python environments. Then install `ip2location-io` in the selected environment and retry.

## Common use cases

- **Website or application localization:** Use approximate IP location to support region-aware content and reporting.
- **Traffic and network analysis:** Enrich IP-related records with country, coordinates, and ASN information within an R workflow.
- **Security review:** Consider proxy and other available signals as one part of a broader risk assessment, not as sole evidence of wrongdoing.
- **Location-based reporting:** Use helper functions to prepare country, geographic coordinate, or formatted-location outputs for R analysis.
- **Network research:** Investigate AS information and domain names hosted on an IP address.

## Documentation and support

- [R SDK quickstart and sample codes](https://ip2location-io-r.readthedocs.io/en/latest/quickstart.html)
- [R SDK function reference](https://ip2location-io-r.readthedocs.io/en/latest/code.html)
- [CRAN package and reference manual](https://CRAN.R-project.org/package=ip2locationio)
- [Python SDK dependency](https://github.com/ip2location/ip2location-io-python)
- [IP2Location.io API plans and query limits](https://www.ip2location.io/pricing)
- [IP Geolocation API authentication and rate limits](https://www.ip2location.io/ip2location-documentation)
- [Report an SDK issue or request a feature](https://github.com/ip2location/ip2location-io-r/issues)
- [API and account support](https://www.ip2location.io/contact-us)

## License

Licensed under the **MIT License**. See [LICENSE.TXT](./LICENSE.TXT).
