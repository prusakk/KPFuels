#' Funckja do obliczania genrowanych emisji przez pojazdy spalinowe
#'
#' @param dane dataframe - dane wejściowe
#' @param kategoria character - kategoria pojazdu np. Passenger Cars, Heavy Duty Trucks itd.
#' @param euro character - norma emisji spalin np. Euro II, Euro III itd.
#' @param mode character - tryb jazdy pojazdu np. Highway, Urban Peak itd.
#' @param substancja character - nazwa substacji emisyjnej np. CH4, N2O
#'
#' @return dataframe
#'
#' @import dplyr
#' @export
#'
#' @details Wzór wykorzystywany do obliczenia emsji
#'
#' (Alpha x Procent^2 + Beta x Procent + Gamma + (Delta/Procent)/
#' (Epsilon x Procent^2 + Zita x Procent + Hta) x (1-Reduction)
#'


emisja <- function(dane = input,
                   kategoria = "Passanger Cars",
                   euro = "Euro 4",
                   mode = "",
                   substancja = "CO") {

  out <- wskazniki %>%
    filter(Category %in% kategoria) %>%
    filter(Euro.Standard %in% euro) %>%
    filter(Pollutant %in% substancja) %>%
    filter(Mode %in% mode)

  out <- inner_join(x = out, y = input, by = c("Segment", "Fuel", "Technology"))

  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  out[!duplicated(out), ] -> out

  return(out)

}
