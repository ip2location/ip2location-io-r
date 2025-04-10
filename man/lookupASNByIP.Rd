% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/IP2Locationio.R
\name{lookupASNByIP}
\alias{lookupASNByIP}
\title{Lookup an IP address's Autonomous system name and number}
\usage{
lookupASNByIP(ip)
}
\arguments{
\item{ip}{IPv4 or IPv6 address}
}
\value{
Return the Autonomous system name and number of the the IP address
}
\description{
Lookup for the IP address's Autonomous system name and number
}
\examples{
\dontrun{
lookupASNByIP("1.0.241.135")
}

}
