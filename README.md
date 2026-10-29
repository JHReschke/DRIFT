# DRIFT GREU Analysis Documentation

## Introduction: About My Rotation

This document is intended to provide my experience and any advice I have based on my 10-week rotation in the Stanislawski lab. During my rotation, I used R to explore relationships between the gut microbiome, clinical outcomes, and lifestyle factors in the DRIFT study. My work involved preparing and joining datasets, running statistical models, and creating plots to examine the results.

## Purpose of This Repository

This repository is a resource for future rotation students. It documents the analyses I worked on and provides code examples that may be useful as you become familiar with R, the DRIFT data, and the lab’s research.

It is not meant to be a tutorial, assignment, or a teaching aid. Your own work should follow Maggie’s or her team’s guidance first. The code and documentation here should be used as a supplement that you can explore and adapt to your own work.

## Project Background

DRIFT is a weight-loss study comparing intermittent fasting and daily caloric restriction groups over twelve months.

During my rotation, I explored whether gut microbiome diversity and changes in microbial composition were associated with changes in clinical outcomes, mainly weight and waist circumference. I also explored associations between microbiome taxa and physical activity, caloric intake, and dietary adherence.

The microbiome and participant data were collected at baseline, three months, six months, and twelve months.

## Code Organization

The code is separated into two categories:

- **Provided Code:** Scripts shared with me by the lab. These were intended to be code examples for learning the methods and tools of microbiome analysis.

  `DRIFT/scripts/providedCode/`

- **My Code:** Scripts I developed during the rotation based on code examples and my own learning. I had never learned R before this rotation, so my code should not be assumed to be good or correct. I also went back into most of my code during the last 2 weeks of the rotation, added plot-exporting code, and broke some scripts. However, the code will still help as a supplement to your own learning.

## Overview of Analyses

| Analysis | Notes | Resources |
| --- | ---------- | -- |
| Initial Exploration | This went on during the first 2 weeks of my rotation. The goal was to get familiar with how R code works (which is very different from my normal coding languages). I learned from Ashley’s code how to load data, sort it, work with the different types of microbiome data, and save new files. This helped me learn the necessary foundations to explore the different plots in my code, LearningPlots.R. | Ashley’s Code:<br>DRIFT_Data_Processing_PATH.Rmd<br><br>My Code:<br>LearningPlots.R |
| Alpha Diversity Linear Model: lm() | For this project, I was tasked with using a linear model for alpha diversity. I learned how to do this from Ashley’s code. Their code is very important because it shows examples of lab practices for preparing the DRIFT data and how to create a forest plot for a single result. I used some of this code in every script over the 10 weeks. The example HTML output code was incredibly important as well. It helped me learn how to organize my code better and allowed me to output a file for presenting my results cleanly at lab meetings. The purrr code example from Ashley also carried into every script I made for the rotation. | Ashley’s Code:<br>DRIFT_Example_Regressions.Rmd<br>Example html output.Rmd<br>DRIFT_Example_purr.Rmd<br><br>My Code:<br>RegressionsLearning.Rmd<br>AlphaDiversityLM.Rmd |
| Volatility Analyses Linear Model: lm() | For this project, I was tasked with learning microbiome volatility data. This required merging long-format and wide-format data, which was a challenge initially. Data preparation and model running in this code are very similar to the alpha diversity code. I never actually learned the MiRKAT code. It wasn’t required for the models. However, I think that MiRKAT will solve a lot of problems that I ran into, so maybe learn it. | Ashley’s Code:<br>DRIFT_Example_MiRKAT<br><br>My Code:<br>Volatility_analysis.Rmd |
| Linear Mixed-Effects Models: lmer() | For this project, I was introduced to a new model called linear mixed-effects regression. I was given code examples from both Maggie and Ashley for this. | Maggie’s Code:<br>LME_example.Rmd<br><br>Ashley’s Code:<br>DRIFT_Example_LMER.Rmd<br><br>My Code:<br>LMER.Rmd |
| Linear Decomposition Model: ldm() | This was my final task of the rotation. I was given no code to go off of. Instead, I was given resources to learn about LDM models. I managed to finish a heatmap with all the microbiome and a bar graph of the beta values with q-values less than 0.1. I don’t feel happy with my code or results here. When I run the model, I get a different number of results, but the same taxa are appearing. AI said to provide a seed to the model so that the results are the same. However, I want to learn more about the model before I trust AI’s advice. | [https://academic.oup.com/bioinformatics/article/36/14/4106/5823298?login=true](https://academic.oup.com/bioinformatics/article/36/14/4106/5823298?login=true)<br><br>[https://rstudio-pubs-static.s3.amazonaws.com/556541_901bef17ae49456c8e01ae6b9e163701.html](https://rstudio-pubs-static.s3.amazonaws.com/556541_901bef17ae49456c8e01ae6b9e163701.html)<br><br>My Code:<br>LDM2.Rmd |

## Software and Packages

I used R and RStudio for this work.

Visual Studio Code would also work; however, it’s not as user-friendly.

Before running a script, make sure your libraries are installed and enabled. It’s good practice to only include packages that you use or need for the script (something I did not follow).

```r
install.packages("package_name")
library("package_name")
```

Packages and tools that may be useful include:

| Package/tool | Purpose |
| --- | --- |
| tidyverse | Preparing data |
| dplyr | Interacting with columns/rows of data, joining tables, summarizing data, data checking |
| purrr | Reduces a lot of data preparation lines of code. Applies the same operation across multiple variables |
| ggplot2 | Creating all plots |

## Data Access and Running the Scripts

The data files are not included in this repository. You must obtain access to the appropriate data files through Maggie or Ashley.

### Before Running a Script

1. Read any introductory comments (I didn’t make any introductory comments, but I made sure to comment on my scripts’ code as it was created).
2. Try to run the `library()` code block:

   ```r
   #install.packages("R.utils")
   library(R.utils)
   #install.packages("LDM")
   library(LDM
   ```

3. Install any missing libraries.
4. Update the file path code block to the file location on your computer.
5. Attempt to run each individual code block, fixing any issues that arise.

## Rotation Challenges

One of the most challenging parts was learning how to prepare the data for the analysis. Joining tables became easier with practice, and that experience helped me work with later datasets more confidently.

Running and interpreting models was another major learning area. Without understanding what the models are doing, I didn’t feel comfortable trusting the results. If you’re unfamiliar with statistical analysis like I am, I recommend finding some resources that explain the model a bit more in depth.

Spending time learning about the data also helped a ton. Long and wide data formats are handled very differently. Merging wide data into long can be a challenge if you’ve never done it before.

## Work in Progress

I am still developing my understanding of statistical interpretation, so these notes focus on documenting what I did and what I learned more than providing any conclusions or facts.
