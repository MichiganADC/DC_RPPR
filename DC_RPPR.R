# DC_RPPR.R

# LOAD USEFUL LIBRARIES ----

suppressMessages( library(dplyr)     )
suppressMessages( library(readr)     )
suppressMessages( library(lubridate) )
suppressMessages( library(stringr)   )


# GET DATA ----

df_nc <- read_csv("./A7261512.csv",
                  col_types = cols(.default = col_character(),
                                   VISITMO  = col_integer(),
                                   VISITDAY = col_integer(),
                                   VISITYR  = col_integer()))

# CLEAN DATA ----

df_nc_cln <- df_nc %>% 
  select(PTID,
         VISITMO,
         VISITDAY,
         VISITYR) %>% 
  transmute(ptid = PTID,
            form_date = as_date(paste0(VISITYR, "-", VISITMO, "-", VISITDAY)))

# purrr::map_chr(df_nc_cln, class)


# PROCESS DATA ----

df_nc_cln %>% 
  distinct(ptid) %>% 
  pull() %>% 
  length()


