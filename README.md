# 📊 Loan Default Risk Analysis

## 1. Executive Summary

This analysis identifies key risk factors associated with loan defaults by segmenting borrowers across multiple dimensions including credit scores, debt-to-income ratios, loan purposes, and employment status. Using comprehensive Power BI visualizations and SQL-based analytics, we provide data-driven insights to support lending decisions and portfolio management strategies.

### Business Impact:
- **Identified lowest-risk borrower profile:** Credit Score >800, DTI <20%, Medical Expenses loan purpose, and Contract employment status
- **Risk Segmentation:** Categorized borrowers into 5 risk tiers across 4 key dimensions
- **Data-Driven Insights:** Enabled lenders to make informed approval decisions based on borrower risk profiles
- **Decision Support:** Created actionable risk metrics to guide lending policy and underwriting criteria
- **Comprehensive Dashboards:** Developed interactive Power BI visualizations for real-time risk monitoring

### Key Next Steps:
1. Implement risk-based pricing models based on identified segments
2. Develop automated approval workflows using segmentation criteria
3. Monitor portfolio performance against identified risk thresholds
4. Integrate real-time credit monitoring for existing borrowers

---

## 2. Business Problem

Traditional lending institutions face significant challenges in assessing borrower risk:
- **Incomplete Risk Assessment:** Manual underwriting processes may miss critical risk factors
- **Portfolio Losses:** Loan defaults result in significant financial losses
- **Inconsistent Decision-Making:** Lack of systematic risk evaluation across borrower profiles
- **Need for Data-Driven Approach:** Growing demand for quantifiable, objective risk metrics to support lending decisions

This analysis addresses these challenges by providing empirical evidence of which borrower characteristics correlate with lower default risk, enabling more informed and consistent lending decisions.

---

## 3. Business Problem (Detailed)

### Current Challenges:
- Identifying borrower segments with predictable default patterns
- Understanding the relationship between borrower characteristics and loan performance
- Establishing evidence-based risk thresholds for lending decisions
- Segmenting borrowers for targeted marketing and risk management strategies

### Solution Approach:
By analyzing historical loan data across multiple risk dimensions, this project provides:
- **Clear risk profiles** for different borrower segments
- **Quantifiable risk metrics** (default rates by segment)
- **Actionable recommendations** for underwriting and approval criteria
- **Data-driven insights** to support strategic lending decisions

---

## 4. Methodology

### Data Source:
- **Source:** Analyst Builder.com
- **Data Coverage:** Historical loan application and borrower profile data
- **Dataset Composition:** 
  - **Loan Applications:** `loan_applications.csv` - Contains loan request details, application status, and default indicators
  - **Borrower Profiles:** `borrower_profiles.csv` - Contains demographic, credit, and employment information

### Tools & Technologies:
- **BigQuery:** Cloud data warehousing and SQL query execution
- **SQL:** Data extraction, transformation, and aggregation
- **Power BI:** Data visualization and business intelligence dashboards
- **CSV Data Files:** Standardized data format for analysis and integration

### Analysis Approach:

#### Phase 1: Segment Analysis
- Created risk segments based on credit score tiers (Poor, Fair, Good, Very Good, Exceptional)
- Segmented borrowers by debt-to-income ratios (Excellent, Good, Manageable, High Risk, Critical)
- Analyzed employment status categories
- Segmented by loan purpose categories (Medical Expenses, etc.)

#### Phase 2: Correlation Analysis
- Examined default rates across each segment
- Identified patterns and correlations between borrower characteristics and default behavior
- Calculated default rate percentages for comparative analysis
- Evaluated segment performance metrics

#### Phase 3: Visualization & Reporting
- Created comprehensive dashboards in Power BI
- Visualized default rates by segment
- Developed comparative analysis charts
- Produced actionable insights and recommendations

---

## 5. Skills Demonstrated

