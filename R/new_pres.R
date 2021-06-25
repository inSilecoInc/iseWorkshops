#' Shortcuts for interactive functions.
#'
#' @param title presentation title. 
#' @param date presentation date.
#' @param author author name.
#' @param pres_name name of the folder that includes the presentation.  
#' @param overwrite a logical. Overwrite files if they exist (see [fs::dir_copy()]).
#'
#' @export 

new_pres <- function(title = "Cool title", date = Sys.Date(), author = "inSileco Tea", pres_name = "newpres", overwrite = FALSE) {
  dir_copy(
    path_package(package = "iseWorkshops", "templates/newpres"), ".", 
    overwrite = overwrite
  )
  writeLines(
    whisker::whisker.render(
      readLines("newpres/index.Rmd"), 
      , data = list(title = title, date = date, author = author)
    ), 
    "newpres/index.Rmd"
  )
  msgInfo("folder 'newpres' created")
  #
  msgInfo("Rendering presentation")
  render("newpres/index.Rmd")
  #
  msgInfo("Rendering presentation and opening it")
  openHTML("newpres/index.html")
  
  invisible(NULL)
}