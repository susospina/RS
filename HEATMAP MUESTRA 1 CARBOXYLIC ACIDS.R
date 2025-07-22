# Heatmap of Metabolite Concentrations in Soil Samples

This project visualizes microbial metabolite changes over time in a soil sample using a heatmap created with R. The data represents the concentration of several key organic acids measured at 24, 48, and 72 hours.

## 🧪 Description

As part of an internship project on microbial behavior in soil, this analysis focuses on the production of compounds like Itaconic Acid, GABA, and Malic Acid under laboratory conditions. The data was visualized using the `pheatmap` package in R to highlight trends across time.

## 📊 Data Overview

- **Time Points:** 24h, 48h, 72h  
- **Sample Type:** Soil (10 cm depth, Lote 16)  
- **Compounds Analyzed:**
  - D-Galactonic Acid γ-Lactone  
  - D-Galacturonic Acid  
  - 2-Hydroxy Benzoic Acid  
  - 4-Hydroxy Benzoic Acid  
  - γ-Amino Butyric Acid (GABA)  
  - Itaconic Acid  
  - α-Keto Butyric Acid  
  - D-Malic Acid

## 📂 Files

- `heatmap_metabolites.R`: R script to generate the heatmap
- `output/`: Folder to store the generated heatmap image (optional)

## 📈 Visualization

The heatmap clusters are disabled to retain direct comparison across time. The resulting graphic helps visualize how compound concentrations evolve and supports interpretation of microbial metabolic activity.

## 📦 Tools & Libraries

- `R`
- `pheatmap`

## 📍 Output

The script produces a clear heatmap with labeled rows (compounds) and columns (time points) to be used in microbial ecology reports or scientific presentations.

---

Feel free to clone or adapt this script for similar metabolite or time-series visualizations.

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
# Save heatmap to a PNG file
png("heatmap_metabolites.png", width = 800, height = 600)