- **SQL & Database Management:** Complex query writing, data joins, aggregations, and view creation in BigQuery
- **Data Analysis:** Segmentation analysis, correlation analysis, and statistical evaluation
- **Cloud Technologies:** BigQuery for large-scale data processing
- **Business Intelligence:** Power BI dashboard development and data visualization
- **Data Transformation:** ETL processes, data quality checks, and view engineering
- **Problem Solving:** Translating business questions into analytical frameworks
- **Documentation:** Creating reproducible, well-commented SQL code for future analysis

---

## 6. Results & Business Recommendations

### Key Findings:

**Lowest-Risk Borrower Profiles:**
1. **Credit Score >800 (Exceptional):** Borrowers with exceptional credit scores demonstrate the lowest default propensity
2. **Debt-to-Income Ratio <20% (Excellent):** Borrowers with minimal debt burden relative to income have significantly lower default risk
3. **Loan Purpose - Medical Expenses:** Medical loans show lower default rates compared to other loan purposes
4. **Employment Status - Contract:** Borrowers with contract employment status demonstrate the lowest default risk

### Business Recommendations:

1. **Risk-Based Pricing Model:**
   - Offer preferential rates to borrowers matching the lowest-risk profile
   - Implement tiered pricing based on segment classification

2. **Approval Strategy:**
   - Prioritize approval for borrowers with credit scores >800 and DTI <20%
   - Expedite medical expense loans with favorable terms
   - Develop targeted products for contract workers

3. **Portfolio Management:**
   - Focus relationship management efforts on low-risk segments
   - Implement enhanced monitoring for higher-risk borrowers
   - Use segmentation for early intervention programs

4. **Product Development:**
   - Develop specialized medical expense loan products with favorable terms
   - Create employment-based lending programs targeting contract workers
   - Design debt consolidation products for borrowers with high DTI ratios

---

## 7. Next Steps & Limitations

### Limitations & Challenges Encountered:

1. **Temporal Analysis:**
   - **Limitation:** Current analysis is snapshot-based; insufficient time-series data to model default trends over time
   - **Improvement Needed:** Historical data spanning multiple economic cycles to identify cyclical patterns

2. **External Factors:**
   - **Limitation:** Analysis does not incorporate external economic indicators (interest rates, unemployment, market conditions)
   - **Improvement Needed:** Integration of macroeconomic data for more robust risk models

3. **Predictive Modeling:**
   - **Limitation:** Current analysis is descriptive; lacks predictive models for prospective borrower assessment
   - **Improvement Needed:** Implementation of machine learning models (logistic regression, decision trees) for default probability prediction

4. **Real-Time Integration:**
   - **Limitation:** Analysis based on historical batch data; no real-time monitoring capabilities
   - **Improvement Needed:** Build automated data pipelines for continuous monitoring and alert systems

5. **Behavioral Factors:**
   - **Limitation:** Limited behavioral and psychographic data in current dataset
   - **Improvement Needed:** Incorporate transaction history, payment patterns, and customer behavior signals

### Future Enhancements:

1. Develop predictive default probability models
2. Implement real-time credit monitoring systems
3. Create dynamic pricing algorithms based on borrower risk scores
4. Build automated approval workflows
5. Integrate external economic indicators for context-aware risk assessment
6. Develop customer segmentation for targeted retention programs
7. Create early warning systems for at-risk borrowers

---

## 📁 Project Structure

```
Loan-Default-Risk-Analysis/
├── README.md                         # Project documentation (this file)
├── loan_analysis_queries.sql         # Main SQL queries and analytical views
├── loan_applications.csv             # Loan application data (50 KB)
│   ├── Contains: Application IDs, Loan Amounts, Purposes, Default Status, etc.
│   └── Records: Historical loan request information
├── borrower_profiles.csv             # Borrower demographic & credit data (31 KB)
│   ├── Contains: Credit Scores, DTI Ratios, Employment Status, Demographics
│   └── Records: Borrower profile information linked to applications
└── visual.png                        # Power BI Dashboard Visualization
    └── Comprehensive dashboard showing default rates, risk segments, and key metrics
```

### File Descriptions:

