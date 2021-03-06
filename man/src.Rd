% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/src.R
\name{src}
\alias{src}
\title{Setup database connections}
\description{
Setup database connections
}
\details{
There is a \code{src_*()} function to setup a connection to each
of the database backends. Each has their own unique set of parameters.
\itemize{
\item MongoDB - \code{\link[=src_mongo]{src_mongo()}}
\item CouchDB - \code{\link[=src_couchdb]{src_couchdb()}}
\item Etcd - \code{\link[=src_etcd]{src_etcd()}}
\item Elasticsearch - \code{\link[=src_elastic]{src_elastic()}}
}
}
