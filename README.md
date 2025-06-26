# 🕰️ Timeless Business Insights – Age, Geography, and Industry Endurance

This project explores a global business dataset to uncover the patterns behind business longevity. Using SQL and Python (pandas), it identifies the oldest businesses across continents, highlights data gaps, and examines which business categories tend to stand the test of time.

---

## 📌 Project Objectives

- ✅ Identify the **oldest business on each continent**
- ✅ Count **how many countries per continent lack business data**, including newly added businesses
- ✅ Determine **which business categories last the longest**, grouped by continent

---

## 📁 Data Sources

- **`countries`** – Continent and country mapping  
  Columns: `country_code`, `country_name`, `continent`

- **`businesses`** – Historical business records  
  Columns: `business`, `country_code`, `year_founded`, `category_code`

- **`new_businesses`** – Supplemental dataset for newer businesses  
  Columns: Same as `businesses`

- **`categories`** – Maps category codes to labels  
  Columns: `category_code`, `category`

---

## 🔍 Key Features

### 🏆 Oldest Business per Continent

- Joined `businesses` with `countries`
- Extracted the **oldest business per continent**
- Output stored in:  
  **`oldest_business_continent`**  
  _Columns: `continent`, `country`, `business`, `year_founded`_

### ❌ Missing Business Data by Continent

- Counted countries **with no business records**
- Compared results **before and after including `new_businesses`**
- Output stored in:  
  **`count_missing`**  
  _Columns: `continent`, `countries_without_businesses`_

### 🧭 Enduring Categories by Continent

- Joined all datasets and grouped by `continent` and `category`
- Found **earliest `year_founded`** per group
- Output stored in:  
  **`oldest_by_continent_category`**  
  _Columns: `continent`, `category`, `year_founded`_

---

## 📊 Sample Outputs

### 🌍 Oldest Business Example

| Continent | Country | Business                     | Year Founded |
|-----------|---------|------------------------------|--------------|
| Europe    | Austria | St. Peter Stifts Kulinarium  | 803          |

### 🧮 Missing Business Data

| Continent | Countries Without Businesses |
|-----------|------------------------------|
| Africa    | 22                           |
| Asia      | 11                           |

### 🏛️ Top Enduring Categories

| Continent | Category     | Year Founded |
|-----------|--------------|--------------|
| Asia      | Hospitality  | 705          |
| Europe    | Manufacturing| 803          |

---

## 💻 Tech Stack

- **Python** (pandas) – Data manipulation and aggregation
- **SQL** – Data extraction and joining
- **Jupyter Notebook** – Analysis and prototyping environment
- **DataFrames Used**:
  - `oldest_business_continent`
  - `count_missing`
  - `oldest_by_continent_category`

---

## 🧠 Why This Project?

Understanding what helps a business endure over centuries offers valuable insights for entrepreneurs, investors, and economic historians. This analysis uncovers patterns in geography, industry, and founding history that define business longevity.

---

## 📎 License

This project is for educational and analytical purposes. Feel free to fork and build upon it!

---

Let me know if you'd like a version with badges, links to visualizations, or sample SQL/Code blocks included.
