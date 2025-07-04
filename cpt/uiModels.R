options(RxODE.cache.directory="~/.rxCache")
## runModel <- 'U001_solve'; runEst <- 'saem'; source('uiModels.R')
## runModel <- "U001"; runEst <- "saem"; source("uiModels.R")
## runModel <- "U001_solve"; source("uiModels.R")
## runModel <- "U003"; runEst <- "focei"; source("uiModels.R")
## runModel <- "U014"; runEst <- "focei"; source("uiModels.R")
## runModel <- "U025"; runEst <- "focei"; source("uiModels.R")
## runModel <- "U034"; runEst <- "focei"; source("uiModels.R")
## runModel <- "U048"; runEst <- "focei"; source("uiModels.R")
## runModel <- "U062"; runEst <- "focei"; source("uiModels.R")
## runEst <- "saem"; source("uiModels.R")
## runEst <- "foceiLL"; source("uiModels.R")
## Use runModel to select one model to run.  ie
## runModel <- "U014" and then source the file
## Use runEst to select one estimation type ie
## runModel <- "U029"; "U046"
## runEst  <- "focei"
library(nlmixr2)
library(babelmixr2) # to allow nonmem/monolix comparison
library(testthat)
source("helper-prep_fit.R")
one.compartment.IV.model <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lCl <- 1.6      #log Cl (L/hr)
    lVc <- 4.5      #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.1   #IIV V
    eta.Cl ~ 0.1   #IIV Cl
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    Cl <- exp(lCl + eta.Cl)
    # RxODE-style differential equations are supported
    d / dt(centr) = -(Cl / Vc) * centr;
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

one.compartment.IV.model.solve <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lCl <- 1.6      #log Cl (L/hr)
    lVc <- 4.5      #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.1   #IIV V
    eta.Cl ~ 0.1   #IIV Cl
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    Cl <- exp(lCl + eta.Cl)
    cp <- linCmt()
    cp ~ prop(prop.err)
  })
}

one.compartment.IV.MM.model <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    lVM <- 7      #log Vmax (mg/hr)
    lKM <- 5.7    #log KM (mg/L)
    lVc <- 4.5    #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.15
    eta.VM ~ 0.15
    eta.KM ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    VM <- exp(lVM + eta.VM)
    KM <- exp(lKM + eta.KM)
    # RxODE-style differential equations are supported
    d/dt(centr)  = -(VM*centr/Vc)/(KM+centr/Vc);
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

one.compartment.IV.MM.model2 <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    lVM <- 6.9    #log Vmax (mg/hr)
    lKM <- 5.8    #log KM (mg/L)
    lVc <- 4.2    #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.2, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.1
    eta.VM ~ 0.14
    eta.KM ~ 0.1
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    VM <- exp(lVM + eta.VM)
    KM <- exp(lKM + eta.KM)
    # RxODE-style differential equations are supported
    d/dt(centr)  = -(VM*centr/Vc)/(KM+centr/Vc);
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}


one.compartment.oral.model <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lCl <- 1.8      #log Cl (L/hr)
    lVc <- 4.7      #log V (L)
    lKA <- 0.2      #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Cl ~ 0.15
    eta.Vc ~ 0.15
    eta.KA ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Cl <- exp(lCl + eta.Cl)
    Vc <- exp(lVc + eta.Vc)
    KA <- exp(lKA + eta.KA)
    # RxODE-style differential equations are supported
    d/dt(depot)    = -KA*depot;
    d/dt(centr)  =  KA*depot-(Cl/Vc)*centr;
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

one.compartment.oral.model.solve <- function(){
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lCl <- 1.8      #log Cl (L/hr)
    lVc <- 4.7      #log V (L)
    lKA <- 0.2      #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Cl ~ 0.15
    eta.Vc ~ 0.15
    eta.KA ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Cl <- exp(lCl + eta.Cl)
    Vc <- exp(lVc + eta.Vc)
    KA <- exp(lKA + eta.KA)
    cp <- linCmt()
    cp ~ prop(prop.err)
  })
}

