#' Shortcuts for fontawesome icons.
#'
#' @param ... further argument passed to [icons::fontawesome()].
#' @param fill color to fill the icon with see [icons::icon_style()].
#' @param help if `TRUE` then a table with shortcut names (`fun`) and corresponding icons is displayed.
#'
#' @export 

rfa <- function(..., fill = "currentColor", help = FALSE) {
  if (help) {
    out <- data.frame(
      fun = c(
        "gh()",
        "gl()",
        "gt()",
        "rp()",
        "ch()",
        "ck()",
        "db()",
        "nf()",
        "lk()",
        "bk()",
        "fl()",
        "fd()",
        "pd()",
        "ar()",
        "cg()",
        "tr()",
        "cb()",
        "ey()",
        "lc()",
        "so()",
        "wk()"
      ),
      icons = c(
      "github",
      "gitlab",
      "git",
      "r-project",
      "check",
      "clock",
      "database",
      "info-circle",
      "link",
      "book",
      "file",
      "folder",
      "file-pdf",
      "arrow-right",
      "cogs",
      "exclamation-triangle",
      "clipboard",
      "eye",
      "laptop-code",
      "stack-overflow",
      "wikipedia-w")
    )
    tmp <- out[order(out$fun), ]
    rownames(tmp) <- NULL
    msgInfo("icons available are")
    print(kkble(tmp))
    invisible(tmp)
  } else {
    icon_style(fontawesome(...), fill = fill)
  }
}


#' @export
#' @rdname rfa
gh <- function() rfa("github")

#' @export
#' @rdname rfa
gl <- function() rfa("gitlab")

#' @export
#' @rdname rfa
gt <- function() rfa("git")


#' @export
#' @rdname rfa
rp <- function() rfa("r-project")

#' @export
#' @rdname rfa
ch <- function() rfa("check")

#' @export
#' @rdname rfa
ck <- function() rfa("clock")

#' @export
#' @rdname rfa
db <- function() rfa("database")

#' @export
#' @rdname rfa
nf <- function() rfa("info-circle")

#' @export
#' @rdname rfa
lk <- function() rfa("link")

#' @export
#' @rdname rfa
bk <- function() rfa("book")

#' @export
#' @rdname rfa
fl <- function() rfa("file")

#' @export
#' @rdname rfa
fd <- function() rfa("folder")

#' @export
#' @rdname rfa
pd <- function() rfa("file-pdf")

#' @export
#' @rdname rfa
ar <- function() rfa("arrow-right")

#' @export
#' @rdname rfa
cg <- function() rfa("cogs")

#' @export
#' @rdname rfa
tr <- function() rfa("exclamation-triangle")

#' @export
#' @rdname rfa
cb <- function() rfa("clipboard")

#' @export
#' @rdname rfa
ey <- function() rfa("eye")

#' @export
#' @rdname rfa
lc <- function() rfa("laptop-code")

#' @export
#' @rdname rfa
so <- function() rfa("stack-overflow")

#' @export
#' @rdname rfa
wk <- function() rfa("wikipedia-w")