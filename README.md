
<!-- README.md is generated from README.Rmd. Please edit that file -->

# KPFuels

<!-- badges: start -->

<!-- badges: end -->

Pakiet `KPFuels`, utrzony na potrzeby zaliczenia przedmiotu Metody
Inwentrayzacji i Szacowanie Emisji. Pakiet zawiera dwie funkcje służące
do obliczania emisji zanieszczyszczeń pojazdów z silnikami spalinowymi
oraz sporządzenie wykresu przedstawiającego wyniki. Funkcje pakietu
domyślnie korzystają z danych z nim załączonych. Dane źródłowe zostały
udostępnione przez Eurpejską Agencję Środowiska - EEA. Dane te zostały
wstępnie przetworzone do obiektu `wskazniki` oraz `input`.

## Instalacja z winietą

W razie potrzeby należy zainstalować pakiet `devtools`

``` r
if (!require(devtools)) {install.packages("devtools"); require(devtools)}
```

Instalacja pakietu z `Github`

``` r
devtools::install_github("prusakk/KPFuels")
```

## Przykładowe zastosowania

Użycie wejściowych danych domyślnych:

``` r
library(KPFuels)

data <- emisja()

data
#>         Category             Fuel Euro.Standard Technology Pollutant Mode
#> 1 Passenger Cars           Petrol        Euro 4        PFI        CO     
#> 2 Passenger Cars           Diesel        Euro 4        DPF        CO     
#> 3 Passenger Cars LPG Bifuel ~ LPG        Euro 4       <NA>        CO     
#>   Segment        Nat    Emisja
#> 1   Small 164.307469 35.891798
#> 2  Medium  35.443693  2.114761
#> 3    Mini   4.923702  1.075548
```
