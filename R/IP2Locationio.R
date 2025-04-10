#' @title Set IP2Location.io API key
#'
#' @description Set IP2Location.io API key for lookup. Free API key can be obtained from <https://www.ip2location.io/sign-up?ref=1/>
#' @param api_key IP2Location.io API key
#' @return No return value, called for side effects.
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
#' lookup("1.0.241.135")
#' }
#'

lookup <- function(ip){
  py_run_string("import json")
  py_run_string("ipgeolocation = ip2locationio.IPGeolocation(configuration)")
  address = paste("rec = ipgeolocation.lookup('", ip, "')", sep = "")
  py_run_string(address)
  py_run_string("j = json.dumps(rec)")
  result = fromJSON(py$j)
  return(result)
}

#' @title Lookup for domains hosted on an IP address.
#'
#' @description Lookup for a list of hosted domain names by the IP address.
#' @param ip IPv4 or IPv6 address
#' @param page (optional) Pagination result returns of the hosted domains. If unspecified, 1st page will be used.
#' @return Return list of hosted domain names by the IP address
#' @import reticulate
#' @import jsonlite
#' @export
#' @examples \dontrun{
#' lookupHostedDomain("1.0.241.135")
#' }
#'

lookupHostedDomain <- function(ip, page){
  py_run_string("import json")
  py_run_string("hosteddomain = ip2locationio.HostedDomain(configuration)")
  if(missing(page)) {
    address = paste("rec = hosteddomain.lookup('", ip, "')", sep = "")
  } else {
    address = paste("rec = hosteddomain.lookup('", ip, "','", page, "')", sep = "")
  }

  py_run_string(address)
  py_run_string("j = json.dumps(rec)")
  result = fromJSON(py$j)
  return(result)
}


#' @title Lookup an IP address's country
#'
#' @description Lookup for the IP address's country
#' @param ip IPv4 or IPv6 address
#' @return Return the country name of the the IP address
#' @import reticulate
#' @export
#' @examples \dontrun{
#' lookupCountryByIP("1.0.241.135")
#' }
#'

lookupCountryByIP <- function(ip){
  py_run_string("ipgeolocation = ip2locationio.IPGeolocation(configuration)")
  address = paste("rec = ipgeolocation.lookup('", ip, "')", sep = "")
  py_run_string(address)
  py_run_string("country_name = rec['country_name']")
  result_from_python <- py$country_name
  return(result_from_python)
}

#' @title Lookup an IP address's coordinate
#'
#' @description Lookup for the IP address's coordinate
#' @param ip IPv4 or IPv6 address
#' @return Return the coordinate of the the IP address
#' @import reticulate
#' @export
#' @examples \dontrun{
#' lookupCoordinateByIP("1.0.241.135")
#' }
#'

lookupCoordinateByIP <- function(ip){
  py_run_string("ipgeolocation = ip2locationio.IPGeolocation(configuration)")
  address = paste("rec = ipgeolocation.lookup('", ip, "')", sep = "")
  py_run_string(address)
  py_run_string("coordinate = (rec['latitude'], rec['longitude'])")
  result_from_python <- py$coordinate
  return(result_from_python)
}

#' @title Lookup an IP address's Autonomous system name and number
#'
#' @description Lookup for the IP address's Autonomous system name and number
#' @param ip IPv4 or IPv6 address
#' @return Return the Autonomous system name and number of the the IP address
#' @import reticulate
#' @export
#' @examples \dontrun{
#' lookupASNByIP("1.0.241.135")
#' }
#'

lookupASNByIP <- function(ip){
  py_run_string("ipgeolocation = ip2locationio.IPGeolocation(configuration)")
  address = paste("rec = ipgeolocation.lookup('", ip, "')", sep = "")
  py_run_string(address)
  py_run_string("as_info = {'as_name': rec['as'], 'as_number': rec['asn']}")
  result_from_python <- py$as_info
  return(result_from_python)
}

#' @title Lookup an IP address's location in text
#'
#' @description Lookup for the IP address's location in text
#' @param ip IPv4 or IPv6 address
#' @return Return the location of the the IP address in text
#' @import reticulate
#' @export
#' @examples \dontrun{
#' lookupLocationByIP("1.0.241.135")
#' }
#'

lookupLocationByIP <- function(ip){
  py_run_string("ipgeolocation = ip2locationio.IPGeolocation(configuration)")
  address = paste("rec = ipgeolocation.lookup('", ip, "')", sep = "")
  py_run_string(address)
  py_run_string("location = f'{rec['city_name']}, {rec['region_name']}, {rec['country_name']}'")
  result_from_python <- py$location
  return(result_from_python)
}
