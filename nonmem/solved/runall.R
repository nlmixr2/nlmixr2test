for (f in list.files(pattern="ctl")) {
  lst <- gsub("ctl", "lst", f)
  if (file.exists(lst)) next
  cmd <- paste0("nmfe743-ifort ", f, " ", lst)
  message(cmd)
  system(cmd)
}