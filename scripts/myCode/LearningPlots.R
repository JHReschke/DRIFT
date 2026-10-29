
library(data.table)
library(tidyverse)
library(dplyr)
library(tidyr)
library(magrittr)
library(RColorBrewer)
library(knitr)
library(ggdendro)
library(phyloseq)
library(devtools)
library(plyr)
library(ggpubr)
library(DT)
library(cowplot)
library(ggtext)


load(file='C:/Users/jhres/Documents/DRIFT2/Week2/PhyloseqObj_Updated_N150_092026.RData')
meta <- sample_data(drift.phy.clr)
# Order the metadata
meta$Timepoint.x = factor(meta$Timepoint.x, lev=c('BL', '3m', '6m', '12m'))
# Conver it to a df
meta_df <- data.frame(meta)

# Create df for each timepoint
bl_filtered <- filter(meta_df, grepl("\\.BL$", SampleID))
threem_filtered <- filter(meta_df, grepl("\\.(3m)$", SampleID))
sixm_filtered <- filter(meta_df, grepl("\\.(6m)$", SampleID))
twelvem_filtered <- filter(meta_df, grepl("\\.(12m)$", SampleID))

threem_to_twelvem_filtered <- filter(meta_df, grepl("\\.(3m|6m|12m)$", SampleID))



experiment_plot

# Number of participants per time point
ggplot(meta_df, aes(x = Timepoint.x)) +
  geom_bar() +
  labs(
    title = "Number of Participants Per Time Point",
    x = "Time Point",
    y = "Number of participants"
  )


# Violin plot for weight 
adherence_violin_plot <- ggplot(
  data = meta_df,
  mapping = aes(x=Timepoint.x, y=adherence)) +
  geom_violin() +
  labs(
    title = "Distribution of Adherence Scores (violin)",
    x = "Time Point",
    y = "Adherence Score"
  )

# Create a new df holding the variables necessary for calculating weight loss
weight_change_df <- meta_df %>%
  mutate(
    participant_id = sub("\\.(BL|3m|6m|12m)$", "", SampleID),
    timepoint = sub(".*\\.", "", SampleID)
  ) %>%
  select(
    SampleID,
    participant_id,
    Timepoint.x,
    timepoint,
    outcome_wt_fnl,
    pchange_kcal,
    adherence,
    Intervention.x
  ) %>%
  dplyr::arrange(participant_id, Timepoint.x) %>%
  group_by(participant_id) %>%
  mutate(
    interval_weight_change = outcome_wt_fnl - lag(outcome_wt_fnl)
  ) %>%
  ungroup() %>%
  mutate(
    interval_weight_change = round(interval_weight_change, 1)
  )

# Do the calculations and create a column holding the outcome_wt_fnl (weight loss between data points)
weight_change_df <- weight_change_df %>%
  group_by(participant_id) %>%
  dplyr::arrange(Timepoint.x, .by_group = TRUE) %>%
  mutate(
    interval_weight_change = round(outcome_wt_fnl - lag(outcome_wt_fnl), 5)
  ) %>%
  ungroup()


weight_change_df


weight_change_scatter <- ggplot(
  weight_change_df,
  aes(x = outcome_wt_fnl,
  y = interval_weight_change,
  color = Intervention.x)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~ Timepoint.x)

weight_change_scatter  


adherence_violin_plot

# Violin plot for weight
weight_violin_plot <- ggplot(
  data = meta_df,
  mapping = aes(x=Timepoint.x, y=outcome_wt_fnl)) +
  geom_violin() +
  labs(
    title = "Distribution of Adherence Scores (violin)",
    x = "Time Point",
    y = "Adherence Score"
  )

weight_violin_plot

# Histogram for adherence score
adherence_histogram <- ggplot(
  data = meta_df,
  mapping = aes(x = adherence)) +
  geom_histogram(bins = 20) +
  labs(
    title = "Distribution of Adherence Scores Over 12 Months (histogram)",
    x = "Adherence Score",
    y = "Count"
  )

adherence_histogram


adherence_box_plot <- ggplot(
  data = meta_df,
  mapping = aes(x = Timepoint.x, y = adherence)) +
  geom_boxplot() +
  labs(
    title = "Distribution of Adherence Scores (boxplot)",
    y = "Adherence Score",
    
  )

adherence_box_plot

test_scatter_plot <- ggplot(meta_df,
       aes(x = change_kcal,
           y = pchange_kcal,
           color = Intervention.x)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~ Timepoint.x)

test_scatter_plot  

# Looking at calorie intake over the study by intervention group
pkcal_change_plot <- ggplot(
  threem_to_twelvem_filtered,
  aes(x = Timepoint.x,
      y = pchange_kcal,
      color = Intervention.x)) +
  geom_point(position = position_jitter(width = 0.15)) +
  geom_boxplot(alpha = 0.2, outlier.shape = NA) +
  labs(
    title = "Percent Change in Calorie Intake Over Time",
    x = "Time Point",
    y = "Percent Change in Calorie Intake",
    color = "Intervention"
  ) +


pkcal_change_plot


participant<- meta_df[1, ]

experiment_plot <- ggplot(
  data = threem_to_twelvem_filtered, 
  aes(x=Timepoint.x, y=pchange_kcal, group=subject_id.x)) + 
  geom_line(alpha=.56,col="grey70") + 
  stat_smooth(aes(group=1)) + 
  stat_summary(aes(group = 1),
               geom="point", 
               fun.y = mean, 
               shape=19, 
               size = 3)
experiment_plot 


