# 🔥 CAL FIRE Wildfire Structure Damage Prediction

**Tools:** Python, pandas, NumPy, scikit-learn, Matplotlib, Seaborn, Jupyter Notebook  
**Skills:** Data cleaning, EDA, feature engineering, binary classification, model evaluation, hyperparameter tuning, cross-validation

---

## 📌 Project Overview

This project develops a **binary classification system** to predict wildfire structure damage using publicly available inspection data from the **California Department of Forestry and Fire Protection (CAL FIRE)**. The goal is to predict whether a structure will sustain **No Damage** or be **Destroyed (>50%)** based on structural characteristics, geographic features, and fire incident attributes.

### Problem Statement
Wildfires are devastating to communities, destroying homes, infrastructure, and natural environments. Understanding which structures are most vulnerable can help:
- Prioritize fire prevention resources
- Inform building code improvements  
- Support emergency evacuation planning
- Guide community preparedness efforts

### Dataset
**Source:** [CAL FIRE Damage Inspection (DINS) Dataset](https://data.ca.gov/dataset/cal-fire-damage-inspection-dins-data)

**Binary Target Variable:**
- **Destroyed (>50%)** (Class 1)
- **No Damage** (Class 0)

**Key Features:**
- Structure characteristics (eaves, exterior siding, window panes, year built)
- Geographic data (latitude, longitude, CAL FIRE region, zip code)
- Environmental factors (exterior vulnerability score, fence attachment)
- Fire incident details (incident month, region)

*Completed as part of COMP47350 - Graduate-level Data Analytics course.*

---

## 📂 Notebook Structure

**Main File:** `Diksha_Kumar_24214616_COMP47350_Homework2.ipynb`

The analysis follows a structured workflow:
- **Part 0:** Preprocessing & Data Preparation
- **Part 1:** Data Understanding and Feature Selection
- **Part 2:** Linear Regression (baseline)
- **Part 3:** Logistic Regression
- **Part 4:** Random Forest Classification
- **Part 5:** Model Improvement & Feature Engineering

---

## 🧼 Part 0: Data Preprocessing

### Objectives
Transform the raw CAL FIRE dataset into a clean, balanced, analysis-ready format.

### Key Preprocessing Steps

**🔹 Target Variable Rebalancing**
- Checked distribution of damage outcomes
- Applied techniques to address class imbalance (if present)
- Created binary encoding: `Damaged_Binary` (0 = No Damage, 1 = Destroyed)

**🔹 Data Cleaning**
- Handled missing values using domain-informed imputation strategies
- Converted data types for consistency
- Removed or capped outliers in geographic and structural features

**🔹 Initial Feature Engineering**
- Extracted temporal features (incident month)
- Created geographic groupings (zip prefixes, CAL FIRE regions)
- Developed composite scores (e.g., Exterior Vulnerability Score)

---

## 🔎 Part 1: Data Understanding & Feature Selection

### Objectives
Explore relationships between features and damage outcomes to identify the most predictive variables.

### Analysis Performed

**📊 Continuous Feature Analysis**
- Used **box plots** to compare feature distributions between "Destroyed" and "No Damage" groups
- Identified features showing clear separation between classes
- Key finding: Building age showed notable differences between damage categories

**📊 Categorical Feature Analysis**
- Created **stacked bar plots** for each categorical feature
- Assessed class separation and category dominance
- Identified features with strong predictive signals

**📊 Correlation Analysis**
- Examined relationships between continuous features
- Identified potential multicollinearity issues
- Selected features with distinct predictive value

---

## 🤖 Part 2: Linear Regression (Baseline Model)

### Approach
Applied **Linear Regression** as a baseline model, treating the problem as a regression task with threshold-based classification.

### Methodology
- **One-Hot Encoding** for categorical features to preserve category independence
- **Pipeline construction** with preprocessing and model fitting
- **0.5 threshold** for converting continuous predictions to binary classifications

### Results

**Training Performance:**
- **Accuracy:** 76%
- **Precision:** 76.6%
- **Recall:** 76.5%
- **F1-Score:** ~76%

**Test Performance:**
- Similar metrics on held-out test set
- Model showed consistent but moderate performance

### Key Insight
Linear regression provided interpretable coefficients showing feature importance, but struggled to capture non-linear relationships in the data.

---

## 📈 Part 3: Logistic Regression

### Approach
Applied **Logistic Regression** for proper binary classification with probabilistic outputs.

### Methodology
- Pipeline with categorical encoding and standardization
- Maximum iterations: 10,000 to ensure convergence
- **Cross-validation** using StratifiedKFold for robust evaluation
- ROC-AUC analysis for threshold selection

### Results

**Training Performance:**
- **Accuracy:** 76%
- **Precision:** 77%
- **Recall:** ~76%
- **F1-Score:** ~76%

**Test Performance:**
- Maintained consistent performance on test set
- Balanced precision and recall

### Coefficient Interpretation
Analyzed learned coefficients representing **log-odds** of structure destruction:
- Positive coefficients indicate increased destruction risk
- Negative coefficients suggest protective factors
- Magnitude indicates strength of association

### Visualizations Created
- **ROC Curve** showing model discrimination ability
- **Confusion Matrix** for detailed error analysis
- **Precision-Recall Curve** for threshold optimization

---

## 🌲 Part 4: Random Forest Classification

### Approach
Applied **Random Forest Classifier** to capture non-linear relationships and feature interactions.

### Methodology
- Ensemble of decision trees with majority voting
- Pipeline with imputation and one-hot encoding
- Evaluated feature importance scores
- Analyzed individual tree structures

### Results

**Training Performance:**
- **Accuracy:** 100%
- **Precision:** 100%
- **Recall:** 100%
- **F1-Score:** 100%

**Test Performance:**
- **Accuracy:** 93.1%
- **Precision:** ~93%
- **Recall:** ~93%
- **F1-Score:** ~93%

### Analysis
The perfect training performance (100%) indicated potential overfitting, but the model still generalized well to the test set (93.1%), demonstrating its strong predictive capability while maintaining balanced performance across both classes.

### Feature Importance
Extracted and visualized which features contributed most to prediction decisions, providing insights into key risk factors.

---

## 🚀 Part 5: Model Improvement & Feature Engineering

### Objective
Enhance the best-performing model (Random Forest) through advanced feature engineering and hyperparameter tuning.

### Feature Engineering Experiments

**🔹 Experiment 1: Geographic Interaction Feature**
- **New Feature:** `Lat_Long_Product` (Latitude × Longitude)
- **Rationale:** Capture geographic interaction effects beyond individual coordinates
- **Results:** Evaluated impact on model performance

**🔹 Experiment 2: Domain Knowledge Feature**
- **New Feature:** `Is_Older_Home` (binary flag for structures built before 1980)
- **Rationale:** Older buildings may be more vulnerable due to construction materials and methods
- **Results:** 
  - **Accuracy:** 93.44%
  - **Precision:** 95.71%
  - **Recall:** 91.29%
  - **F1-Score:** 93.45%
  - Showed slight performance improvement over baseline Random Forest

**🔹 Experiment 3: Combined Features**
- **Approach:** Added both `Lat_Long_Product` and `Is_Older_Home` together
- **Selected Top 10 Features:** Eaves, Exterior_Siding, Latitude, Longitude, Incident_Month, Window_Pane, Exterior_Vulnerability_Score, CAL_FIRE_Region, Zip_Prefix, Fence_Attached_to_Structure
- **Results:** Evaluated combined effect on predictive power

### Hyperparameter Tuning
- Used **GridSearchCV** for systematic parameter optimization
- Evaluated multiple parameter combinations
- Selected best-performing configuration based on cross-validation

---

## 📊 Model Comparison Summary

| Model | Test Accuracy | Precision | Recall | F1-Score | Key Strength |
|-------|--------------|-----------|---------|----------|--------------|
| **Linear Regression** | ~76% | ~77% | ~77% | ~76% | Simple, interpretable baseline |
| **Logistic Regression** | ~76% | ~77% | ~76% | ~76% | Probabilistic outputs, ROC analysis |
| **Random Forest** | **93.1%** | **~93%** | **~93%** | **~93%** | **Best performance, captures non-linearity** |
| **Random Forest (Enhanced)** | **93.44%** | **95.71%** | **91.29%** | **93.45%** | **Improved with domain features** |

### Winner: Random Forest with Feature Engineering
The enhanced Random Forest model with the `Is_Older_Home` feature achieved the best overall performance, demonstrating strong predictive accuracy with balanced precision and recall.

---

## 🧠 Key Insights & Findings

### Top Predictive Features
1. **Eaves** — Structural design element affecting fire vulnerability
2. **Exterior Siding** — Building material significantly impacts fire resistance
3. **Geographic Location** (Latitude/Longitude) — Regional fire risk patterns
4. **Incident Month** — Seasonal variations in fire severity
5. **Window Pane Type** — Opening protection level
6. **Exterior Vulnerability Score** — Composite risk indicator
7. **CAL FIRE Region** — Administrative area with distinct characteristics
8. **Structure Age** — Older homes (pre-1980) show higher vulnerability
9. **Fence Attachment** — Connected structures increase fire spread risk
10. **Zip Code Prefix** — Local geographic clustering

### Domain Knowledge Application
The project demonstrated that **incorporating domain expertise** (e.g., identifying pre-1980 structures as higher risk) can meaningfully improve model performance beyond pure data-driven approaches.

### Model Selection Insights
- **Linear models** provided interpretability but limited accuracy (~76%)
- **Tree-based models** significantly outperformed linear models (~93%)
- **Feature engineering** provided marginal but meaningful improvements
- **Balanced performance** across precision and recall indicates reliable predictions for both classes

---

## 💡 Real-World Applications

This analysis provides actionable insights for:

**🎯 Fire Prevention Planning**
- Identify high-risk structures for vegetation clearing and hardening
- Prioritize older homes (pre-1980) for retrofitting programs
- Target specific regions and zip codes for intervention

**🎯 Emergency Response**
- Allocate resources during active wildfires based on predicted vulnerability
- Prioritize structure protection efforts
- Guide evacuation decision-making

**🎯 Building Code Development**
- Inform requirements for eaves, siding materials, and window protection
- Support policy decisions for fire-prone areas
- Encourage retrofitting of older structures

**🎯 Insurance & Risk Assessment**
- Support actuarial modeling for wildfire insurance
- Identify high-risk properties for premium adjustments
- Guide risk mitigation recommendations

---

## 🛠️ Technical Skills Demonstrated

**Data Science Workflow:**
- End-to-end ML pipeline development
- Handling imbalanced classification problems
- Feature selection and engineering
- Model comparison and evaluation

**Machine Learning:**
- Binary classification with multiple algorithms
- Hyperparameter tuning with GridSearchCV
- Cross-validation for robust evaluation
- Feature importance analysis

**Programming & Tools:**
- Python (pandas, NumPy, scikit-learn, Matplotlib, Seaborn)
- Jupyter Notebook for reproducible research
- Pipeline construction for production-ready code

**Domain Application:**
- Translating business problems into ML tasks
- Incorporating domain knowledge into features
- Generating actionable insights from model outputs


---


*This project showcases the complete data science workflow from preprocessing through model improvement, demonstrating both technical ML skills and the ability to generate actionable insights for critical public safety applications.*
