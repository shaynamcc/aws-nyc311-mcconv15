# NYC 311 Modeling Plan

**Date created:** 4/28/2026

## Business question
Predict the likely complaint category for an incoming 311 complaint.

## Data source
- **S3 path:** cmse492-mcconv15-nyc311-891376917256-us-east-1-an
- **Records:** 173851
- **Athena query:** sql/athena_to_modeling.sql

## Features (update/expand based on your query)
- agency (string/categorical): The department handling the issue.
- borough (string/categorical): Geographic location of the complaint.
- hour_of_day/day_of_week (numeric): Extracted from created_date to capture temporal patterns.
## Target
- **Name:** problem
- **Type:** Multi-class Classification
- **Balance/Distribution:**
  
problem
Illegal Parking                         28835
HEAT/HOT WATER                          28232
Noise - Residential                     16623
Snow or Ice                             11846
Blocked Driveway                        11033
                                        ...  
Special Natural Area District (SNAD)        1
Wayfinding                                  1
DEP Street Condition                        1
Public Toilet                               1
Highway Sign - Dangling                     1

## Modeling approach (update based on your question and data)
- **Baseline:** Logistic regression (interpretable, fast to train)
- **Metrics:** Accuracy, precision, recall
- **Train/test split:** 80/20

## Model Performance/Interpretation
- My model performs pretty terribly. These 2 features selected are not a great fit to predict this target.

Accuracy:  0.169
Precision: 0.128
Recall:    0.169

## Limitation
- I believe that my model does not work accurately because these features don't have a ton of correlation.

## Data quality notes
- Need to drop rows where borough or agency is missing
- Significant class imbalance

## Next steps (What you'll work on in the next class period; update/modify based on your plan)
- Train/test split
- Fit baseline logistic regression
- Evaluate and interpret results
