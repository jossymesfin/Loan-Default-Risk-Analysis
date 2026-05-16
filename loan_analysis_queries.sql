-- ============================================================================
-- LOAN DEFAULT RISK ANALYSIS - SQL QUERIES
-- ============================================================================
-- Purpose: Comprehensive analysis of loan default patterns
-- Database: ldra40.loan
-- Created: 2026-05-16
-- ============================================================================


-- ============================================================================
-- STEP 1: EXPLORING THE LOAN APPLICATION TABLE
-- ============================================================================

SELECT *
FROM `ldra40.loan.loan_application`
ORDER BY loan_id
LIMIT 1000;


-- ============================================================================
-- STEP 2: EXPLORING THE BORROWER PROFILE TABLE
-- ============================================================================

SELECT *
FROM `ldra40.loan.borrower_profile`
LIMIT 1000;


-- ============================================================================
-- STEP 3: DATA QUALITY CHECKS - IDENTIFYING NULL OR INCOMPLETE VALUES
-- ============================================================================

-- Check for NULL values in Loan Application table
SELECT *
FROM `ldra40.loan.loan_application`
WHERE (loan_id || borrower_id || application_date || loan_purpose || loan_amount ||
       term_months || interest_rate || monthly_payment || dti_ratio || loan_status) IS NULL;


-- Check for NULL values in Borrower Profile table
SELECT *
FROM `ldra40.loan.borrower_profile`
WHERE (borrower_id || age || state || education_level || employment_status ||
       years_employed || annual_income || credit_score || home_ownership ||
       dependents || existing_monthly_debt) IS NULL;


-- ============================================================================
-- STEP 4: CREATE JOINED VIEW - COMBINING LOAN & BORROWER DATA
-- ============================================================================

CREATE OR REPLACE VIEW `ldra40.loan.vw_joned_loan` AS
SELECT
  la.loan_id,
  la.borrower_id,
  la.application_date,
  la.loan_purpose,
  la.loan_amount,
  la.term_months,
  la.interest_rate,
  la.monthly_payment,
  la.dti_ratio,
  la.loan_status,
  la.days_delinquent AS defaulted,
  bp.age,
  bp.state,
  bp.education_level,
  bp.employment_status,
  bp.years_employed,
  bp.annual_income,
  bp.credit_score,
  bp.home_ownership,
  bp.dependents,
  bp.existing_monthly_debt
FROM `ldra40.loan.borrower_profile` bp
JOIN `ldra40.loan.loan_application` la
  ON bp.borrower_id = la.borrower_id;


-- ============================================================================
-- STEP 5: CREATE MASTER RISK ANALYSIS VIEW
-- ============================================================================
-- Analyzes default rates across multiple risk dimensions:
--   1. Credit Score Buckets
--   2. Debt-to-Income (DTI) Ratio
--   3. Employment Status
--   4. Loan Purpose
-- ============================================================================

CREATE OR REPLACE VIEW `ldra40.loan.vw_master_risk_analysis` AS

-- ANALYSIS 1: Credit Score Buckets
SELECT
  'Credit Score' AS metric_type,
  CASE
    WHEN credit_score < 580 THEN '1.Poor'
    WHEN credit_score < 669 THEN '2.Fair'
    WHEN credit_score < 739 THEN '3.Good'
    WHEN credit_score < 799 THEN '4.Very Good'
    ELSE '5.Exceptional'
  END AS score_bucket,
  COUNT(*) AS total_loans,
  SUM(defaulted) AS total_defaults,
  ROUND(AVG(defaulted) * 100, 2) AS default_rate_percentage
FROM `ldra40.loan.vw_joned_loan`
GROUP BY 1, 2

UNION ALL

-- ANALYSIS 2: Debt-to-Income (DTI) Ratio vs Default Rate
SELECT
  'DTI' AS metric_type,
  CASE
    WHEN dti_ratio < 20 THEN '1.Excellent'
    WHEN dti_ratio < 36 THEN '2.Good'
    WHEN dti_ratio < 44 THEN '3.Manageable'
    WHEN dti_ratio < 51 THEN '4.High Risk'
    ELSE '5.Critical'
  END AS dti_bucket,
  COUNT(*) AS total_loans,
  SUM(defaulted) AS total_defaults,
  ROUND(AVG(defaulted) * 100, 2) AS default_rate_percentage
FROM `ldra40.loan.vw_joned_loan`
GROUP BY 1, 2

UNION ALL

-- ANALYSIS 3: Employment Status vs Default Rate
SELECT
  'Employment Status' AS metric_type,
  employment_status,
  COUNT(*) AS total_loans,
  SUM(defaulted) AS total_defaults,
  ROUND(AVG(defaulted) * 100, 2) AS default_rate_percentage
FROM `ldra40.loan.vw_joned_loan`
GROUP BY 1, 2

UNION ALL

-- ANALYSIS 4: Loan Purpose vs Default Rate
SELECT
  'Loan Purpose' AS metric_type,
  loan_purpose,
  COUNT(*) AS total_loans,
  SUM(defaulted) AS total_defaults,
  ROUND(AVG(defaulted) * 100, 2) AS default_rate_percentage
FROM `ldra40.loan.vw_joned_loan`
GROUP BY 1, 2;


-- ============================================================================
-- STEP 6: CREATE FINAL ANALYSIS TABLE
-- ============================================================================

CREATE OR REPLACE TABLE `ldra40.loan.loan_analysis_final` AS
SELECT *
FROM `ldra40.loan.vw_master_risk_analysis`;


-- ============================================================================
-- STEP 7: VIEW FINAL RESULTS
-- ============================================================================

SELECT *
FROM `ldra40.loan.loan_analysis_final`;
