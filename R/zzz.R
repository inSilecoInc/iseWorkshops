# Internals
#' @importFrom crayon blue red green yellow
#' @importFrom cli style_bold style_underline
#' @importFrom curl curl_download
#' @importFrom fs path path_package path_real file_exists dir_copy dir_delete file_copy file_move path_rel
#' @importFrom glue glue
#' @importFrom icons fontawesome icon_style
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

## Messages 
msgInfo <- function(..., appendLF = TRUE) {
  txt <- paste(cli::symbol$info, ...)
  message(blue(txt), appendLF = appendLF)
  invisible(txt)
}

msgError <- function(..., appendLF = TRUE) {
  txt <- paste(cli::symbol$cross, ...)
  message(red(txt), appendLF = appendLF)
  invisible(txt)
}

msgSuccess <- function(..., appendLF = TRUE) {
  txt <- paste(cli::symbol$tick, ...)
  message(green(txt), appendLF = appendLF)
  invisible(txt)
}

msgWarning <- function(..., appendLF = TRUE) {
  txt <- paste(cli::symbol$warning, ...)
  message(yellow(txt), appendLF = appendLF)
  invisible(txt)
}


kkble <- function(tbl, ...)  {
  knitr::kable(tbl, format = "simple", row.names = FALSE, ...)
}

# https://stackoverflow.com/questions/10969015/how-to-open-a-local-html-file-from-r-in-an-operating-system-independent-way
openHTML <- function(x) browseURL(paste0('file://', file.path(getwd(), x)))