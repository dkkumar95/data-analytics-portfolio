# 📈 Cryptocurrency Price Movement Prediction using Machine Learning & Deep Learning

**Domain:** Financial Time Series Analysis  
**Tools:** Python, TensorFlow/Keras, scikit-learn, XGBoost, pandas, NumPy, Matplotlib, Seaborn  
**Skills:** Binary classification, time series forecasting, deep learning, ensemble methods, feature engineering, hyperparameter tuning, model comparison

---

## 📌 Project Overview

This project develops and compares **multiple classification models** to predict Bitcoin (BTC) price movements 30 minutes ahead. The goal is to build a trading signal system that predicts whether the cryptocurrency price will go **up** or **down** in the next 30-minute window, using historical price data and technical indicators.

### Problem Statement
Cryptocurrency markets are highly volatile and unpredictable. Traders need reliable signals to make informed decisions about when to enter or exit positions. This project addresses this need by:
- Building predictive models using historical BTC price data
- Comparing traditional machine learning with deep learning approaches
- Creating a custom hybrid CNN-LSTM architecture for sequence modeling
- Evaluating models using comprehensive classification metrics

### Binary Classification Target
- **Class 1 (UP):** Future price (30 minutes ahead) > Current price
- **Class 0 (DOWN):** Future price (30 minutes ahead) ≤ Current price

*This project extends work from Practical 3 with improved models and addresses overfitting issues identified in the previous analysis.*

*Completed as part of a graduate-level Data Mining Course (Practical 4).*

*Notebook will be uploaded after the course is completed in December 2025*

---

## 🗂️ Dataset & Features

### Data Source
- **Cryptocurrency:** Bitcoin (BTC)
- **Format:** Multiple CSV files containing minute-level price data
- **Time Period:** Historical trading data
- **Train/Validation/Test Split:** Chronological split to prevent data leakage

### Technical Indicators & Features

The feature engineering pipeline creates multiple technical indicators commonly used in financial analysis:

**Price-Based Features:**
- `price_range`: High - Low (volatility indicator)
- `price_change`: Close - Open (directional movement)
- `price_change_pct`: Percentage price change

**Moving Averages:**
- `ma_5`, `ma_10`, `ma_20`, `ma_50`: Simple moving averages at different time windows
- `ema_12`, `ema_26`: Exponential moving averages for trend detection

**Technical Indicators:**
- **RSI (Relative Strength Index):** Momentum oscillator measuring overbought/oversold conditions
- **MACD (Moving Average Convergence Divergence):** Trend-following momentum indicator
- **Bollinger Bands:** Volatility bands around price
- **Volume indicators:** Trading volume patterns
- **Momentum indicators:** Rate of price change

**Lagged Features:**
- Historical price movements at various time lags to capture temporal patterns

---

## 🤖 Models Implemented

### Model Selection Strategy
Implemented **4 distinct models** spanning traditional machine learning and deep learning approaches to explore different model families and architectures.

---

### 1️⃣ Random Forest (Baseline Model)

**Type:** Ensemble Machine Learning  
**Purpose:** Establish baseline performance with interpretable tree-based model

**Architecture:**
- Ensemble of decision trees with majority voting
- Hyperparameters optimized to reduce overfitting from Practical 3

**Improvements from Practical 3:**
- `max_depth`: Changed from 15 → **10** (shallower trees for better generalization)
- `min_samples_split`: Changed from 2 → **5** (avoid overly pure leaves)
- `min_samples_leaf`: Changed from 1 → **2** (reduce variance)

**Rationale:** These adjustments address overfitting observed in Practical 3 by constraining tree complexity.

---

### 2️⃣ XGBoost (Advanced ML Model)

**Type:** Gradient Boosted Trees  
**Purpose:** Leverage state-of-the-art ML algorithm known for strong performance on tabular data

**Architecture:**
- Gradient boosting with tree ensembles
- Sequential training with error correction

**Hyperparameters:**
- `n_estimators`: 400 (number of boosting rounds)
- `learning_rate`: 0.05 (slow learning for better generalization)
- `max_depth`: 6 (tree depth)
- `subsample`: 0.8 (row sampling to prevent overfitting)
- `colsample_bytree`: 0.8 (column sampling for feature diversity)
- `objective`: 'binary:logistic' (binary classification)
- `eval_metric`: 'logloss' (evaluation metric)

**Performance Note:** In Practical 3, XGBoost showed slightly better performance than Random Forest, making it a strong candidate for this comparison.

---

### 3️⃣ LSTM (Long Short-Term Memory Network)

**Type:** Deep Learning - Recurrent Neural Network  
**Purpose:** Capture temporal dependencies and sequential patterns in time series data

**Architecture:**
- LSTM layers designed for sequence modeling
- Handles variable-length sequences
- Memory cells retain information across time steps

**Key Features:**
- **Data Preprocessing:** MinMaxScaler normalization applied before training
- **Sequence Creation:** Time series data converted to sliding window sequences
- **Temporal Modeling:** Captures long-term dependencies in price movements

**Initial Challenge & Solution:**
- **Problem Identified:** Initial model predicted all outputs as class 1
- **Root Cause:** Lack of proper data normalization and insufficient model depth
- **Solution:** Applied MinMaxScaler and increased training epochs for better convergence

---

### 4️⃣ CNN-LSTM (Custom Hybrid Model) ⭐

**Type:** Deep Learning - Hybrid Architecture  
**Purpose:** Combine feature extraction (CNN) with temporal modeling (LSTM)

**Architecture:**
This is the **custom/improved model** satisfying Task 2 requirements.

**Design Rationale:**
- **CNN Layers:** Extract local patterns and features from time series windows
  - 1D convolutions slide over temporal sequences
  - Capture short-term price patterns and momentum
  - Reduce dimensionality through pooling

- **LSTM Layers:** Model long-term temporal dependencies
  - Process CNN-extracted features sequentially
  - Capture market trends and momentum over time
  - Maintain memory of important historical patterns

**Advantages of Hybrid Approach:**
1. **Feature Hierarchy:** CNN learns low-level patterns, LSTM learns high-level temporal relationships
2. **Computational Efficiency:** CNN reduces sequence length before LSTM processing
3. **Robust Representations:** Combines spatial and temporal feature learning
4. **Better Generalization:** Multi-stage processing reduces overfitting risk

**Implementation:**
- Random seeds set for reproducibility (SEED=42)
- MinMaxScaler normalization on training data only (prevent data leakage)
- Transform validation and test sets using training statistics

---

## 📊 Training & Evaluation Methodology

### Data Split Strategy
- **Training Set:** Model training and parameter learning
- **Validation Set:** Hyperparameter tuning and overfitting monitoring
- **Test Set:** Final performance evaluation (never seen during training)

**Critical:** Chronological split maintains temporal order to prevent look-ahead bias.

### Evaluation Metrics

All models evaluated using comprehensive classification metrics:

| Metric | Purpose |
|--------|---------|
| **Accuracy** | Overall correct predictions |
| **Precision** | Of predicted UP signals, how many were correct? |
| **Recall** | Of actual UP movements, how many did we catch? |
| **F1-Score** | Harmonic mean of precision and recall |
| **Confusion Matrix** | Detailed breakdown of TP, TN, FP, FN |
| **ROC-AUC** | Model's discrimination ability (if applicable) |

### Visualization
- Model comparison charts
- Confusion matrices for each model
- Performance metric comparisons across train/validation/test sets

---

## 🔧 Technical Implementation

### Data Pipeline

**1. Data Loading**
```python

