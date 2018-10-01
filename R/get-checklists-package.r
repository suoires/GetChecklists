#' Retrieve checklists function
#'
#' This function allows you to retrieve checklists for any given date range
#' @param start_date No default. Format: "yyyy-mm-dd"
#' @param end_date No default. Format: "yyyy-mm-dd"
#' @keywords FPT

get_checklists = function(start_date, end_date) {
  library(readr)
  setwd("/data/BIGDATA/general/isc_out/checklist_daily/")
  date_range = seq(as.Date(start_date), as.Date(end_date), "days")
  date_file_name = paste("checklist_baotri_", date_range, sep="")
  date_file_name_collapsed = paste(date_file_name, collapse = "|")
  all_checklists = list.files(path = "/data/BIGDATA/general/isc_out/checklist_daily/", pattern = date_file_name_collapsed) %>%
    map_df(read_tsv, col_names = c( "Khuvuc", "Region", "Location", "Thang", "Chinhanh", "Contract",
                                    "IDcuachecklist", "Doitac", "Tobaotri",
                                    "Tinhtrangsucobandau", "Vitrixayrasuco",
                                    "Lydo", "Nguyennhan", "Ngaytaochecklist",
                                    "NgayhoantatCL", "Ketquaxuly", "Ghichu"))
  return(all_checklists)
}