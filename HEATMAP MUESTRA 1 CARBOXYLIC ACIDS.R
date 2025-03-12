# Load the pheatmap package
library(pheatmap)

# Define the 24-hour data
data_24hrs <- c(
  1.557, 0.332333333333333, 0.352333333333333, 0.253, 
  0.347, 0.475333333333333, 0.424666666666667, 0.22, 
  0.358
)

# Define the 48-hour data
data_48hrs <- c(
  1.557, 1.26566666666667, 2.058, 0.710666666666667, 
  1.919, 2.315, 1.40866666666667, 0.845333333333333, 
  2.04833333333333
)

# Define the 72-hour data
data_72hrs <- c(
  1.557, 1.79133333333333, 2.30766666666667, 1.675, 
  2.362, 2.55433333333333, 2.302, 1.53966666666667, 
  2.18433333333333
)

# Combine all data into a matrix
data <- matrix(
  c(data_24hrs, data_48hrs, data_72hrs), 
  nrow = 9, byrow = TRUE
)

# Define the compounds
compounds <- c(
  "D-Galactonic Acid γ-Lactone", "D-Galacturonic Acid", 
  "2-Hydroxy Benzoic Acid", " 4-Hydroxy Benzoic Acid", 
  "γ-Amino Butyric Acid", "Itaconic Acid", 
  "α-Keto Butyric Acid", " D-Malic Acid")

# Define the time points
time_points <- c("24 horas", "48 horas", "72 horas")

# Create the heatmap
pheatmap(
  data,
  labels_row = compounds,
  labels_col = time_points,
  cluster_cols = FALSE,
  cluster_rows = FALSE,
  fontsize = 10,
  main = "Muestra 1.  CEPS.  T1R1. 10 cm de profundidad. suelo Lote 16",
  cellwidth = 50,
  cellheight = 30,
  border_color = NA
)
