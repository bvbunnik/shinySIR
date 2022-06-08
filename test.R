#For testing purposes:
library(RColorBrewer)
library(shiny)
library(tidyverse)

sourceDir <- function(path, trace = TRUE, ...) {
  op <- options(); on.exit(options(op)) # to reset after each 
  for (nm in list.files(path, pattern = "[.][RrSsQq]$")) {
    if(trace) cat(nm,":")
    source(file.path(path, nm), ...)
    if(trace) cat("\n")
    options(op)
  }
}

sourceDir("R/")

run_shiny(model="SIRvaccination", sigfigs = 6,parm_names = c("R_0", "Infectious period (days)","Lifespan (years)", "Proportion Vaccinated"),
          parm0= c(R0=5,Ip=5,mu=61,p=0.5),
          parm_min=c(R0 = 0, Ip = 0, mu = 0, p = 0),
          parm_max = c(R0 = 10, Ip = 10, mu = 70, p = 1.0),
          tmax = 70*365)

run_shiny(model="SIR")

get_params(model="SIRvaccination")
