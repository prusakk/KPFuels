#' Funckja oblicza emisję dla wybranej kategorii oraz standardu
#'
#' @param dane data.frame
#' @param kategoria character
#' @param euro character
#' @param mode character
#' @param substancja character
#'
#' @return data.frame
#'
#' @examples
#' emisja(input, 'Passenger Cars', 'Euro 5', '', 'CO')
#' @export
#'

emisja <- function(dane, kategoria, euro, mode, substancja) {

  out <- wskazniki %>%
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

  return(out)

}
