#' Download workshops
#'
#' Download a selection of workshops.
#'
#' @param id a vector of identifiers.
#' @param path path where the workshops files are or a path to a folder where
#' the files will be extracted if download is set to `TRUE`.
#' @param verbose a logical. Should extra information be reported on progress?
#'
#' @export
#'
#' @examples
#' \dontrun{
#   wksh_dl()
#' wksh_dl(1)
#' wksh_dl(c(1, 2))
#' wksh_dl("a")
#' }
#'
wksh_dl <- function(id, path = ".", verbose = TRUE) {
  wtb <- wksh_tbl()
  if (missing(id)) {
    cli::cli_alert_warning("id is missing")
    cli::cli_alert_info("Available workshops for downloading are:")
    kkble(wtb)
  } else {
    if (length(id) > 1) {
      lapply(
        id, function(x) wksh_dl(x, path, verbose)
      )
    } else {
      if (id %in% wtb$id) {
        if (verbose) {
          cli::cli_alert_info(
            glue("downloading '{wtb$repo_name[id]}' from {wtb$repo_type[id]}")
          )
        }
        f <- tempfile(tmpdir = ".", fileext = ".zip")
        curl_download(
          gh_url_zip(wtb$repo_name[id], wtb$branch[id]),
          destfile = f
        )
        unzip(f, exdir = path)
        unlink(f)
        invisible(NULL)
      } else {
        cli::cli_alert_danger(id, "is not a valid id.")
      }
    }
  }
}

wksh_tbl <- function() {
  nm <- c(
    "workshop_raster",
    "interactiveRaster",
    "workshop_reproducibility",
    "wksh_raster_CWS",
    "git_markdown",
    "csasdown_workshop"
  )
  data.frame(
    id = seq_along(nm),
    repo_name = nm,
    branch = rep("main", 6),
    repo_type = rep("GitHub", 6)
  )
}
