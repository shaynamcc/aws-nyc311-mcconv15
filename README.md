# NYC 311 Service Request Analysis & Predictive Modeling Project
- **Description**: Analysis of NYC 311 service requests to identify patterns in complaint types by agency and borough, with predictive modeling to forecast resolution times using AWS SageMaker.

## Data Source and Provenance
- **Source**: [NYC Open Data 311 Service Requests](https://data.cityofnewyork.us/Social-Services/311-Service-Requests-from-2020-to-Present/erm2-nwe9/)
- **Time period**: Jan 29–Mar 21, 2026 (Q1 2026)
- **Prep**: Instructor-generated random sample of 200k complaints from 15 agencies
- **Files**: 
  - `raw/complaints.csv` (200k rows, main requests table)
  - `raw/agencies.csv` (unique agencies lookup table)
- **S3 paths** (after upload):
  - `s3://cmse492-mcconv15-nyc311-891376917256-us-east-1-an/raw/complaints/complaints.csv`
  - `s3://cmse492-mcconv15-nyc311-891376917256-us-east-1-an/raw/agencies/agencies.csv`

## Project Structure

```
aws-nyc311-mcconv15/          # GitHub repo name
├── README.md                 # Data source, S3 paths, assumptions
├── DATA_DICTIONARY.md        # Column details
├── raw/                      # Local copies of S3 uploads
│   ├── complaints.csv
│   └── agencies.csv
├── sql/                      # Athena queries (to be populated)
├── notes/                    # Observations, decisions (to be populated)
├── notebooks/                # Code, data-loading, modeling
│   ├── data_load_verify.ipynb
│   ├── modeling_train_and_eval.ipynb
│   ├── stakeholder_question03_linear_learner-Shayna_McConville.ipynb
│   └── confusion_matrix.png
└── reports/                  # Stakeholder outputs (to be populated)
```

## Data Summary
See `DATA_DICTIONARY.md` for full schema. This document is very detailed and showcases a lot of the important features of this dataset and modeling schema.

**Key relationships**: Join `complaints.agency = agencies.agency`

**Stakeholder question**:
- Predict the likely complaint category for an incoming 311 complaint.

## Assumptions and Known Issues
- Empty `closed_date` = open/unresolved requests
- Some `incident_zip` values are 0 or missing
- String dates need parsing in Athena/SQL
- Model predictions assume similar data distribution for future complaints