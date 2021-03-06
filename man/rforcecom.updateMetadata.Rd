% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rforcecom.updateMetadata.R
\name{rforcecom.updateMetadata}
\alias{rforcecom.updateMetadata}
\title{Update Object or Field Metadata in Salesforce}
\usage{
rforcecom.updateMetadata(session, 
                                metadata_type, 
                                metadata, verbose=FALSE)
}
\arguments{
\item{session}{a named character vector defining parameters of the api connection as returned by \link{rforcecom.login}}

\item{metadata_type}{a character string on what type of metadata to create}

\item{metadata}{a list of metadata components to be created formatted as XML before being sent via API}

\item{verbose}{a boolean indicating whether to print messages during metadata creation}
}
\value{
A \code{data.frame} containing the creation result for each submitted metadata component
}
\description{
This function takes a list of Metadata components and sends them 
to Salesforce to update an object that already exists
}
\note{
The update key is based on the fullName parameter of the metadata, so updates are triggered
when an existing Salesforce element matches the metadata type and fullName.
}
\examples{
\dontrun{

# read the metadata of the existing Account object
# we will use this object as a template to create a custom version
metadata_info <- rforcecom.readMetadata(session, 
                                        metadata_type='CustomObject', 
                                        object_names=c('Account'))

custom_metadata <- metadata_info$records

# make some adjustments to customize the object
custom_metadata$fullName <- 'Custom_Account23__c'
# specify a plural label
custom_metadata$pluralLabel <- 'Custom_Account23s'
# specify a name field
custom_metadata$nameField <- list(displayFormat='AN-{0000}', 
                                  label='Account Number', 
                                  type='AutoNumber')
# remove default actionOverrides, this cannot be set during creation
custom_metadata[which(names(custom_metadata) \%in\% c("actionOverrides"))] <- NULL

# set the deployment status, this must be set before creation
custom_metadata$deploymentStatus <- 'Deployed' 

# make a description to identify this easily in the UI setup tab
custom_metadata$description <- 'created by the Metadata API'

new_custom_object <- rforcecom.createMetadata(session, 
                                              metadata_type='CustomObject', 
                                              metadata=custom_metadata)

# specify a plural label
update_metadata <- list(list(fullName='Custom_Account23__c', 
                             label='New Label Custom_Account23',
                             pluralLabel='Custom_Account23s', 
                             nameField=list(displayFormat='AN-{0000}',
                                            label='Account Number',
                                            type='AutoNumber'), 
                             deploymentStatus='Deployed', 
                             sharingModel='ReadWrite'))
updated_custom_object <- rforcecom.updateMetadata(session, 
                                                   metadata_type='CustomObject', 
                                                   metadata=update_metadata)

}
}
\references{
\url{https://developer.salesforce.com/docs/atlas.en-us.api_meta.meta/api_meta/}
}
\concept{
update metadata salesforce api
}

