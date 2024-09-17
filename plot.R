library(nlmixr2)
library(dplyr)
library(xgxr)

## Function converting arguments to characters
Cs <- function(...){
  sapply(as.list(match.call())[-1], as.character)
}

expected_values <- list();
runno <- "run"

readData <- function(nlmixrVersion=c("2.1.4"),
                     rxode2Version=as.character(packageVersion("rxode2")),
                     est=c("saem", "focei", "nlme"),
                     platform="unix",
                     runs=sort(Cs(U001,U002,U003,U004,U009,U010,U011,U012,U013,U014,
                                  U015,U020,U021,U022,U023,U024,U026,U025, U029, U030,U031,
                                  U032,U033,U035,U034,U040,U041,U042,U046,U047,U049,U048,
                                  U054,U055,U056,U060,U061,U062,U063,U068, U069,U070))) {
  .ret <- expand.grid(ver=nlmixrVersion, est=est, os=platform, run=runs, stringsAsFactors=FALSE) %>%
    mutate(src=paste0("values-", ver, "-", run,"_", est, "-", os, ".R"))

  .ret <- lapply(seq_along(.ret$ver), function(x) {
    .c <- setNames(as.character(.ret[x, ]), names(.ret))
    .f <- file.path("cpt", .c["src"])
    if (file.exists(.f)) {
      source(.f)
      .ret <- expected_values[["run"]]
      .ret1 <- setNames(.ret$parFixedDf$`Back-transformed`,
                        sapply(rownames(.ret$parFixedDf),
                               function(x) {
                                 if (x == "prop.err") {
                                   x
                                 } else {
                                   substr(x, 2, nchar(x))
                                 }
                               }))
      .ret2 <- setNames(.ret$parFixedDf$`SE`,
                        sapply(rownames(.ret$parFixedDf),
                               function(x) {
                                 if (x == "prop.err") {
                                   x
                                 } else {
                                   paste0("SE.", substr(x, 2, nchar(x)))
                                 }
                               }))
      .ret3 <- setNames(.ret$parFixedDf$`BSV(CV%)`,
                        sapply(rownames(.ret$parFixedDf),
                               function(x) {
                                 if (x == "prop.err") {
                                   x
                                 } else {
                                   paste0("BSV.", substr(x, 2, nchar(x)))
                                 }
                               }))
      .ret2 <- .ret2[names(.ret2) != "prop.err"]
      .ret3 <- .ret3[names(.ret3) != "prop.err"]
      .tmp <- c("VM", "KM", "Q", "Vp", "KA", "Cl")
      .tmp2 <- paste0("BSV.", .tmp)
      .tmp3 <- paste0("SE.", .tmp)
      .tmp <- c(.tmp, .tmp2, .tmp3)
      .covMethod <- .ret$covMethod
      .ret <- data.frame(t(c(.ret1, .ret2, .ret3)), time=sum(.ret$time), objf=.ret$objDf[, "OBJF"])
      for(.f in .tmp){
        if (is.null(.ret[[.f]])) {
          .ret[[.f]] <- NA
        }
      }
      .ret <- cbind(.ret, data.frame(t(.c)))
      .ret$covMethod <-.covMethod

      return(.ret)
    } else {
      .out <- c("Cl", "Vc", "prop.err", "SE.Cl", "SE.Vc", "BSV.Cl", "BSV.Vc",  "VM", "KM", "Q", "Vp",
                "KA", "BSV.VM", "BSV.KM", "BSV.Q", "BSV.Vp",  "BSV.KA", "SE.VM", "SE.KM", "SE.Q",
                "SE.Vp", "SE.KA", "time","objf", "covMethod")
      .ret <- cbind(data.frame(t(setNames(rep(NA, length(.out)), .out))),
                    data.frame(t(.c)))
      return(.ret)
    }
  })
  .w <- which(sapply(seq_along(.ret), function(x) {
    !is.null(.ret[[x]])
  }))
  .ret <- .ret[.w]
  return(do.call("rbind", .ret))
}

ret <- readData(nlmixrVersion=c("2.1.4"), est=c("foceiLL", "focei"),
                platform="unix")
ret2 <- readData(nlmixrVersion="2.1.6", est="nonmem743", platform="unix")
ret <- rbind(ret, ret2)


library(ggplot2)
library(gridExtra)

xgx_theme_set()

