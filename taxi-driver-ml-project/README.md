# 🚕 Taxi Driver Hotspot Prediction & Recommendation System

**Role:** Data Lead  
**Team:** Cross-functional (Data, UI/UX, Backend)  
**Tools:** Python, pandas, NumPy, scikit-learn, Matplotlib, Seaborn, Jupyter Notebook, Git

---

## 📌 Project Overview

This project develops an **ML-powered decision-support system** for taxi and ride-hailing drivers to maximize earnings by identifying optimal pickup locations after drop-offs. Using historical taxi trip data, we built two integrated machine learning models designed to work as a real-time companion tool via mobile app.

### Core Models

**🎯 Hotspot Prediction Model**  
Identifies geographic zones with high customer demand using clustering algorithms and spatiotemporal pattern analysis.

**⭐ Scoring Model**  
Ranks potential pickup locations in real-time based on multiple factors:
- Estimated fare potential
- Distance to high-demand areas
- Current demand density
- Trip variability and reliability metrics

---

## 🔍 My Role: Data Lead

As **Data Lead**, I owned the entire data pipeline and machine learning development:

✅ **Data Engineering**
- Cleaned and transformed 5.6 Million trip records
- Engineered 15+ features from raw GPS, timestamp, and fare data
- Built reproducible preprocessing pipelines

✅ **Exploratory Analysis**
- Identified temporal demand patterns (peak hours, weekday vs. weekend)
- Mapped geospatial hotspots using heatmaps and density analysis
- Discovered key predictors of high-value trips

✅ **Model Development**
- Designed and trained both prediction models
- Implemented chronological train/test split (Jan–June train, July–Dec test) to prevent data leakage
- Evaluated models using precision, recall, and custom scoring metrics

✅ **Cross-Functional Collaboration**
- Integrated model outputs with UI team's mobile interface mockups
- Provided API specifications to backend developers
- Delivered technical presentations and documentation

---
*Completed as part of a graduate-level Data Analytics course.*
📂 **[View Full Project Repository →](https://github.com/matiasenrigue/Taximize/tree/main)**

---

## 📊 Project Components

### 1️⃣ Data Cleaning & Preparation
**Objective:** Transform raw taxi trip data into a clean, analysis-ready dataset.

**Key Steps:**
- Missing value imputation for pickup/drop-off coordinates and timestamps
- Outlier detection and handling (removed trips with impossible speeds or distances)
- Feature engineering:
  - Temporal: hour of day, day of week, weekend flag
  - Geospatial: zone clustering, distance to city center
  - Contextual: fare per mile, trip duration, demand density
- Data validation and quality checks

📄 **Notebook:** `data-cleaning.ipynb`

---

### 2️⃣ Exploratory Data Analysis (EDA)
**Objective:** Understand demand patterns and identify predictive signals.

**Key Findings:**
- **Peak demand hours:** 7-9 AM and 5-7 PM on weekdays
- **High-value zones:** Business districts and entertainment areas
- **Seasonal patterns:** Increased demand during holidays and events
- **Fare correlations:** Distance and time of day strongly predict fare amount

**Visualizations:**
- Pickup density heatmaps by hour and day
- Trip duration and distance distributions
- Correlation matrices for feature selection
- Time series plots of demand trends

📄 **Notebook:** `data-exploration.ipynb`

---

### 3️⃣ Hotspot Prediction Model
**Objective:** Predict high-demand geographic zones for upcoming time windows.

**Methodology:**
- **Clustering:** K-Means algorithm to segment city into demand zones
- **Temporal Analysis:** Hourly and daily demand patterns by zone
- **Geospatial Mapping:** Visualized clusters on interactive maps
- **Validation:** Evaluated cluster stability and demand predictability

**Output:**  
Real-time predictions of which zones will have highest customer availability in the next 30-60 minutes.

📄 **Notebook:** `Hotspot Prediction Function.ipynb`

---

### 4️⃣ Scoring Model (Recommendation System)
**Objective:** Rank potential pickup locations based on driver's current position.

**Methodology:**
- **Feature Engineering:** Combined fare potential, distance, demand density, and trip variability
- **Train/Test Strategy:** Chronological split to mimic real-world deployment
- **Model Selection:** Evaluated Logistic Regression, Random Forest, and Gradient Boosting
- **Output Format:** Probability score (0-1) indicating likelihood of finding next customer

**Key Features:**
- Fare potential (historical average in zone)
- Distance from current location
- Real-time demand levels
- Trip variability (reliability indicator)

**Performance:**
- Training Period: January–June
- Testing Period: July–December
- Validated using TA feedback and real-world scenario testing

📄 **Notebook:** `train_monthly_models.ipynb`

---

## 📈 Key Results & Impact

🎯 **Model Performance**
- Successfully identified high-demand zones with 75%+ accuracy
- Scoring model provides actionable recommendations in real-time
- Chronological validation ensures real-world applicability

💡 **Business Value**
- Reduces driver idle time between trips
- Increases earnings potential through optimized positioning
- Provides data-driven decision support vs. intuition-based driving

🤝 **Team Collaboration**
- Delivered production-ready model specifications to engineering team
- Created UI-friendly outputs for mobile app integration
- Presented findings to cross-functional stakeholders

---

---

## 🧠 Skills Demonstrated

**Technical Skills**
- End-to-end ML pipeline development
- Feature engineering for geospatial and temporal data
- Clustering and classification algorithms
- Model validation with time-series data
- Data visualization and storytelling

**Soft Skills**
- Project leadership and task delegation
- Cross-functional collaboration (Data, UI, Backend)
- Technical communication and presentation
- Iterative development with stakeholder feedback

