#' Remove axis titles in `ggplot2`
#'
#' @return `ggplot2` theme
#' @export
theme_remove_axis_labs <- function(){
  ggplot2::theme(axis.title = ggplot2::element_blank())
}