f <- function(nlmixrVersion=c("2.1.4"), est=c("saem", "foceiLL", "focei", "nlme"),
              platform="unix") {

  ret <- readData(nlmixrVersion=nlmixrVersion, est=est,
                  platform=platform) %>%
    mutate(by=paste0(est, "(", ver, " ", os, ")"),
           run = factor(run)) %>%
    mutate(run2=as.numeric(run))

  print(summary(ret))

  .lvl <- levels(ret$run)
  .brk <- seq_along(.lvl);

  .f <- function(var="Vc", tval=70, ylab="Vc (L)", bsvLab="BSV Vc(%)", bsvVal=30) {
    p1 <- ggplot(ret, aes_string("run2", var, color="by")) +
      geom_point(size=3, alpha=0.5) +
      geom_line(alpha=0.5, size=1.3) +
      geom_hline(yintercept=tval, size=1.3) +
      theme(axis.text.x = element_text(face="bold", angle=45, hjust=1),
            axis.title.y=element_text(face="bold", size=14),
            axis.title.x=element_blank(),
            legend.position="top") +
      labs(color="") +
      scale_x_continuous(breaks=.brk,labels=.lvl, minor_breaks=NULL) +
      ylab(ylab)

    p2 <- ggplot(ret, aes_string("run2", paste0("BSV.", var), color="by")) +
      geom_point(size=3, alpha=0.5) +
      geom_line(alpha=0.5, size=1.3) +
      geom_hline(yintercept=bsvVal, size=1.3) +
      theme(axis.text.x = element_text(face="bold", angle=45, hjust=1),
            axis.title.y=element_text(face="bold", size=14),
            axis.title.x=element_blank(),
            legend.position="none") +
      scale_x_continuous(breaks=.brk,labels=.lvl, minor_breaks=NULL) +
      ylab(bsvLab)

    df2 <- ret %>% mutate(SE.VM = ifelse(covMethod=="r,s", SE.VM, NA),
                          SE.KM = ifelse(covMethod=="r,s", SE.KM, NA),
                          SE.Q  = ifelse(covMethod=="r,s", SE.Q, NA),
                          SE.Vp = ifelse(covMethod=="r,s", SE.Vp, NA),
                          SE.KA = ifelse(covMethod=="r,s", SE.KA, NA),
                          SE.Cl = ifelse(covMethod=="r,s", SE.Cl, NA),
                          SE.Vc = ifelse(covMethod=="r,s", SE.Vc, NA))

    p3a <- ggplot(df2, aes_string("run2", paste0("SE.", var), color="by", group="by")) +
      geom_point(size=3, alpha=0.5) +
      geom_line(alpha=0.5, size=1.3) +
      theme(axis.text.x = element_text(face="bold", angle=45, hjust=1),
            axis.title.y=element_text(face="bold", size=14),
            axis.title.x=element_blank(),
            legend.position="none") +
      scale_x_continuous(breaks=.brk, labels=.lvl, minor_breaks=NULL) +
      ylab(paste0("SE log ", ylab, " (r,s)"))

    p3 <- ggplot(df2, aes_string("run2", paste0("SE.", var), color="by", group="by")) +
      geom_point(size=3, alpha=0.5) +
      geom_line(alpha=0.5, size=1.3) +
      theme(axis.text.x = element_text(face="bold", angle=45, hjust=1),
            axis.title.y=element_text(face="bold", size=14),
            axis.title.x=element_blank(),
            legend.position="none") +
      scale_x_continuous(breaks=.brk, labels=.lvl, minor_breaks=NULL) +
      ylab(paste0("SE log ", ylab))

    grid.arrange(p1, p2, ncol=1)
    grid.arrange(p3a, p3, ncol=1)
  }
  suppressWarnings(.f())
  suppressWarnings(.f(var="Cl", tval=4, ylab="Cl (L/hr)", bsvLab="BSV Cl(%)"))
  suppressWarnings(.f(var="KA", tval=1, ylab="Ka (1/hr)", bsvLab="BSV Ka(%)"))
  suppressWarnings(.f(var="Vp", tval=40, ylab="Vp (L)", bsvLab="BSV Vp(%)"))
  suppressWarnings(.f(var="Q", tval=4.0, ylab="Vp (L/hr)", bsvLab="BSV Vp(%)"))
  suppressWarnings(.f(var="KM", tval=250, ylab="Km (mg/L)", bsvLab="BSV Km(%)"))
  suppressWarnings(.f(var="VM", tval=1000, ylab="Vmax (mg/hr)", bsvLab="BSV Vmax(%)"))

  p1 <- ggplot(ret, aes_string("run2", "time", color="by")) +
    geom_point(size=3, alpha=0.5) +
    geom_line(alpha=0.5, size=1.3) +
    theme(axis.text.x = element_text(face="bold", angle=45, hjust=1),
          axis.title.y=element_text(face="bold", size=14),
          axis.title.x=element_blank(),
          legend.position="top") +
    labs(color="") +
    scale_x_continuous(breaks=.brk,labels=.lvl, minor_breaks=NULL) +
    ylab("Time") + xgxr::xgx_scale_y_log10()
  plot(p1)

}

nlmixrVersion <-  as.character(packageVersion("nlmixr2est"))

pdf("compare.pdf")

f(nlmixrVersion, c("focei", "saem"), "unix")

f(nlmixrVersion, c("solve_saem", "saem"), "unix")

f(nlmixrVersion, c("solve_focei", "focei"), "unix")

f(nlmixrVersion, c("solve_nlme", "nlme"), "unix")

f(nlmixrVersion, c("foceiLL", "focei"), "unix")

f(nlmixrVersion, c("saem", "focei"), "unix")

dev.off()
