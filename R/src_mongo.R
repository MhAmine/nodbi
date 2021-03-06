#' Setup a mongoDB database connection
#'
#' @export
#' @param collection (character) name of collection
#' @param db (character) name of database
#' @param url (character) address of the mongodb server in mongo connection
#' string URI format.
#' @param ... additional named params passed on to [mongolite::mongo]
#' @examples \dontrun{
#' (con <- src_mongo())
#' print(con)
#' }
src_mongo <- function(collection = "test", db = "test",
                      url = "mongodb://localhost", ...) {

  con <- mongolite::mongo(collection, db, url, ...)
  structure(list(con = con, db = db), class = c("src_mongo", "docdb_src"))
}

#' @export
print.src_mongo <- function(x, ...) {
  con <- x$con
  db <- x$db
  srv <- con$info()
  cat(sprintf("MongoDB %s (uptime: %ss)\nURL: %s/%s\n",
              srv$server$version, srv$server$uptime, srv$server$host, db))
}
