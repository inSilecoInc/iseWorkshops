new_pres <- function(title = "Cool title", date = Sys.Date(), author = "inSileco Tea", overwrite = FALSE) {
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
  NULL
}