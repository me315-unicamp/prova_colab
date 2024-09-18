## Instalação r2u
shell_call <- function(command, ...) {
  result <- system(command, intern = TRUE, ...)
  cat(paste0(result, collapse = "\n"))
}

download.file("https://github.com/eddelbuettel/r2u/raw/master/inst/scripts/add_cranapt_jammy.sh",
              "add_cranapt_jammy.sh")
Sys.chmod("add_cranapt_jammy.sh", "0755")
shell_call("./add_cranapt_jammy.sh")
bspm::enable()
options(bspm.version.check=FALSE)
shell_call("rm add_cranapt_jammy.sh")

shell_call("apt install git")
shell_call("git clone git@github.com:me315-unicamp/prova_colab.git")
shell_call("mv prova_colab/q01 .")
shell_call("rm -fr prova_colab")

install.packages(c("tidyverse", "RSQLite", "nycflights13"))

library(tidyverse)
library(RSQLite)
library(nycflights13)
dir.create("q02")
write_csv(flights, "q02/flights.csv")
write_csv(airports, "q02/airports.csv")
write_csv(airlines, "q02/airlines.csv")
