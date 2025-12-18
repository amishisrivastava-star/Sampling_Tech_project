Sampling–II: Population Mean Estimation

Overview
This repository contains an R-based implementation of Sampling–II methods for estimating the population mean. The project focuses on subgroup (stratified) sampling and cluster sampling while considering practical survey factors such as sampling bias, cost, and time.

The work was completed as part of an asynchronous assignment for the Statistics and Data Science course.

Objectives

Estimate the population mean using Sampling–II techniques

Determine required sample size under different sampling designs

Incorporate sampling bias, survey cost, and time constraints

Visualize sample allocation and experimental design

Methodology

Subgroup (Stratified) Sampling
The population is divided into multiple subgroups. Sample size is calculated using subgroup proportions and variances, with adjustments for sampling bias. Optimal allocation is performed by considering the cost and time required for data collection in each subgroup.

Cluster Sampling
The population is divided into clusters. The required number of clusters is determined based on desired precision, bias, and cluster-level variability. Total survey cost and time are also estimated.

Features

Bias-adjusted sample size estimation

Cost- and time-efficient allocation

Tabular summaries of sampling plans

Graphical representation of sampling design

Flow diagrams illustrating the experiment design

Tools Used

R programming language

Base R plotting functions

Repository Structure

Subgroup_Sampling.R

Cluster_Sampling.R

README.md

Course Information
Course: Statistics and Data Science
Topic: Sampling–II (Population Mean)
Assignment Type: Asynchronous
Attendance Credit: 2 Hours

Author
Developed as part of academic coursework.
