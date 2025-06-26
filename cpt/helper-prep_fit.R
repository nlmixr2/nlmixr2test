# This header variable assignment simplifies testing and comparison across
# platforms
if (!exists("fit")) {
  fit <- list()
}
if (!exists("expected_values")) {
    expected_values <- list()
}
if (!exists("verbose_minimization")) verbose_minimization <- FALSE
default_control <-
  nlme::nlmeControl(
    returnObject=TRUE,
    msMaxiter = 100,
    maxIter = 100,
    pnlsMaxIter = 100,
    msVerbose = verbose_minimization
    )


defaultControl <- function(x) {
  if (x == "nlme") {
    return(nlme::nlmeControl(
      returnObject=TRUE,
      msMaxIter = 100,
      maxIter = 100,
      pnlsMaxIter = 100,
      msVerbose = verbose_minimization))
  } else if (x == "saem") {
    return(saemControl())
  } else if (x == "nonmem") {
    return(nonmemControl(readRounding=TRUE))
  } else if (x == "monolix") {
    return(monolixControl())
  } else {
    if (exists("linCmtScale", globalenv())) {
      .scale <- get("linCmtScale", globalenv())
      .sensType <- get("linCmtSensType", globalenv())
      .hcmt <- get("linCmtHcmt", globalenv())
      .hmeanI <- get("linCmtHmeanI", globalenv())
      .hmeanO <- get("linCmtHmeanO", globalenv())
      .forwardMax <- get("linCmtForwardMax", globalenv())
      return(foceiControl(rxControl=rxControl(linCmtScale=.scale,
                                              linCmtSensType=.sensType,
                                              linCmtHcmt=.hcmt,
                                              linCmtHmeanI=.hmeanI,
                                              linCmtHmeanO=.hmeanO,
                                              linCmtForwardMax=.forwardMax)))
    }
    return(foceiControl())
  }
}

defaultTable <- tableControl(cwres=TRUE); ## CWRES needed for FOCEi likelihood

generate_expected_values <- function(x=FALSE) {
  .os <- .Platform$OS.type;
  .nlmixr <- packageVersion("nlmixr2est")
  .rxode2 <- packageVersion("rxode2")
  if (Sys.info()["sysname"]=="Darwin") .os <- "mac"
  ret <-
    list(
      lik=round(c(logLik(fit[[runno]]), AIC(fit[[runno]]), BIC(fit[[runno]])), 2),
      param=unname(signif(fixef(fit[[runno]]), 5)),
      stdev_param=unname(signif(as.numeric(VarCorr(fit[[runno]])[1:length(fixef(fit[[runno]])), "StdDev"]), 5)),
      parFixedDf=fit[[runno]]$parFixedDf,
      omega=fit[[runno]]$omega,
      time=fit[[runno]]$time,
      objDf=fit[[runno]]$objDf,
      covMethod=fit[[runno]]$covMethod)
  if (x) {
    sink(paste0("values-", .nlmixr, "-", runno, "-", .os, ".R"))
      on.exit(sink())
  }
  cat("expected_values[[runno]] <- ")
  cat(paste(deparse(ret), collapse="\n"), "\n");
  invisible(ret)
}


genIfNeeded <- function(gen=TRUE) {
  .os <- .Platform$OS.type
  .nlmixr <- packageVersion("nlmixr2est")
  if (Sys.info()["sysname"]=="Darwin") .os <- "mac"
  .ret <- paste0("values-", .nlmixr, "-", runno, "-", .os, ".R")
  if (gen && !file.exists(.ret)) {
    generate_expected_values(TRUE)
  }
  return(.ret)
}
