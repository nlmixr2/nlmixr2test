
library(nlmixr2)

one.compartment.oral.model <- function() {
  ini({
    # Where initial conditions/variables are specified
    # '<-' or '=' defines population parameters
    # Simple numeric expressions are supported
    lCl <- 1        #log Cl (L/hr)
    lVc <- 4        #log V (L)
    lKA <- 0.1      #log Ka (/hr)
    # Bounds may be specified by c(lower, est, upper), like NONMEM:
    # Residuals errors are assumed to be population parameters
    prop.err <- c(0, 0.2, 1)
    # Between subject variability estimates are specified by '~'
    # Semicolons are optional
    eta.Cl ~ 0.2
    eta.Vc ~ 0.2
    eta.KA ~ 0.2
  })
  model({
    # Where the model is specified
    # The model uses the ini-defined variable names
    Cl <- exp(lCl + eta.Cl)
    Vc <- exp(lVc + eta.Vc)
    KA <- exp(lKA + eta.KA)
    # RxODE-style differential equations are supported
    d / dt(depot)  = -KA * depot
    d / dt(centr)  =  KA * depot - (Cl / Vc) * centr
    ## Concentration is calculated
    cp = centr / Vc
    # And is assumed to follow proportional error estimated by prop.err
    cp ~ prop(prop.err)
  })
}

modX<-nlmixr(one.compartment.oral.model)


do_nlmixrODE <- function(i, method="focei") {
  .nlmixr <- as.character(packageVersion("nlmixr2est"))
  .os <- .Platform$OS.type;
  .nlmixr <- packageVersion("nlmixr2est")
  if (Sys.info()["sysname"]=="Darwin") .os <- "mac"
  file <- paste("sparse-", .nlmixr, "-", method, "-", i, "-", .os, ".R", sep = "");
  if (!file.exists(file)){
    datr <- as.data.frame(data.table::fread(paste0("sparse/bs_pr1_", i, ".dta")));
    fit <-
      nlmixr(
        modX,
        datr,
        est = method)
    ret <- list(
      lik=round(c(logLik(fit), AIC(fit), BIC(fit)), 2),
      param=unname(signif(fixef(fit), 5)),
      stdev_param=unname(signif(as.numeric(VarCorr(fit)[1:length(fixef(fit)), "StdDev"]), 5)),
      sigma=signif(fit$sigma, 5),
      parFixedDf=fit$parFixedDf,
      omega=fit$omega,
      time=fit$time,
      objDf=fit$objDf)
    sink(file)
    on.exit(sink());
    cat("expected_values[[runno]] <- ")
    cat(paste(deparse(ret), collapse="\n"), "\n");
    return(invisible(ret))
  }
}

library(doParallel)
cl <- makeCluster(7, outfile="")
registerDoParallel(cl)

nlmixr <-
  foreach(i = 1:500, .packages = c('nlmixr2')) %dopar%
  do_nlmixrODE(i, method="focei")

nlmixrLL <-
  foreach(i = 1:500, .packages = c('nlmixr2')) %dopar%
  do_nlmixrODE(i, method="foceiLL")


nlmixrS <-
  foreach(i = 1:500, .packages = c('nlmixr2')) %dopar%
  do_nlmixrODE(i, method="saem")

nlmixrN <-
  foreach(i = 1:500, .packages = c('nlmixr2')) %dopar%
  do_nlmixrODE(i, method="nlme")
