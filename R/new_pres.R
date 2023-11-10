#' Shortcuts for interactive functions.
#'
#' @param title presentation title.
#' @param date presentation date.
#' @param author author name.
#' @param pres_name name of the folder that includes the presentation.
#' @param overwrite a logical. Overwrite files if they exist,
#' @param output_dir output directory, by default a folder "pres_{date stamp}" i
#' s created.
#' (see [fs::dir_copy()]).
#'
#' @export

new_pres <- function(title = "Your title", date = Sys.Date(),
                     author = "inSileco Team", pres_name = "newpres",
                     overwrite = FALSE, output_dir = NULL) {
  if (is.null(output_dir)) {
    output_dir <- fs::dir_create(sprintf("pres_%s", Sys.Date())) |>
      as.character()
  }
  fs::dir_copy(
    fs::path_package(package = "iseWorkshops", "templates/newpres"), output_dir,
    overwrite = overwrite
  )
  rmd <- file.path(output_dir, "index.Rmd")
  writeLines(
    whisker::whisker.render(
      readLines(
        fs::path_package(
          package = "iseWorkshops",
          file.path("templates", "newpres", "index.Rmd")
        )
      ),
        data = list(title = title, date = date, author = author)
      ),
      rmd
  )
  cli::cli_alert_info("folder 'newpres' created")
  #
  cli::cli_alert_info("Rendering presentation")
  rmarkdown::render(rmd)
  #
  cli::cli_alert_info("Rendering presentation and opening it")
  openHTML(rmd |> fs::path_ext_set("html"))

  invisible(NULL)
}
