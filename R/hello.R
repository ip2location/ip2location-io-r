#' @title Set IP2Location.io API key
#'
#' @description Set IP2Location.io API key for lookup. Free API key can be obtained from <https://www.ip2location.io/sign-up?ref=1/>
#' @param api_key IP2Location.io API key
#' @return NULL
#' @import reticulate
#' @export
#' @examples \dontrun{
#' setApiKey("YOUR_API_KEY")
#' }
#'

setApiKey <- function(api_key) {
  py_run_string("import ip2locationio")
  apikeyString = paste("configuration = ip2locationio.Configuration('", api_key , "')", sep = "")
  py_run_string(apikeyString)
}

#' @title Lookup for IP address geolocation and proxy information
#'
#' @description Lookup for a comprehensive of the information such as location, ASN, ISP and proxy. The availability of the data will depends on the plan you have signed up for your API key.
#' @param ip IPv4 or IPv6 address
#' @return Return all the geolocation and proxy information about the IP address
#' @import reticulate
#' @import jsonlite
#' @export
#' @examples \dontrun{
#' get_all("1.0.241.135")
#' }
#'

get_all <- function(ip){
  py_run_string("import json")
  py_run_string("ipgeolocation = ip2locationio.IPGeolocation(configuration)")
  address = paste("rec = ipgeolocation.lookup('", ip, "')", sep = "")
  py_run_string(address)
  py_run_string("j = json.dumps(rec)")
  result = fromJSON(py$j)
  return(result)
}
