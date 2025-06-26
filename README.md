# 🏛️ Business Longevity & Economic Coverage – A Global SQL Analysis

This project investigates business longevity across continents, identifies gaps in business data, and reveals which categories stand the test of time. Through SQL queries, we uncover the **oldest registered businesses**, **highlight countries without data**, and **analyze enduring business sectors**.

---

## 📌 Project Objectives

- Determine the **oldest businesses** on each continent  
- Identify **countries lacking business registration data**, even after including new sources  
- Uncover which **business categories** have survived the longest historically  

---

## 📁 Data Source

Relational database including the following tables:

- `businesses`: Core business data (name, founding year, country)  
- `new_businesses`: Supplementary newer business registrations  
- `countries`: Contains country names, continent, and codes  
- `categories`: Business sector/category info  

---

## 🔍 Key Features & SQL Queries

### 🏆 1. Oldest Business Per Continent  
**Query Name**: `oldest_business_by_continent`

```sql
SELECT 
  continent, 
  country, 
  business, 
  year_founded 
FROM (
  SELECT 
    continent, 
    country, 
    business, 
    year_founded,
    ROW_NUMBER() OVER(PARTITION BY continent ORDER BY year_founded) AS oldest_business
  FROM businesses b
  JOIN countries c ON b.country_code = c.country_code
) AS sub
WHERE oldest_business = 1;
```

---

### 🌍 2. Data Coverage Gaps by Continent  
**Query Name**: `countries_missing_business_data`

```sql
SELECT 
  c.continent,
  COUNT(DISTINCT c.country_code) AS countries_without_businesses
FROM countries c
LEFT JOIN (
  SELECT country_code FROM businesses
  UNION
  SELECT country_code FROM new_businesses
) b ON c.country_code = b.country_code
WHERE b.country_code IS NULL
GROUP BY c.continent;
```

---

### 🕰️ 3. Most Enduring Business Categories  
**Query Name**: `longest_surviving_categories_by_continent`

```sql
SELECT 
  continent, 
  category, 
  MIN(year_founded) AS year_founded
FROM businesses b 
JOIN countries c ON b.country_code = c.country_code
JOIN categories t ON b.category_code = t.category_code
GROUP BY continent, category
ORDER BY continent, category;
```

---

## 📊 Sample Insights

- 🕵️ Oldest known businesses include multi-century operations in Europe and Asia  
- 🌐 Several continents still have **untracked or under-reported countries**  
- 🏺 Categories such as **textiles, food production**, and **publishing** show impressive longevity  

---

## 💻 Tech Stack

- **SQL** (PostgreSQL / MySQL) – Core querying and analysis  
- **Relational Schema** – Structured business & country data  
- **Optional Visualization** – Power BI or Tableau for dashboards  

---

## 🧠 Why This Project?

Understanding historical business resilience and economic data gaps can:

- Support **global economic studies**  
- Inform **policy and development programs**  
- Guide **business historians and researchers** on long-term industry sustainability
