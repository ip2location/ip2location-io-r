# Quickstart

## Dependencies

This package requires API key to function. You may sign up for a free API key at <https://www.ip2location.io/pricing>.

This package also required IP2Location.io Python library to work. In order to install IP2Proxy Python library, you can use the following command:

   ```Python
   pip install ip2location-io
   ```

## Installation

1. In your RStudio IDE, type the following command into the console:

   ```R
   install.packages("devtools")
   require(devtools)
   ```

2. After that, install IP2Location.io R package by using the following command: `install_github("ip2location/ip2location-io-r")`

## Sample Codes

### Lookup IP Address Geolocation Data

You can make a geolocation data lookup for an IP address as below:

``` r
library(ip2locationio)

ip2locationio::setApiKey("YOUR_API_KEY")
result = ip2locationio::lookup("8.8.8.8")
print(result)
```
