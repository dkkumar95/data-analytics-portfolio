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

*Completed as part of a graduate-level Data Mining course (Practical 4).*

*Notebook will be uploaded when the course ends in Dec 2025*

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
def load_and_combine_csvs(directory_path)
```
- Loads multiple CSV files from directory
- Combines into single DataFrame
- Handles training, validation, and test datasets

**2. Feature Engineering**
```python
def create_features(df)
```
- Creates technical indicators
- Calculates moving averages
- Generates price-based features
- Computes momentum indicators

**3. Target Creation**
```python
def create_target(df, future_steps=30)
```
- Creates binary labels based on 30-minute future price
- Maintains consistency with Practical 3 methodology

**4. Model Evaluation**
```python
def evaluate_model(model, X_train, y_train, X_val, y_val, X_test, y_test)
```
- Unified evaluation function for all models
- Computes metrics on train, validation, and test sets
- Generates predictions and performance reports

---

## 🎯 Key Findings & Model Comparison

### Model Performance Summary

*(Based on test set evaluation)*

| Model | Type | Key Strength | Addressed Issue |
|-------|------|--------------|-----------------|
| **Random Forest** | Traditional ML | Interpretable, fast training | Reduced overfitting from Practical 3 |
| **XGBoost** | Advanced ML | Strong tabular performance | Best ML model from Practical 3 |
| **LSTM** | Deep Learning | Sequential pattern learning | Normalized data for convergence |
| **CNN-LSTM** | Custom Hybrid | Feature + temporal modeling | Novel architecture combination |

### Improvements from Practical 3

**Overfitting Mitigation:**
- ✅ Adjusted Random Forest hyperparameters (shallower trees, larger leaf sizes)
- ✅ Implemented proper train/validation/test workflow
- ✅ Applied data normalization for deep learning models
- ✅ Monitored validation performance during training

**Model Enhancements:**
- ✅ Introduced deep learning approaches (LSTM, CNN-LSTM)
- ✅ Created custom hybrid architecture
- ✅ Improved convergence with proper data preprocessing

---

## 💡 Technical Insights

### Why Deep Learning for Time Series?

**LSTM Benefits:**
- Captures long-term dependencies traditional models miss
- Handles sequential data naturally
- Learns temporal patterns automatically

**CNN-LSTM Benefits:**
- CNNs extract local features (short-term patterns)
- LSTMs model global trends (long-term dependencies)
- Hierarchical feature learning improves robustness

### Challenges & Solutions

**Challenge 1: LSTM Predicting All Class 1**
- **Cause:** Unnormalized data and poor initialization
- **Solution:** Applied MinMaxScaler, increased epochs, tuned learning rate

**Challenge 2: Overfitting in ML Models**
- **Cause:** Too complex trees in Random Forest
- **Solution:** Constrained tree depth and leaf sizes

**Challenge 3: Data Leakage Prevention**
- **Cause:** Risk of information from test set leaking to training
- **Solution:** Chronological splits, fit scaler only on training data

---

## 🛠️ Skills Demonstrated

**Machine Learning:**
- Traditional ensemble methods (Random Forest, XGBoost)
- Hyperparameter tuning for overfitting prevention
- Model comparison and selection

**Deep Learning:**
- Recurrent neural networks (LSTM)
- Convolutional neural networks (1D CNN)
- Hybrid architecture design (CNN-LSTM)
- Sequential data preprocessing
- Training monitoring and early stopping

**Financial Domain:**
- Technical indicator calculation
- Time series feature engineering
- Trading signal generation
- Risk-aware model evaluation

**Software Engineering:**
- Modular code design with reusable functions
- Reproducibility (random seeds)
- Proper data pipeline implementation
- Comprehensive model evaluation framework

---


## 🚀 Real-World Applications

### Trading Strategy Development
- Generate buy/sell signals based on model predictions
- Backtest strategies using historical data
- Optimize entry/exit timing

### Risk Management
- Predict high-volatility periods
- Set stop-loss levels based on confidence scores
- Portfolio rebalancing signals

### Market Analysis
- Identify price trend patterns
- Understand feature importance (which indicators matter most)
- Compare market regimes

---

## 📈 Future Enhancements

**Model Improvements:**
- Implement attention mechanisms for better interpretability
- Try Transformer-based architectures
- Ensemble multiple deep learning models
- Add sentiment analysis from social media

**Feature Engineering:**
- Incorporate order book data
- Add cross-cryptocurrency correlations
- Include macroeconomic indicators
- Real-time feature calculation

**Evaluation:**
- Implement backtesting framework
- Calculate financial metrics (Sharpe ratio, maximum drawdown)
- Test on multiple cryptocurrencies
- Evaluate under different market conditions

---


*This project demonstrates the application of both traditional machine learning and modern deep learning techniques to financial time series prediction, showcasing model selection, hyperparameter optimization, and custom architecture design for sequential data.*