| File | Size | Purpose | Key Content |
|------|------|---------|------------|
| **loan_applications.csv** | 50 KB | Loan request details | Application IDs, loan amounts, purposes, approval status, default indicators |
| **borrower_profiles.csv** | 31 KB | Borrower information | Credit scores, DTI ratios, employment status, income, demographics |
| **loan_analysis_queries.sql** | 5 KB | SQL analytics | Queries for segment analysis, default rate calculations, risk metrics |
| **visual.png** | 40 KB | Power BI Dashboard | Interactive visualizations of default rates, risk segments, and comparative analytics |

---

## 🔧 How to Use

### 1. **Data Analysis:**
   - Review `borrower_profiles.csv` and `loan_applications.csv` for raw data structure
   - Load datasets into your preferred analytics platform (BigQuery, Excel, Python, etc.)

### 2. **SQL Analysis:**
   - Access `loan_analysis_queries.sql` for analysis methodology
   - Execute queries in BigQuery with your dataset
   - Modify queries for your specific lending criteria and risk thresholds

### 3. **Visualizations:**
   - View `visual.png` to see the Power BI dashboard layout and key metrics
   - Replicate visualizations in Power BI, Tableau, or your preferred BI tool
   - Use the dashboard for stakeholder communication and decision support

### 4. **Replication Steps:**
   ```
   1. Load loan_applications.csv and borrower_profiles.csv into BigQuery
   2. Execute queries from loan_analysis_queries.sql
   3. Connect Power BI to query results
   4. Create dashboard based on visual.png design
   5. Integrate with lending approval workflows
   ```

---

## 📊 Power BI Dashboard - Key Visualizations

The `visual.png` dashboard includes:
- **Default Rate by Credit Score:** Shows inverse relationship between credit quality and default risk
- **Default Rate by DTI Ratio:** Demonstrates impact of debt burden on loan performance
- **Default Rate by Employment Status:** Compares default rates across employment categories
- **Default Rate by Loan Purpose:** Highlights purpose-based risk variations
- **Risk Segment Summary:** Consolidated view of identified risk tiers
- **Comparative Analysis:** Side-by-side comparison of key risk dimensions

---

## 📈 Key Metrics

| Dimension | Lowest Risk Profile | Description |
|-----------|-------------------|-------------|
| **Credit Score** | >800 (Exceptional) | Highest credit worthiness |
| **DTI Ratio** | <20% (Excellent) | Minimal debt burden |
| **Loan Purpose** | Medical Expenses | Purpose-based risk assessment |
| **Employment Status** | Contract | Employment type analysis |

---

## 📊 Data Summary Statistics

### Loan Applications Dataset:
- **Total Records:** Historical loan applications
- **Key Fields:** Application ID, Loan Amount, Purpose, Default Status, Approval Status
- **Analysis Period:** Historical data covering multiple loan cycles

### Borrower Profiles Dataset:
- **Total Records:** Unique borrower profiles
- **Key Fields:** Credit Score, DTI Ratio, Employment Status, Income, Demographic Information
- **Coverage:** Complete borrower profile information

---

## 💡 Quick Insights from Dashboard

Based on the Power BI visualizations (`visual.png`):
- **Exceptional Credit Scores** show significantly lower default rates
- **Low DTI Ratios (<20%)** correlate with improved loan performance
- **Medical Expense Loans** demonstrate favorable default characteristics
- **Contract Employment** shows the most predictable repayment patterns
- **Risk Stratification** is clearly visible across all four dimensions

---

## 📞 Contact & Questions

For questions or further analysis, please refer to:
- **SQL Documentation:** See comments in `loan_analysis_queries.sql`
- **Data Dictionary:** Review column descriptions in CSV headers
- **Dashboard Insights:** Refer to `visual.png` for visualization details

---

## 🔗 Related Resources

- [BigQuery Documentation](https://cloud.google.com/bigquery/docs)
- [Power BI Documentation](https://docs.microsoft.com/en-us/power-bi/)
- [Data Analysis Best Practices](https://www.analyst-builder.com/)

---

**Last Updated:** May 16, 2026  
**Status:** Analysis Complete | Ready for Implementation  
**Files Included:** CSV Data, SQL Queries, Power BI Visualization, Documentation
