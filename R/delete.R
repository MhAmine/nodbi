#' Delete documents
#'
#' @export
#' @param src source object, result of call to src
#' @param key A key
#' @param ... Ignored for now
#' @examples \dontrun{
#' # couchdb
#' (src <- src_couchdb())
#' docdb_create(src, "mtcars", mtcars)
#' docdb_get(src, "mtcars")
#' docdb_delete(src, "mtcars")
#'
#' # etcd
#' # src <- src_etcd()
#' # docdb_create(src, "/iris", iris)
#' # docdb_get(src, "/iris")
#' # docdb_delete(src, "/iris")
#'
#' # elasticsearch
#' src <- src_elastic()
#' docdb_create(src, "iris", iris)
#' docdb_get(src, "iris")
#' docdb_delete(src, "iris")
#' 
#' # Redis
#' src <- src_redis()
#' docdb_create(src, key = "mtcars", value = mtcars)
#' docdb_get(src, "mtcars")
#' docdb_delete(src, "mtcars")
#'
#' # mongo
#' src <- src_mongo("stuff")
#' docdb_create(src, "iris", iris)
#' docdb_get(src, "iris")
#' docdb_delete(src)
#' }
docdb_delete <- function(src, key, ...){
  UseMethod("docdb_delete")
}

#' @export
docdb_delete.src_couchdb <- function(src, key, ...) {
  sofa::db_delete(src$con, dbname = key, ...)
}

#' @export
docdb_delete.src_etcd <- function(src, key, ...) {
  src$delete(key, dir = TRUE, recursive = TRUE, ...)
}

#' @export
docdb_delete.src_elastic <- function(src, key, ...) {
  elastic::index_delete(key, verbose = FALSE)
}

#' @export
docdb_delete.src_redis <- function(src, key, ...) {
  src$con$DEL(key)
}

#' @export
docdb_delete.src_mongo <- function(src, key, ...) {
  src$con$drop()
}
