#' Plot valgoppslutning
#'
#' @param aarstall En character vector av år.
#'
#' @return `ggplot2` object, et plot av valgoppslutning for det gitte året (eller årene, hvis flere år er oppgitt).
#' @export
#'
#' @examples
#' plot_valgoppslutning("2017")
#'
#'
#' @importFrom ggplot2 ggplot aes vars
#' @importFrom magrittr %>%
#' @importFrom rlang .data
plot_valgoppslutning <- function(aarstall){
  col_bgr <- "#F0F0F0"
  col_bar <- "#191919"

  # Forbered dataen
  ryddig_valgdata <- valgdata::velgeroppslutning %>%
    dplyr::filter(.data$aar %in% aarstall)  %>%
    dplyr::full_join(valgdata::partifarger, by = "parti") %>%
    dplyr::full_join(valgdata::akseposisjon, by = "parti") %>%
    dplyr::mutate(parti = forcats::fct_reorder(.data$parti, .data$aksepos))

  # Så plotter vi
  ggplot2::ggplot(ryddig_valgdata,
      # Parti på y-aksen, prosent på x-aksen
      aes(x = .data$prosent, y = .data$parti)) +
    ggplot2::geom_col(
      # Lag kolonner og farg dem basert på partiet
      aes(fill = I(.data$farge)), color = col_bar) +
    ggplot2::scale_x_continuous(
      # Juster x-aksen
      #limits = c(0, 30),
      breaks = seq(0, 30, by = 5),
      #expand = c(0, 0), # The horizontal axis does not extend to either side
      #position = "top"  # Labels are located on the top
    ) +
    ggplot2::scale_y_discrete(
      # Juster y-aksen
      expand = ggplot2::expansion(add = c(0, 0.5)),
      limits = rev) +
    ggplot2::facet_wrap(
      # Splitt opp i flere plott basert på år
      ggplot2::vars(.data$aar), dir = "v") +
    ggplot2::theme(
      # Remove y axis label
      axis.title.y = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = 10)),
      # Set background color to white
      panel.background = ggplot2::element_rect(fill = "white"),
      # Set the color and the width of the grid lines for the horizontal axis
      panel.grid.major.x = ggplot2::element_line(color = "#A8BAC4", size = 0.3),
      # Remove tick marks by setting their length to 0
      axis.ticks.length = ggplot2::unit(0, "mm"),
      # Remove the title for both axes
      axis.title = ggplot2::element_blank(),
      # Only left line of the vertical axis is painted in black
      axis.line.y.left = ggplot2::element_line(color = "black")
      # But customize labels for the horizontal axis
      #axis.text.x = element_text(family = "Econ Sans Cnd", size = 16)
    )
}