one.compartment.oral.model2 <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lCl <- 1.6      #log Cl (L/hr)
    lVc <- 4.5      #log V (L)
    lKA <- 0.2      #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Cl ~ 0.15
    eta.Vc ~ 0.15
    eta.KA ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Cl <- exp(lCl + eta.Cl)
    Vc <- exp(lVc + eta.Vc)
    KA <- exp(lKA + eta.KA)
    # RxODE-style differential equations are supported
    d/dt(depot)    = -KA*depot;
    d/dt(centr)  =  KA*depot-(Cl/Vc)*centr;
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

one.compartment.oral.model2.solve <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lCl <- 1.6      #log Cl (L/hr)
    lVc <- 4.5      #log V (L)
    lKA <- 0.2      #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Cl ~ 0.15
    eta.Vc ~ 0.15
    eta.KA ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Cl <- exp(lCl + eta.Cl)
    Vc <- exp(lVc + eta.Vc)
    KA <- exp(lKA + eta.KA)
    # And is assumed to follow proportional error estimated by prop.err
    cp <- linCmt()
    cp ~ prop(prop.err)
  })
}

one.compartment.oral.MM.model <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lVM <- 7      #log Vmax (mg/hr)
    lKM <- 5.7    #log KM (mg/L)
    lVc <- 4.5    #log V (L)
    lKA <- 0.2    #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.15
    eta.VM ~ 0.15
    eta.KM ~ 0.15
    eta.KA ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    VM <- exp(lVM + eta.VM)
    KM <- exp(lKM + eta.KM)
    KA <- exp(lKA + eta.KA)
    # RxODE-style differential equations are supported
    d/dt(depot)    = -KA*depot;
    d/dt(centr)  =  KA*depot-(VM*centr/Vc)/(KM+centr/Vc);
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

two.compartment.IV.model <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lCl <- 1.6      #log Cl (L/hr)
    lVc <- 4.5      #log Vc (L)
    lQ  <- 1.6      #log Q (L/hr)
    lVp <- 4        #log Vp (L)

    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.15
    eta.Cl ~ 0.15
    eta.Vp ~ 0.15
    eta.Q  ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    Cl <- exp(lCl + eta.Cl)
    Vp <- exp(lVp + eta.Vp)
    Q <- exp(lQ + eta.Q)
    # RxODE-style differential equations are supported
    K10<- Cl/Vc
    K12<- Q/Vc
    K21<- Q/Vp
    d/dt(centr)  = K21*periph-K12*centr-K10*centr;
    d/dt(periph) =-K21*periph+K12*centr;
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

two.compartment.IV.model.solve <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lCl <- 1.6      #log Cl (L/hr)
    lVc <- 4.5      #log Vc (L)
    lQ  <- 1.6      #log Q (L/hr)
    lVp <- 4        #log Vp (L)

    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.15
    eta.Cl ~ 0.15
    eta.Vp ~ 0.15
    eta.Q  ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    Cl <- exp(lCl + eta.Cl)
    Vp <- exp(lVp + eta.Vp)
    Q <- exp(lQ + eta.Q)
    # And is assumed to follow proportional error estimated by prop.err
    cp <- linCmt()
    cp ~ prop(prop.err)
  })
}

