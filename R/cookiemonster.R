#' Creates a Cookie Monster lineup
#'
#' @param data default dataset to be used for the plot. Data.frame.
#' @param mapping Default list of aesthetic mappings to use for plot.
#' @param var name of variable to permute.
#' @param n total number of samples to generate (including true data).
#' @param nrow number of rows in lineup.
#' @param procent procent of area that Cookie Monster will occupy.
#' @param \\dots arguments passed on to lineup.
#' @return A lineup plot with cookie monster.
#' @examples
#' \dontrun{
#' cookiemonster(mtcars, var = "mpg") +
#'   aes(mpg, wt) +
#'   geom_point()
#'
#' cookiemonster(mtcars, aes(mpg, wt), "mpg") +
#'   geom_point()
#' }
#'
#' cookiemonster(mtcars, aes(mpg, wt), "mpg", procent = 0.2) +
#'   geom_point() +
#'   theme_bw() +
#'   geom_smooth()
#' @export
cookiemonster <- function(data, mapping = aes(), var = character(),
                          n = 10, nrow = 2, procent = 0.5, ...) {

  p1 <- ggplot() +
    xlim(c(0, 1)) +
    ylim(c(0, 1)) +
    annotation_raster(cookiemonster::monster_raster, 0, 1, 0, 1) +
    theme_void()

  null_data <- nullabor::lineup(nullabor::null_permute(var),
                                data, n = n, ...)

  p2 <- ggplot(null_data, mapping) +
    facet_wrap(~ .sample, nrow = nrow)

  p1 + p2 + patchwork::plot_layout(ncol = 1, heights = c(procent, 1 - procent))
}
