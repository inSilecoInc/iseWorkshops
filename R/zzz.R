# Internals
#' @importFrom curl curl_download
#' @importFrom fs path path_package path_real file_exists dir_copy dir_delete file_copy file_move path_rel
#' @importFrom glue glue
#' @importFrom rmarkdown render
#' @importFrom utils unzip browseURL
#' @importFrom whisker whisker.render

NULL

# HELPERS

## Glue
glue_path <- function(...) {
  glue(..., .sep = .Platform$file.sep, .envir = parent.frame(1))
}
glue_url <- function(...) {
  glue(..., .sep = "/", .envir = parent.frame(1))
}

## URL
gh_url_zip <- function(repo_name, branch = "main") {
  glue("https://github.com/inSilecoInc/{repo_name}/archive/refs/heads/{branch}.zip")
}


kkble <- function(tbl, ...) {
  knitr::kable(tbl, format = "simple", row.names = FALSE, ...)
}

# https://stackoverflow.com/questions/10969015/how-to-open-a-local-html-file-from-r-in-an-operating-system-independent-way
openHTML <- function(x) browseURL(paste0("file://", file.path(getwd(), x)))
