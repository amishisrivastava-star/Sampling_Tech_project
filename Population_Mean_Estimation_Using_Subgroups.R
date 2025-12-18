#########################################################
# Population Mean Estimation using Subgroups
# Bias, Cost, and Time Aware Design
#########################################################

# -------------------------------
# A. SURVEY SETUP
# -------------------------------

# Total number of subgroups
G <- 3

# Proportion of population in each subgroup
P <- c(0.40, 0.35, 0.25)

# Variability within each subgroup
Var_g <- c(16, 25, 9)
SD_g  <- sqrt(Var_g)

# Survey cost per unit (by subgroup)
Cost_g <- c(10, 15, 8)

# Time required per unit (by subgroup)
Time_g <- c(2, 3, 1.5)

# Expected sampling bias
Bias <- 0.5

# Confidence specification
alpha <- 0.05
Z_val <- qnorm(1 - alpha / 2)

# Precision requirement
error_limit <- 1.5

# -------------------------------
# B. COMPUTE TOTAL SAMPLE SIZE
# -------------------------------

sample_n <- (Z_val^2 * sum(P * Var_g)) /
  (error_limit^2 - Bias^2)

sample_n <- ceiling(sample_n)

cat("Total sample size required:", sample_n, "\n")

# -------------------------------
# C. OPTIMAL SAMPLE DISTRIBUTION
# (Cost & Time Efficient)
# -------------------------------

weight_factor <- (P * SD_g) / sqrt(Cost_g * Time_g)

n_group <- sample_n * weight_factor / sum(weight_factor)
n_group <- ceiling(n_group)

allocation_summary <- data.frame(
  Subgroup = paste("Subgroup", 1:G),
  Population_Share = P,
  Variance = Var_g,
  Cost = Cost_g,
  Time = Time_g,
  Allocated_Sample = n_group
)

print(allocation_summary)

# -------------------------------
# D. RESOURCE REQUIREMENTS
# -------------------------------

overall_cost <- sum(n_group * Cost_g)
overall_time <- sum(n_group * Time_g)

cat("Estimated Total Cost:", overall_cost, "\n")
cat("Estimated Total Time:", overall_time, "\n")

# -------------------------------
# E. VISUALIZATION: SAMPLE SPLIT
# -------------------------------

barplot(
  n_group,
  names.arg = paste("Group", 1:G),
  main = "Sample Allocation Across Subgroups",
  ylab = "Number of Units",
  col = "steelblue"
)

# -------------------------------
# F. EXPERIMENT DESIGN FLOW
# -------------------------------

plot.new()
plot.window(xlim = c(0, 10), ylim = c(0, 10))

text(5, 9, "Define Target\n(Population Mean)")
text(5, 8, "|")
text(5, 7.4, "Segment Population into Subgroups")
text(5, 6.8, "|")
text(5, 6.2, "Estimate Variance, Cost & Time")
text(5, 5.6, "|")
text(5, 5, "Adjust for Bias")
text(5, 4.4, "|")
text(5, 3.8, "Determine Total Sample Size")
text(5, 3.2, "|")
text(5, 2.6, "Allocate Samples Optimally")
text(5, 2, "|")
text(5, 1.4, "Estimate Mean")

title("Sampling II – Subgroup Design")
