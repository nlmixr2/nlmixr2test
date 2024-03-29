expected_values[[runno]] <- list(lik = c(-41176.68, 82379.37, 82468.39), param = c(6.9093, 
5.5729, 4.2341, 1.4364, 3.9217, -0.028972, 0.20087), stdev_param = c(0.3356, 
0.25194, 0.26344, 0.28964, 0.34419, 0.28964, NA), parFixedDf = structure(list(
    Parameter = c("log Vmax (mg/hr)", "log KM (mg/L)", "log Vc (L)", 
    "log Q (L/hr)", "log Vp (L)", "log V (L)", ""), Estimate = c(lVM = 6.90930019886615, 
    lKM = 5.57291806277684, lVc = 4.23408251983234, lQ = 1.43638699870113, 
    lVp = 3.92173645444262, lKA = -0.0289722433278063, prop.err = 0.20087246654562
    ), SE = c(lVM = 0.0317053732609219, lKM = 0.0438969549159919, 
    lVc = 0.0348275973472671, lQ = 0.0682913031696163, lVp = 0.0362131766256988, 
    lKA = 0.03664321019674, prop.err = NA), "%RSE" = c(0.458879659999792, 
    0.787683479669163, 0.822553580005479, 4.75438048599504, 0.923396486387447, 
    126.476951688347, NA), "Back-transformed" = c(1001.54611388754, 
    263.201016829283, 68.9983450710672, 4.20547395239446, 50.4880388838877, 
    0.971443428129182, 0.20087246654562), "CI Lower" = c(941.202966954275, 
    241.502931590614, 64.445614583117, 3.67862302449131, 47.0287883597791, 
    0.904121418063969, NA), "CI Upper" = c(1065.75802824894, 
    286.848589388556, 73.8727010882327, 4.80778026085289, 54.2017381107143, 
    1.04377831915116, NA), "BSV(CV%)" = c(26.8073203320003, 29.5825415357703, 
    34.527677338436, 35.4636763849682, 25.5995965117409, 29.5816834320914, 
    NA), "Shrink(SD)%" = c(12.1645562691224, 28.7598129102704, 
    4.1132117102502, 48.017757890366, 29.6611947462426, 17.319275169673, 
    NA)), class = "data.frame", row.names = c("lVM", "lKM", "lVc", 
"lQ", "lVp", "lKA", "prop.err")), omega = structure(c(0.112628485080025, 
0, 0, 0, 0, 0, 0, 0.0634760201548792, 0, 0, 0, 0, 0, 0, 0.0693984820648893, 
0, 0, 0, 0, 0, 0, 0.0838931403463827, 0, 0, 0, 0, 0, 0, 0.118464789230728, 
0, 0, 0, 0, 0, 0, 0.0838884719725134), dim = c(6L, 6L), dimnames = list(
    c("eta.Vc", "eta.Vp", "eta.VM", "eta.KM", "eta.Q", "eta.KA"
    ), c("eta.Vc", "eta.Vp", "eta.VM", "eta.KM", "eta.Q", "eta.KA"
    ))), time = structure(list(setup = 0.046721, optimize = 3e-06, 
    covariance = 0.127004000000407, saem = 159.045999999995, 
    table = 3.23700000000099, compress = 0.0760000000009313), class = "data.frame", row.names = "elapsed"), 
    objDf = structure(list(OBJF = 69561.7440764804, AIC = 82379.3684586895, 
        BIC = 82468.3916104828, "Log-likelihood" = -41176.6842293447, 
        "Condition#(Cov)" = 8.36021091805195, "Condition#(Cor)" = 3.74708422502158), class = "data.frame", row.names = "FOCEi"), 
    covMethod = "linFim") 