two.compartment.IV.MM.model <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lVM <- 7.1    #log Vmax (mg/hr)
    lKM <- 5.7    #log KM (mg/L)
    lVc <- 4.3    #log Vc (L)
    lQ  <- 1.5    #log Q (L/hr)
    lVp <- 4      #log Vp (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.VM ~ 0.15
    eta.KM ~ 0.1
    eta.Vc ~ 0.15
    eta.Q  ~ 0.15
    eta.Vp ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    VM <- exp(lVM + eta.VM)
    KM <- exp(lKM + eta.KM)
    Vc <- exp(lVc + eta.Vc)
    Q  <- exp(lQ  + eta.Q)
    Vp <- exp(lVp + eta.Vp)
    # RxODE-style differential equations are supported
    K12<- Q/Vc
    K21<- Q/Vp
    d/dt(centr)  = K21*periph-K12*centr-(VM*centr/Vc)/(KM+centr/Vc);
    d/dt(periph) =-K21*periph+K12*centr;
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

two.compartment.IV.MM.model2 <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lVM <- 7      #log Vmax (mg/hr)
    lKM <- 5.7    #log KM (mg/L)
    lVc <- 4.5    #log Vc (L)
    lQ  <- 1.5    #log Q (L/hr)
    lVp <- 4      #log Vp (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.VM ~ 0.15
    eta.KM ~ 0.15
    eta.Vc ~ 0.15
    eta.Q  ~ 0.15
    eta.Vp ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    VM <- exp(lVM + eta.VM)
    KM <- exp(lKM + eta.KM)
    Vc <- exp(lVc + eta.Vc)
    Q  <- exp(lQ  + eta.Q)
    Vp <- exp(lVp + eta.Vp)
    # RxODE-style differential equations are supported
    K12<- Q/Vc
    K21<- Q/Vp
    d/dt(centr)  = K21*periph-K12*centr-(VM*centr/Vc)/(KM+centr/Vc);
    d/dt(periph) =-K21*periph+K12*centr;
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

two.compartment.IV.MM.model3 <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lVM <- 7      #log Vmax (mg/hr)
    lKM <- 5.7    #log KM (mg/L)
    lVc <- 4.5    #log Vc (L)
    lQ  <- 1.5    #log Q (L/hr)
    lVp <- 4      #log Vp (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.VM ~ 0.1
    eta.KM ~ 0.1
    eta.Vc ~ 0.1
    eta.Q  ~ 0.1
    eta.Vp ~ 0.1
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    VM <- exp(lVM + eta.VM)
    KM <- exp(lKM + eta.KM)
    Vc <- exp(lVc + eta.Vc)
    Q  <- exp(lQ  + eta.Q)
    Vp <- exp(lVp + eta.Vp)
    # RxODE-style differential equations are supported
    K12<- Q/Vc
    K21<- Q/Vp
    d/dt(centr)  = K21*periph-K12*centr-(VM*centr/Vc)/(KM+centr/Vc);
    d/dt(periph) =-K21*periph+K12*centr;
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

two.compartment.oral.model <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    lCl <- 1.6      #log Cl (L/hr)
    lVc <- 4.5      #log Vc (L)
    lQ  <- 1.6      #log Q (L/hr)
    lVp <- 4        #log Vp (L)
    lKA <- 0.2      #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.15
    eta.Cl ~ 0.15
    eta.Vp ~ 0.15
    eta.Q  ~ 0.15
    eta.KA ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    Cl <- exp(lCl + eta.Cl)
    Vp <- exp(lVp + eta.Vp)
    Q  <- exp(lQ + eta.Q)
    KA <- exp(lKA + eta.KA)
    # RxODE-style differential equations are supported
    K10<- Cl/Vc
    K12<- Q/Vc
    K21<- Q/Vp
    d/dt(depot)  = -KA*depot;
    d/dt(centr)  =  KA*depot+K21*periph-K12*centr-K10*centr;
    d/dt(periph) =        -K21*periph+K12*centr;
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

