% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rforcecom.deleteMetadata.R
\name{rforcecom.deleteMetadata}
\alias{rforcecom.deleteMetadata}
\title{Delete Object or Field Metadata in Salesforce}
\usage{
rforcecom.deleteMetadata(session, 
                                metadata_type, 
                                object_names, 
                                verbose=FALSE)
}
\arguments{
\item{session}{a named character vector defining parameters of the api connection as returned by \link{rforcecom.login}}

\item{metadata_type}{a character string on what type of metadata that is being read}

\item{object_names}{a character vector of names that we wish to read metadata for}

\item{verbose}{a boolean indicating whether to print the XML request}
}
\value{
A \code{data.frame} containing the creation result for each submitted metadata component
}
\description{
This function takes a a request of named elements in Salesforce and 
deletes them
}
\examples{
\dontrun{

metadata_info <- rforcecom.deleteMetadata(session, 
                                          metadata_type='CustomObject', 
                                          object_names=c('Custom_Account1__c'))
}
}
\references{
\url{https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/}
}
\seealso{
\link{rforcecom.listMetadata}
}
\concept{
delete metadata salesforce api
}

