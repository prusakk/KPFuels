#' Funkcja wykonuje wykres na podstawie danych wynikowych z funkcji "emisja"
#'
#' Argumenty funkcji:
#'
#' @param data - dataframe, dane wynikowe funckji "emisja"
#' @param typ - character, typ rysowanego wykresy "bar" lub "scatter"
#' @return plot
#'
#' @import plotly
#' @export

emisja_plot <- function(data, typ)
{
  switch(typ,
         "bar" = {
           plot <- plot_ly(data, x = ~Euro.Standard, y = ~Emisja, color = ~Segment, colors = "Set1",
                           type = "bar") -> plot
         },

         "scatter" = {
           plot <- plot_ly(data, x = ~Euro.Standard, y = ~Emisja, color = ~Segment, colors = "Set1", mode = "markers", type = "scatter")
         }
  )
  return(plot)
}
