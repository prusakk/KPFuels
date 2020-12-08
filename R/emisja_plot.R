#' Funkcja wykonuje wykres na podstawie danych wynikowych z funkcji "emisja"
#'
#' Argumenty funkcji:
#'
#' @param data - dataframe, dane wynikowe funckji "emisja"
#' @return plot
#'
#' @import plotly
#' @export

emisja_plot <- function(data)
{
  plot <- plot_ly(data, x = ~Nat, y = ~Emisja, color = ~Segment, colors = "Set1", mode = "markers", type = "scatter")
  return(plot)
}
