# 🏀 Sports Goods Marketing Analysis – Driving Conversions & Engagement

_Analyzing marketing performance and customer feedback to optimize strategies for increased conversions, higher engagement, and improved customer satisfaction._

---

## 📌 Table of Contents
- [Overview](#overview)
- [Business Problem](#business-problem)
- [Dataset](#dataset)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Data Cleaning & Preparation](#data-cleaning--preparation)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [Key Findings](#key-findings)
- [Dashboard](#dashboard)
- [How to Run This Project](#how-to-run-this-project)
- [Final Recommendations](#final-recommendations)

---

## Overview

This project focuses on analyzing **Sports Goods marketing performance** for an online retailer.  
The analysis identifies factors impacting **conversion rates**, **customer engagement**, and **customer satisfaction** to help refine marketing strategies.

The project integrates data from marketing campaigns, customer reviews, and engagement metrics.  
Using **Python**, **SQL**, and **Power BI**, it provides actionable insights to boost ROI and guide data-driven decision-making.

---

## Business Problem

The client, an online sports goods retailer, faced challenges such as:  
- **Reduced Customer Engagement**: Declining website and social media interactions.  
- **Decreased Conversion Rates**: Fewer visitors completing purchases despite increased marketing spend.  
- **High Marketing Costs**: Campaigns failing to deliver expected returns.  
- **Need for Feedback Analysis**: Lack of clear understanding of customer sentiments and pain points.

> **Goal:** Provide a comprehensive analysis to improve marketing strategies, enhance engagement, and increase conversions.

---

## Dataset

The dataset consists of three main sources:

- **Marketing Campaign Data** – Ad spend, impressions, clicks, and conversions.  
- **Customer Engagement Data** – Website visits, clicks, likes, and shares.  
- **Customer Feedback Data** – Ratings, review text, and sentiment information.

All raw data is stored in the `/data/` folder.

---

## Tools & Technologies

- **Python** (Pandas, NumPy, NLTK (Natural Language Toolkit))  
- **SQL** (data extraction, joins, filtering, aggregation)  
- **Power BI** (interactive dashboards and storytelling)  
- **Excel** (data validation and reporting)  
- **GitHub** (version control and project hosting)

---

## Project Structure

```
vendor-performance-analysis/
│
├── README.md
├── .gitignore
├── requirements.txt
├── Vendor Performance Report.pdf
│
├── notebooks/                  # Jupyter notebooks
│   ├── exploratory_data_analysis.ipynb
│   ├── vendor_performance_analysis.ipynb
│
├── scripts/                    # Python scripts for ingestion and processing
│   ├── ingestion_db.py
│   └── get_vendor_summary.py
│
├── dashboard/                  # Power BI dashboard file
│   └── vendor_performance_dashboard.pbix
```

---

## Data Cleaning & Preparation

Steps taken:
- Removed duplicates and irrelevant records.  
- Standardized formats for dates, product names, and categories.  
- Handled missing values:
  - Imputed for numerical data.
  - Replaced or dropped incomplete reviews.  
- Converted review text to structured sentiment scores (positive, negative, neutral).  
- Combined multiple sources into a unified master table.

---

## Exploratory Data Analysis (EDA)

**Key Focus Areas:**

1. **Conversion Trends:**  
   - Highest conversion: **January (18.5%)** driven by seasonal demand and promotions.  
   - Lowest conversion: **May (4.3%)**, signaling weak campaign effectiveness.

2. **Engagement Patterns:**  
   - Peak engagement in **February** and **July**.  
   - Noticeable decline from **August to December**.

3. **Customer Feedback:**  
   - Average rating: **3.7** (below target of 4.0).  
   - **Positive sentiment:** 275 reviews  
   - **Negative sentiment:** 82 reviews  
   - **Mixed sentiment:** 50 reviews

---

## Key Findings

1. **High-performing products** like Ski Boots and Kayaks had strong conversions, especially during peak seasons.  
2. **Declining engagement** in later months due to less engaging content and ineffective calls to action.  
3. **Blog content** generated the highest views but had lower click-through rates.  
4. **Negative reviews** mostly related to delivery delays and product quality issues.  
5. Potential to **convert mixed experiences** into positive ones by addressing recurring complaints.

---

## Dashboard

The Power BI dashboard provides:
- Conversion trends by month and product.
- Engagement metrics (views, clicks, likes).  
- Customer feedback sentiment breakdown.  
- Heatmaps for marketing performance.

<img width="668" height="376" alt="home" src="https://github.com/user-attachments/assets/7e798784-d2f1-41c8-9100-5a5407879532" />


<img width="662" height="372" alt="overview" src="https://github.com/user-attachments/assets/b6a5bc97-00d5-4ebd-abc3-c094f148e014" />


<img width="663" height="374" alt="conversion rate" src="https://github.com/user-attachments/assets/def184ca-d3fe-476f-b070-20da9f6f57ed" />


<img width="662" height="374" alt="social media details" src="https://github.com/user-attachments/assets/e00b1b6b-f469-48a0-b0d6-6635cd612872" />


<img width="662" height="372" alt="customer reviews" src="https://github.com/user-attachments/assets/5e3cd931-ae1c-49de-80df-54cb5f80c147" />


---

<h2><a class="anchor" id="how-to-run-this-project"></a>How to Run This Project</h2>

1. Clone the repository:
```bash
git clone https://github.com/mohana-123/sports_goods_analysis.git
```

3. Load the CSVs and ingest into database:
```bash
python scripts/ingestion_db.py
```

4. Create vendor summary table:
```bash
python scripts/get_vendor_summary.py
```
5. Open and run notebooks:
   - `notebooks/exploratory_data_analysis.ipynb`
   - `notebooks/vendor_performance_analysis.ipynb`
6. Open Power BI Dashboard:
   - `dashboard/vendor_performance_dashboard.pbix`

## Final Recommendations

### **Increase Conversion Rates**
- Focus on high-performing categories with targeted promotions.  
- Run seasonal campaigns during peak demand months.

### **Enhance Engagement**
- Introduce interactive content formats like videos and user-generated content.  
- Optimize calls to action for social media and blogs.

### **Improve Customer Satisfaction**
- Address recurring negative feedback around delivery and quality.  
- Build a follow-up system to resolve mixed experiences.
