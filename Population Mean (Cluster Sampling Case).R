#########################################################
# CLUSTER SAMPLING
# Population Mean Estimation
#########################################################

# -------------------------------
# A. CLUSTER INFORMATION
# -------------------------------

# Available clusters in population
Total_clusters <- 50

# Between-cluster variance
Cluster_var <- 36
Cluster_sd  <- sqrt(Cluster_var)

# Average elements per cluster
Cluster_size <- 20

# Operational cost per cluster
Cluster_cost <- 120

# Time needed per cluster (hours)
Cluster_time <- 3

# Bias allowance
Bias <- 0.6

# Confidence level
alpha <- 0.05
Z_val <- qnorm(1 - alpha / 2)

# Margin of error
precision <- 2

# -------------------------------
# B. NUMBER OF CLUSTERS REQUIRED
# -------------------------------

clusters_needed <- (Z_val^2 * Cluster_var) /
  (precision^2 - Bias^2)

clusters_needed <- ceiling(clusters_needed)

cat("Clusters required:", clusters_needed, "\n")

# -------------------------------
# C. TOTAL RESOURCE ESTIMATION
# -------------------------------

survey_cost <- clusters_needed * Cluster_cost
survey_time <- clusters_needed * Cluster_time

cat("Survey Cost:", survey_cost, "\n")
cat("Survey Time (hours):", survey_time, "\n")

# -------------------------------
# D. CLUSTER DESIGN SUMMARY
# -------------------------------

cluster_design <- data.frame(
  Metric = c(
    "Available Clusters",
    "Selected Clusters",
    "Average Cluster Size",
    "Cluster Variance",
    "Bias",
    "Cost per Cluster",
    "Time per Cluster"
  ),
  Value = c(
    Total_clusters,
    clusters_needed,
    Cluster_size,
    Cluster_var,
    Bias,
    Cluster_cost,
    Cluster_time
  )
)

print(cluster_design)

# -------------------------------
# E. VISUALIZATION: CLUSTER SELECTION
# -------------------------------

barplot(
  c(clusters_needed, Total_clusters - clusters_needed),
  names.arg = c("Chosen", "Not Chosen"),
  main = "Cluster Sampling Structure",
  ylab = "Number of Clusters",
  col = c("steelblue", "lightgray")
)

# -------------------------------
# F. RESOURCE UTILIZATION
# -------------------------------

barplot(
  c(survey_cost, survey_time),
  names.arg = c("Total Cost", "Total Time"),
  main = "Survey Resource Impact",
  col = "darkseagreen"
)

# -------------------------------
# G. EXPERIMENT FLOW DIAGRAM
# -------------------------------

plot.new()
plot.window(xlim = c(0, 10), ylim = c(0, 10))

text(5, 9, "Define Objective\n(Mean Estimation)")
text(5, 8, "|")
text(5, 7.4, "Identify Clusters")
text(5, 6.8, "|")
text(5, 6.2, "Estimate Cluster Variability")
text(5, 5.6, "|")
text(5, 5, "Incorporate Bias, Cost & Time")
text(5, 4.4, "|")
text(5, 3.8, "Calculate Required Clusters")
text(5, 3.2, "|")
text(5, 2.6, "Random Cluster Selection")
text(5, 2, "|")
text(5, 1.4, "Estimate Population Mean")

title("Cluster Sampling – Experimental Design")
