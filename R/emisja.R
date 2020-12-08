#' Funckja oblicza emisję splin dla wybranej kategorii oraz standardu
#'
#' @param dane dataframe
#' @param kategoria string
#' @param euro string
#' @param mode string
#' @param substancja string
#'
#' @return dataframe
#'
#' @examples
#' emisja(input, 'Passenger Cars', 'Euro 5', '', 'CO')
#'
#' @import dplyr
#' @export
#'

emisja <- function(dane, kategoria, euro, mode, substancja) {

  out <- dane %>%
    filter(Category %in% kategoria) %>%
    filter(Euro.Standard %in% euro) %>%
    filter(Pollutant %in% substancja) %>%
    filter(Mode %in% mode)

  out <- inner_join(x = out, y = input, by = "Segment")

  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  out[!duplicated(out), ] -> out

  return(out)

}