two.compartment.oral.model.solve <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    lCl <- 1.6      #log Cl (L/hr)
    lVc <- 4.5      #log Vc (L)
    lQ  <- 1.6      #log Q (L/hr)
    lVp <- 4        #log Vp (L)
    lKA <- 0.2      #log V (L)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.15
    eta.Cl ~ 0.15
    eta.Vp ~ 0.15
    eta.Q  ~ 0.15
    eta.KA ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    Cl <- exp(lCl + eta.Cl)
    Vp <- exp(lVp + eta.Vp)
    Q  <- exp(lQ + eta.Q)
    KA <- exp(lKA + eta.KA)
    # And is assumed to follow proportional error estimated by prop.err
    cp <- linCmt()
    cp ~ prop(prop.err)
  })
}

two.compartment.oral.MM.model <- function() {
  ini({ # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    lVM <- 7.1      #log Vmax (mg/hr)
    lKM <- 5.7      #log KM (mg/L)
    lVc <- 4.5      #log Vc (L)
    lQ  <- 1.6      #log Q (L/hr)
    lVp <- 4.1      #log Vp (L)
    lKA <- 0.22     #log V (L)

    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.3, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Vc ~ 0.15
    eta.Vp ~ 0.15
    eta.VM ~ 0.15
    eta.KM ~ 0.15
    eta.Q  ~ 0.15
    eta.KA ~ 0.15
  })
  model({ # Where the model is specified
    # The model uses the ini-defined variable names
    Vc <- exp(lVc + eta.Vc)
    Vp <- exp(lVp + eta.Vp)
    Q  <- exp(lQ + eta.Q)
    VM <- exp(lVM + eta.VM)
    KM <- exp(lKM + eta.KM)
    KA <- exp(lKA + eta.KA)
    # RxODE-style differential equations are supported
    K12<- Q/Vc
    K21<- Q/Vp
    d/dt(depot)    = -KA*depot;
    d/dt(centr)  =  KA*depot+K21*periph-K12*centr-(VM*centr/Vc)/(KM+centr/Vc);
    d/dt(periph) =        -K21*periph+K12*centr;
    ## Concentration is calculated
    cp = centr / Vc;
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

require(dplyr)

nmModels <- (ls(pattern="[.]compartment[.]"))

getModel <- function(cmt=1,oral=FALSE,mm=FALSE,extra="",solve=FALSE) {
  m <- nmModels %>%
    stringr::str_subset(ifelse(cmt==1,"one","two")) %>%
    stringr::str_subset(ifelse(oral,"oral","IV"))
  if (mm) {
    m <- m %>% stringr::str_subset("MM")
  } else {
    m <- m[!stringr::str_detect(m,"MM")];
  }
  if (extra=="") {
    m <- m[!stringr::str_detect(m,"[23]")];
  } else {
    m <- m %>% stringr::str_subset(extra);
  }
  if (solve) {
    m <- m[stringr::str_detect(m,"solve")];
  } else {
    m <- m[!stringr::str_detect(m,"solve")];
  }
  if (length(m)!=1) {
    return(NA_character_)
  } else {
    return(m)
  }
}

expandSolve <- function(x) {
  .x1 <- as.data.frame(x)
  .x2 <- .x1
  .x1$solve <- FALSE
  .x2$solve <- TRUE
  return(rbind(.x1,.x2));
}

#     model cmt oral, mm, infusion,subset
mod2 <- matrix(c(1, 1,FALSE, FALSE, FALSE, "SD",
                 2, 1,FALSE, FALSE, FALSE, "MD",
                 4, 1,FALSE, FALSE, FALSE, "full",
                 3, 1,FALSE, FALSE, FALSE, "SS",
                 12,1,FALSE, FALSE, TRUE, "SD",
                 13,1,FALSE, FALSE, TRUE, "MD",
                 15,1,FALSE, FALSE, TRUE, "full",
                 14,1,FALSE, FALSE, TRUE, "SS",
                 #     model cmt oral, mm, infusion,subset
                 9, 1,FALSE, TRUE, FALSE, "SD",
                 10,1,FALSE, TRUE, FALSE, "MD",#2
                 11,1,FALSE, TRUE, FALSE, "full", #2
                 20,1,FALSE, TRUE, TRUE, "SD",
                 21,1,FALSE, TRUE, TRUE, "MD",
                 22,1,FALSE, TRUE, TRUE, "full",
                 #     model cmt oral, mm, infusion,subset
                 23,1,TRUE, FALSE, FALSE, "SD",
                 24,1,TRUE, FALSE, FALSE, "MD",
                 26,1,TRUE, FALSE, FALSE, "full",
                 25,1,TRUE, FALSE, FALSE, "SS",
                 #     model cmt oral, mm, infusion,subset
                 29,1,TRUE, TRUE, FALSE, "SD",
                 30,1,TRUE, TRUE, FALSE, "MD",
                 31,1,TRUE, TRUE, FALSE, "full",
                 #     model cmt oral, mm, infusion,subset
                 32,2,FALSE, FALSE, FALSE, "SD",
                 33,2,FALSE, FALSE, FALSE, "MD",
                 35,2,FALSE, FALSE, FALSE, "full",
                 34,2,FALSE, FALSE, FALSE, "SS",
                 #     model cmt oral, mm, infusion,subset
                 46,2,FALSE, FALSE, TRUE, "SD",
                 47,2,FALSE, FALSE, TRUE, "MD",
                 49,2,FALSE, FALSE, TRUE, "full",
                 48,2,FALSE, FALSE, TRUE, "SS",
                 #     model cmt oral, mm, infusion,subset
                 40,2,FALSE, TRUE, FALSE, "SD",
                 41,2,FALSE, TRUE, FALSE, "MD",
                 42,2,FALSE, TRUE, FALSE, "full",
                 #     model cmt oral, mm, infusion,subset
                 54,2,FALSE, TRUE, TRUE, "SD",
                 55,2,FALSE, TRUE, TRUE, "MD", #3
                 56,2,FALSE, TRUE, TRUE, "full", #2
                 #     model cmt oral, mm, infusion,subset
                 60,2,TRUE, FALSE, FALSE, "SD",
                 61,2,TRUE, FALSE, FALSE, "MD",
                 63,2,TRUE, FALSE, FALSE, "full",
                 62,2,TRUE, FALSE, FALSE, "SS",
                 #     model cmt oral, mm, infusion,subset
                 68,2,TRUE, TRUE, FALSE, "SD",
                 69,2,TRUE, TRUE, FALSE, "MD",
                 70,2,TRUE, TRUE, FALSE, "full"
                 ),ncol=6,byrow=TRUE,
               dimnames=list(NULL,c("model", "cmt", "oral", "mm", "infusion", "subset"))) %>%
  expandSolve()%>%
  mutate(id=as.numeric(paste(model))) %>%
  mutate(model=sprintf("U%03d",id)) %>%
  mutate(oral=as.logical(paste(oral)),mm=as.logical(paste(mm)),
         infusion=as.logical(paste(infusion)),solve=as.logical(paste(solve))) %>%
  mutate(extra=ifelse(id %in% c(10,11,56, 24, 25, 26, 41, 42, 54),"2",
                      ifelse(id==55,"3",""))) %>%
  group_by(id,solve) %>%
  mutate(fn=getModel(cmt=cmt,oral=oral,mm=mm,extra=extra,solve=solve)) %>%
  ungroup() %>% filter(!is.na(fn)) %>% mutate(model=paste0(model,ifelse(solve,"_solve",""))) %>%
  mutate(data=paste0(ifelse(oral,"Oral",ifelse(infusion, "Infusion","Bolus")),"_",
                     cmt,"CPT",ifelse(mm,"MM","")))

if (exists("runModel", globalenv())) {
  mod2 <- mod2 %>% filter(model==runModel)
}

opts <- c("focei", "saem", "nlme", "fo", "foi", "foce", "foceiLL")
## opts <- c("foceiLL", "focei", "foce", "nlme", "saem")
if (exists("runEst", globalenv())) {
  opts <- runEst
}
env <- environment()

ns <- loadNamespace("nlmixr2data")

os <- .Platform$OS.type ## On mac this is "unix"
if (Sys.info()["sysname"]=="Darwin") os <- "mac"

for (opt in opts){
  for (i in seq_along(mod2$model)){
    with(mod2[i,],{
      if ((solve & opt %in% c("nlme","saem", "focei", "foceiLL", "nonmem743", "nonmem73")) | !solve) {
        .msg <- sprintf("%s: %s %s-compartment %s, %s%s",model,
                        opt,
                        ifelse(cmt==1,"one","two"),
                        ifelse(infusion,"infusion",ifelse(oral,"oral","bolus")),
                        ifelse(subset=="SD","single dose",
                               ifelse(subset=="MD","multiple dose",
                                      ifelse(subset=="SS","steady state", "full data"))),
                        ifelse(mm,", Michelis-Menton elimination",""),
                        ifelse(solve," (solved)",""))
        message(.msg)
        context(.msg)
        runno <- paste0(model,"_",opt)
        assign("runno",runno,globalenv())
        if (solve && exists("linCmtSensType",envir=globalenv())) {
          rds <- paste0(runno,"-", os, "-",  get("linCmtSensType",envir=globalenv()),
                        ".rds")
        } else {
          rds <- paste0(runno,"-", os, ".rds")
        }
        .rfile <- genIfNeeded(FALSE)
        .success <- TRUE
        if (file.exists(rds)) {
          fit <- get("fit",envir=env)
          fit <- list()
          fit[[runno]] <- readRDS(rds)
          assign("fit",fit, envir=env)
        } else if (file.exists(.rfile)) {
          source(.rfile)
        } else {
          nlmixrFn <- get(fn,envir=env)
          .opt <- opt
          if (opt == "foceiLL") {
            nlmixrFn <- nlmixrFn %>% model(cp ~ prop(prop.err) + dnorm())
            .opt <- "focei"
          }
          if (opt == "nonmem743"){
            .opt <- "nonmem"
            options("babelmixr2.nonmem"="nmfe743-ifort")
          } else if (opt == "nonmem73") {
            .opt <- "nonmem"
            options("babelmixr2.nonmem"="nmfe73-ifort")
          }
          print(nlmixrFn)
          if (exists(data,env$ns)) {
            datr <- get(data,env$ns)
          } else {
            datr <- read.csv(paste0(data,".csv"),header=TRUE,stringsAsFactors=FALSE)
          }
          if (subset=="SD") {
            dat <- datr[datr$SD == 1, ]
            dat <- dat[, names(dat) != "SS"];
          } else if (subset=="MD") {
            dat <- datr[datr$SD == 0, ]
            dat <- dat[, names(dat) != "SS"];
          } else if (subset=="full") {
            dat <- datr
            dat <- dat[, names(dat) != "SS"]
          } else {
            dat <- datr[datr$SS != 99, ]
          }
          print(head(dat))
          fit <- get("fit",envir=env)
          if (Sys.getenv("RUN")!="false") {
            .fit <- try(nlmixr(nlmixrFn, dat, .opt, control=defaultControl(.opt), table=tableControl(cwres=TRUE)))
          } else {
            .fit <- try({stop("dumb")},silent=TRUE)
          }
          if (!inherits(.fit, "try-error")) {
            fit <- list()
            fit[[runno]] <- .fit
            saveRDS(fit[[runno]],rds)
            assign("fit",fit, envir=env)
          } else {
            .success <- FALSE
          }
        }
        if (.success) {
          source(genIfNeeded())
        }
      }})
  }
  ## context(sprintf("%s-UI-003ode: one-compartment bolus, steady-state", opt))
  ## runno <- paste0(opt, "U003ode")
  ## fit[[runno]] <-
  ## source(genIfNeeded())
}

## U014
