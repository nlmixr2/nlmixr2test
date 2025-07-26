
library(magrittr)

lapply(list.files(pattern="[.]ctl"),
       function(f) {
         cmd <- sprintf("nmfe743-ifort %s %s", f, sub("[.]ctl", ".lst",f))
         message(cmd)
         system(cmd)
       }) %>% invisible()
