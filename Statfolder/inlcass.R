library(tidyverse)
library(palmerpenguins)
library(knitr)
library(dplyr)
library(kableExtra)

View(penguins)

adelie_p <- penguins %>%
  filter(species == "Adelie") %>%
  drop_na()  

penguinModel <- lm(
  formula = body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm + sex + island,
  data = adelie_p
)
penguin_mod_out <- summary(penguinModel)

penguin_mod_out$coefficients %>%
  kable(caption = "Summary of Linear Reggression model of Adelie Penguins",booktabs = TRUE,
        align = c("l", rep("c", 6))) %>%
  kableExtra::kable_classic()

View(adelie_p)
View(penguin_mod_out)
