# Olist E-Commerce: Installment Economics and Consumer Purchasing Behavior

> **📌 Snapshot Summary**  
> An end-to-end commercial analytics project analyzing **96,455 delivered transactions** on the Brazilian e-commerce platform Olist (2016–2018).  
> * **AOV Expansion:** Financed orders associate with a **+64.1% higher Mean AOV** (197.24 vs. 120.20 BRL) and a **+69.8% higher Median** than full upfront payments.  
> * **Tenure Dynamics:** Financing behaviors bifurcate into two clear segments: **44.6%** cluster in short terms (2–3 installments), while a high-ticket financing peak centers at **10 installments** (10.4%, AOV 414.20 BRL).  
> * **Logistics Dynamics:** Explains an algebraic **Denominator Effect**, demonstrating why absolute shipping cost and relative freight burden display opposite associations with installment adoption.  
> * **Tech Stack:** SQL Server (Views, CTEs) • Python (Pandas, Seaborn) • Power BI (DAX, Interactive Dashboards).

---

## 🎯 Business Context & Objectives

In consumer e-commerce, installment financing serves as a primary liquidity mechanism. This project evaluates empirical patterns between financing options, basket sizes, and purchasing behavior to address four key commercial questions:

1. **Basket Value Differentiation:** How do order values differ between installment and full-payment transactions?
2. **Tenure Dynamics:** How do consumers distribute across installment durations, and how does tenure correlate with ticket size?
3. **Category Adoption:** Which product categories exhibit the highest reliance on installment plans?
4. **Logistics & Geography:** How do regional variations and freight cost structures correlate with payment methods?

*Methodological Note: This analysis identifies empirical associations and behavioral patterns within observational transactional data; it does not claim direct causality or evaluate price elasticity.*

---

## ⚠️ Data Scope & Methodology

### Data Scope
* Restricted exclusively to orders with a **Delivered** status.
* Aggregated payment data at the order level to establish a strict **1 Row = 1 Order** analytical granularity.
* Orders from late 2016 are included in aggregate lifetime metrics, but excluded from the **Monthly AOV Trend** (which covers **January 2017 – August 2018**) to maintain longitudinal baseline stability.

### Payment Classification
* **Installments:** `payment_installments > 1` (split-payment orders)
* **Full Payment:** `payment_installments ≤ 1` (single upfront payments)

### Order-Level Metrics
All AOV and basket size analyses are based on `total_payment_value` aggregated at the order level.

---

## 🛠️ Tech Stack

| Operational Domain | Tools & Technologies |
| :--- | :--- |
| **Data Preparation & Modeling** | SQL Server, T-SQL, CTEs, Database Views |
| **Exploratory Data Analysis** | Python, Pandas, NumPy |
| **Statistical & Data Visualization** | Matplotlib, Seaborn |
| **Business Intelligence** | Microsoft Power BI, DAX Measures |
| **Reporting** | Power BI Interactive Dashboard, PDF Executive Report |

---

# 📊 Key Analytical Insights

## 1. 💰 Installment Financing Associates with Substantially Higher Basket Values

Orders completed through installment financing exhibit higher values across both parametric and non-parametric measures:

| Payment Group | Mean Order Value (AOV) | Median Order Value |
| :--- | :---: | :---: |
| **Installments** | 197.24 BRL | 134.56 BRL |
| **Full Payment** | 120.20 BRL | 79.23 BRL |
| **Difference** | **+64.1%** | **+69.8%** |

* Evaluating both **Mean and Median** confirms that this difference represents a structural behavioral pattern rather than distortion caused by high-value outliers.
* Monthly trend analysis (Jan 2017 – Aug 2018) confirms that installment AOV consistently outpaces full payments across all operational months.

---

## 2. 📆 Two Distinct Financing Behaviors: Short-Term Liquidity (2–3 Installments) vs. High-Ticket Financing (10 Installments)

Installment duration reveals two distinct consumer purchasing patterns:
* **Short-Term Liquidity Management:** 2 installments (24.2%) and 3 installments (20.4%) together account for **44.6%** of all financed volume, primarily serving lower-to-mid ticket everyday purchases.
* **Extended Financing for High-Ticket Orders (10 Installments):** The **10-installment plan** accounts for **10.4% (5,137 orders)**, where Mean AOV surges to **414.20 BRL**—3.2 times higher than the 2-installment baseline (128.38 BRL).

*Business Interpretation:* Financing choices are not randomly distributed. Instead, consumers bifurcate into short-term cash management and extended 10-month plans designed to maintain affordability for high-ticket investments.

---

## 3. 🛍️ Installment Adoption Is Category-Dependent

Financing adoption varies significantly based on product characteristics and ticket size:
* **High-Adoption Categories:** Computers (**78.5%**), Watches & Gifts (**67.4%**), Home Comfort (**65.1%**), Bed, Bath & Table (**63.3%**).
* **Low-Adoption Categories:** Daily consumables and low-ticket convenience goods heavily lean toward full upfront payments.

---

## 4. 🌎 Geographic Variations Across Brazilian States

Installment adoption displays clear regional divergence across Brazil:
* **High Adoption States:** Paraíba (**PB: 63.4%**), Ceará (**CE: 62.9%**), Pernambuco (**PE: 62.7%**).
* **Economic Hub:** São Paulo (**SP: 49.3%**).

These differences reflect regional economic variations and geographic distance from primary logistics hubs.

---

## 5. 🚚 Freight Costs & The Denominator Effect

Evaluating logistics expenses reveals two contrasting perspectives:
* **Absolute Shipping Cost (BRL):** Financing adoption increases monotonically across quartiles (Q1: 40.5% → Q4: 63.1%), as bulkier and higher-value items naturally incur higher nominal freight fees.
* **Relative Freight Burden (% of Order Value):** Financing adoption decreases across quartiles (Q1: 66.5% → Q4: 37.7%).

**🔎 The Denominator Effect:**  
This inverse relationship is driven by an algebraic denominator effect: orders where shipping makes up a high percentage of the total are predominantly low-value purchases that fall below the threshold requiring financing. Freight sensitivity must therefore be evaluated alongside absolute basket value.

---

## 💡 Commercial Recommendations

1. **Prioritize 10-Month Promotional Partnerships:** Focus zero-interest promotions and merchant fee (MDR) negotiations on the 10-month term to capture high-margin, high-ticket baskets.
2. **Category-Specific Checkout Triggers:** Display split-payment messaging on product pages where average item prices exceed typical discretionary spending thresholds (e.g., Computers, Electronics).
3. **Regional Freight Subsidies:** In remote states with high financing adoption (e.g., PB, CE), bundle installment offers with subsidized shipping thresholds to lower friction on high-value carts.

---

## 🖥️ Power BI Dashboard Architecture

The reporting deliverable is structured into a **3-Page Interactive Dashboard**:

### Page 1 — Installment Economics & Customer Behavior
* **KPIs:** Total Orders (96K), Installment Share (51.5%), Full Payment Share (48.5%), AOV Difference (+64.1%).
* **Visuals:** Mean vs. Median Order Value comparison, Monthly AOV Trend (Jan 2017 – Aug 2018).

### Page 2 — Installment Behavior
* **KPIs:** Average Installment Months (4.7), Most Popular Term (2 installments).
* **Visuals:** Order Value by Installment Term, Installment Duration Share, Category Financing Adoption.

### Page 3 — Geography & Cost Drivers
* **KPIs:** Average Freight Burden (16.6%), Highest Adoption State (PB: 63.4%).
* **Visuals:** Adoption Across Brazilian States, Absolute Shipping Cost vs. Relative Freight Burden comparisons.

---

## 📁 Repository Structure

```text
├── sql/
│   └── 01_olist_data_preparation.sql
│
├── notebooks/
│   └── 02_installment_behavior_analysis.ipynb
│
├── dashboard/
│   ├── 03_Olist_Installment_Economics_Dashboard.pbix
│   └── Olist_Installment_Economics_Report.pdf
│
└── README.md
```

---

## ⚙️ Execution Pipeline

### 1. SQL Server — Data Preparation
Execute `01_olist_data_preparation.sql` to clean transaction tables, aggregate records from item to order level, and generate production Database Views.

### 2. Python — Exploratory Data Analysis
Open `02_installment_behavior_analysis.ipynb` in Jupyter Notebook or Google Colab to validate data quality (1 Row = 1 Order), calculate descriptive metrics, examine tenure distributions, and explore behavioral associations.

### 3. Power BI — Business Intelligence Dashboard
Open `03_Olist_Installment_Economics_Dashboard.pbix` to interact with multi-dimensional slicers (State, Product Category, Purchase Month, Payment Method).

### 4. Executive Report
Review `Olist_Installment_Economics_Report.pdf` for a structured presentation designed for executive and non-technical stakeholders.

---

## 🎯 Project Outcome

This project demonstrates an end-to-end data analytics lifecycle:

$$\text{Raw Transaction Data} \rightarrow \text{SQL Modeling} \rightarrow \text{Python EDA} \rightarrow \text{Business Insights} \rightarrow \text{Power BI} \rightarrow \text{Executive Reporting}$$

It highlights the ability to transform granular transactional datasets into **actionable commercial recommendations, systematically interpreting consumer payment behavior across basket value, duration, product mix, geography, and shipping cost structures.**

---

<details>
<summary>🇹🇭 คลิกเพื่อเปิดอ่านฉบับภาษาไทย (Thai Version)</summary>

# Olist E-Commerce: การวิเคราะห์เศรษฐศาสตร์การผ่อนชำระและพฤติกรรมการซื้อของผู้บริโภค

### *Installment Economics & Customer Purchasing Behavior*

> **📌 การสรุปโดยย่อโปรเจค**  
> โปรเจคการวิเคราะห์ข้อมูลเชิงพาณิชย์แบบ End-to-End จากธุรกรรมที่จัดส่งสำเร็จจำนวน **96,455 รายการ** บนแพลตฟอร์มอีคอมเมิร์ซ Olist ในประเทศบราซิล (2016–2018)  
> * **AOV Expansion:** คำสั่งซื้อที่ใช้ระบบผ่อนชำระมีมูลค่าเฉลี่ย (**Mean AOV**) สูงกว่าการจ่ายเต็มจำนวน **+64.1%** (197.24 เทียบกับ 120.20 BRL) และมีค่ามัธยฐาน (**Median**) สูงกว่า **+69.8%**  
> * **Tenure Dynamics:** พฤติกรรมการผ่อนชำระแยกเป็น 2 กลุ่มชัดเจน โดย **44.6%** เน้นงวดสั้น (2–3 งวด) และพบกลุ่มผ่อนระยะยาวสำหรับสินค้ามูลค่าสูงที่ **10 งวด** (10.4%, AOV 414.20 BRL)  
> * **Logistics Dynamics:** อธิบายปรากฏการณ์ **Denominator Effect** ทางคณิตศาสตร์ ที่ส่งผลให้ต้นทุนค่าจัดส่งจริง (Absolute Cost) และสัดส่วนค่าส่งต่อยอดรวม (Relative Burden) มีความสัมพันธ์กับอัตราการผ่อนชำระในทิศทางตรงกันข้าม  
> * **Tech Stack:** SQL Server (Database Views, CTEs) • Python (Pandas, Seaborn) • Power BI (DAX, Interactive Dashboards)

---

## 🎯 บริบทและวัตถุประสงค์ทางธุรกิจ (Business Context & Objectives)

ในธุรกิจอีคอมเมิร์ซ การผ่อนชำระ (Installment Financing) ทำหน้าที่เป็นกลไกสำคัญในการบริหารสภาพคล่องของผู้บริโภค การศึกษานี้จึงมุ่งประเมินความสัมพันธ์ระหว่างตัวเลือกการผ่อนชำระ ขนาดตะกร้าสินค้า และพฤติกรรมการตัดสินใจซื้อ เพื่อตอบคำถามทางธุรกิจ 4 ด้าน:

1. **Basket Value Differentiation:** คำสั่งซื้อที่ผ่อนชำระมีมูลค่าคำสั่งซื้อเฉลี่ย (AOV) แตกต่างจากการจ่ายเต็มจำนวนมากน้อยเพียงใด?
2. **Tenure Dynamics:** ผู้บริโภคกระจายตัวในแต่ละระยะเวลาผ่อนอย่างไร และความยาวของงวดสัมพันธ์กับขนาดของยอดซื้ออย่างไร?
3. **Category Adoption:** หมวดหมู่สินค้าใดมีสัดส่วนการพึ่งพาบริการผ่อนชำระสูงที่สุด?
4. **Logistics & Geography:** โครงสร้างต้นทุนค่าจัดส่งและปัจจัยเชิงภูมิศาสตร์สัมพันธ์กับพฤติกรรมการเลือกวิธีชำระเงินอย่างไร?

*หมายเหตุเชิงระเบียบวิธีวิจัย (Methodological Note): การวิเคราะห์นี้มุ่งชี้ให้เห็นรูปแบบพฤติกรรมและความสัมพันธ์ (Behavioral Association) จากข้อมูลเชิงประจักษ์ ไม่ได้มุ่งเคลมความเป็นเหตุและผลโดยตรง (Causal Relationship) หรือความยืดหยุ่นต่อราคา (Price Elasticity)*

---

## ⚠️ ขอบเขตข้อมูลและระเบียบวิธี (Data Scope & Methodology)

### ขอบเขตข้อมูล (Data Scope)
* วิเคราะห์เฉพาะคำสั่งซื้อที่มีสถานะ **Delivered (จัดส่งสำเร็จ)**
* ยุบรวม (Aggregate) ข้อมูลการชำระเงินให้อยู่ในระดับ Order เพื่อให้โครงสร้างข้อมูลเป็น **1 Row = 1 Order** อย่างแท้จริง
* ข้อมูลปลายปี 2016 มีปริมาณน้อย จึงถูกรวมเฉพาะในการคำนวณภาพรวม แต่ตัดออกจากเส้นกราฟแนวโน้มรายเดือน (**Monthly AOV Trend**) โดยเลือกวิเคราะห์ช่วง **January 2017 – August 2018** เพื่อรักษาเสถียรภาพของเส้นฐานข้อมูล

### การจัดกลุ่มประเภทการชำระเงิน (Payment Classification)
* **Installments:** `payment_installments > 1` (คำสั่งซื้อที่มีการผ่อนชำระ)
* **Full Payment:** `payment_installments ≤ 1` (คำสั่งซื้อที่จ่ายเต็มจำนวนงวดเดียว)

### ฐานการคำนวณ (Order-Level Metrics)
ใช้ `total_payment_value` ในระดับคำสั่งซื้อเป็นฐานในการคำนวณขนาดตะกร้าและ AOV

---

## 🛠️ สแต็กเทคโนโลยี (Tech Stack)

| ด้านการทำงาน | เครื่องมือ / เทคโนโลยีที่ใช้ |
| :--- | :--- |
| **Data Preparation & Modeling** | SQL Server, T-SQL, CTEs, Database Views |
| **Exploratory Data Analysis** | Python, Pandas, NumPy |
| **Statistical & Data Visualization** | Matplotlib, Seaborn |
| **Business Intelligence** | Microsoft Power BI, DAX Measures |
| **Reporting** | Power BI Interactive Dashboard, PDF Executive Report |

---

# 📊 ข้อค้นพบสำคัญทางธุรกิจ (Key Analytical Insights)

## 1. 💰 คำสั่งซื้อแบบผ่อนชำระสัมพันธ์กับมูลค่าตะกร้าสินค้าที่สูงขึ้นอย่างชัดเจน

คำสั่งซื้อที่ใช้ระบบผ่อนชำระมีมูลค่าสูงกว่ากลุ่มที่จ่ายเต็มจำนวนทั้งในเชิงค่าเฉลี่ยและค่ามัธยฐาน:

| กลุ่มการชำระเงิน | มูลค่าเฉลี่ย (Mean AOV) | ค่ามัธยฐาน (Median) |
| :--- | :---: | :---: |
| **Installments (ผ่อนชำระ)** | 197.24 BRL | 134.56 BRL |
| **Full Payment (จ่ายเต็ม)** | 120.20 BRL | 79.23 BRL |
| **ส่วนต่าง (Difference)** | **+64.1%** | **+69.8%** |

* การตรวจสอบร่วมกันระหว่าง **Mean และ Median** ยืนยันว่าส่วนต่างดังกล่าวเป็นโครงสร้างพฤติกรรมจริง ไม่ได้เกิดจากการบิดเบือนของคำสั่งซื้อที่มีมูลค่าสูงผิดปกติ (Outliers)
* แนวโน้มรายเดือน (Jan 2017 – Aug 2018) สะท้อนว่า AOV ของกลุ่มผ่อนชำระรักษาระดับสูงกว่ากลุ่มจ่ายเต็มอย่างสม่ำเสมอในทุกช่วงเวลา

---

## 2. 📆 พฤติกรรมการผ่อนชำระแยกเป็น 2 กลุ่มชัดเจน: เน้นงวดสั้น (2–3 งวด) และงวดระยะยาวสำหรับสินค้ามูลค่าสูง (10 งวด)

การกระจายตัวของระยะเวลาผ่อนชำระสะท้อนพฤติกรรมผู้บริโภคที่แบ่งออกเป็น 2 กลุ่มอย่างชัดเจน:
* **กลุ่มเน้นงวดสั้นเพื่อจัดการสภาพคล่อง:** การผ่อน 2 งวด (24.2%) และ 3 งวด (20.4%) รวมกันคิดเป็น **44.6%** ของคำสั่งซื้อแบบผ่อนทั้งหมด ซึ่งเหมาะกับสินค้าทั่วไปที่ต้องการแบ่งเบาภาระในระยะสั้น
* **กลุ่มงวดระยะยาวสำหรับสินค้ามูลค่าสูง (10 งวด):** พบว่าการผ่อน **10 งวด** มีสัดส่วนสูงถึง **10.4% (5,137 คำสั่งซื้อ)** และมีมูลค่าคำสั่งซื้อเฉลี่ย (AOV) สูงถึง **414.20 BRL** ซึ่งสูงกว่าการผ่อน 2 งวด (128.38 BRL) ถึง 3.2 เท่า

*การตีความทางธุรกิจ:* ผู้บริโภคไม่ได้เลือกงวดแบบกระจายตัวทั่วไป แต่งวด 10 เดือนทำหน้าที่เป็นจุดยึดสำคัญ (Key Financing Anchor) สำหรับสินค้าชิ้นใหญ่เพื่อช่วยบริหารความสามารถในการจ่าย

---

## 3. 🛍️ สัดส่วนการผ่อนชำระมีความเฉพาะเจาะจงตามหมวดหมู่สินค้า

การเลือกผ่อนชำระขึ้นอยู่กับลักษณะและมูลค่าของหมวดสินค้าอย่างเห็นได้ชัด:
* **หมวดหมู่ที่พึ่งพาการผ่อนชำระสูง:** Computers (**78.5%**), Watches & Gifts (**67.4%**), Home Comfort (**65.1%**), Bed, Bath & Table (**63.3%**)
* **หมวดหมู่ที่ผ่อนชำระต่ำ:** สินค้าอุปโภคบริโภคทั่วไปและสินค้ามูลค่าต่ำจะเอียงไปทางการจ่ายเต็มจำนวนเกือบทั้งหมด

---

## 4. 🌎 ความผันแปรของการผ่อนชำระในแต่ละรัฐของบราซิล

อัตราการใช้ระบบผ่อนชำระแสดงความแตกต่างเชิงภูมิศาสตร์อย่างชัดเจน:
* **กลุ่มรัฐที่มี Installment Adoption สูง:** Paraíba (**PB: 63.4%**), Ceará (**CE: 62.9%**), Pernambuco (**PE: 62.7%**)
* **รัฐศูนย์กลางเศรษฐกิจ:** São Paulo (**SP: 49.3%**)

ความแตกต่างนี้สะท้อนโครงสร้างทางเศรษฐกิจระดับภูมิภาค รวมถึงผลกระทบจากระยะห่างของเครือข่ายโลจิสติกส์

---

## 5. 🚚 ต้นทุนค่าจัดส่งและปรากฏการณ์ Denominator Effect

เมื่อวิเคราะห์มิติค่าจัดส่ง ได้ผลลัพธ์พฤติกรรมแยกออกเป็น 2 มุมมอง:
* **Absolute Shipping Cost (BRL):** เมื่อแบ่งค่าส่งจริงเป็น Quartiles พบว่าอัตราการผ่อนชำระเพิ่มขึ้นตามค่าส่ง (Q1: 40.5% → Q4: 63.1%) เพราะสินค้าชิ้นใหญ่และราคาสูงมักมีค่าส่งสูงตามไปด้วย
* **Relative Freight Burden (% ต่อยอดบิล):** เมื่อดูสัดส่วนค่าส่งเทียบกับยอดสั่งซื้อรวม กลับพบแนวโน้มตรงกันข้าม (Q1: 66.5% → Q4: 37.7%)

**🔎 กลไก Denominator Effect:**  
ความสัมพันธ์ที่ผกผันนี้เกิดจากผลทางคณิตศาสตร์ของตัวหาร (Total Order Value) เนื่องจากออเดอร์ที่สัดส่วนค่าส่งดูสูง (% สูง) มักเป็นตะกร้าที่สินค้ามีมูลค่าต่ำ ซึ่งยอดรวมน้อยเกินกว่าที่ผู้บริโภคจะเลือกผ่อนชำระ การประเมินความอ่อนไหวต่อค่าส่งจึงต้องดูควบคู่กับมูลค่าสินค้าเสมอ

---

## 💡 ข้อเสนอแนะเชิงกลยุทธ์ทางธุรกิจ (Commercial Recommendations)

1. **โฟกัสแคมเปญดอกเบี้ย 0% ร่วมกับธนาคารที่งวด 10 เดือน:** เจรจาอัตราค่าธรรมเนียมการรับบัตร (MDR) และร่วมมือกับสถาบันการเงินจัดโปรโมชันสำหรับงวด 10 เดือนเป็นหลัก เพื่อดึงดูดกลุ่มตะกร้าสินค้ามูลค่าสูง (High-ticket items)
2. **ตั้งเกณฑ์กระตุ้นการผ่อนชำระตามระดับราคาของแต่ละหมวด:** สำหรับหมวดหมู่อย่าง Computers และ Home Electronics ควรแสดงข้อความโปรโมตยอดผ่อนต่องวดตั้งแต่หน้าแสดงสินค้าทันทีที่ราคาสูงเกินเกณฑ์เฉลี่ย เพื่อลดแรงต้านในการตัดสินใจซื้อ
3. **ผูกโปรโมชันผ่อนชำระร่วมกับการอุดหนุนค่าส่งในพื้นที่ห่างไกล:** ในรัฐทางภาคตะวันออกเฉียงเหนือ (เช่น PB, CE) ที่มี Adoption การผ่อนสูงแต่มีภาระค่าจัดส่งจากระยะทาง การจัดแพ็กเกจ "ผ่อนสบาย + ค่าส่งเรทพิเศษ" จะช่วยปิดการขายออเดอร์ขนาดใหญ่ได้มีประสิทธิภาพยิ่งขึ้น

---

## 🖥️ สถาปัตยกรรมแดชบอร์ด Power BI (Dashboard Architecture)

แดชบอร์ดแบบโต้ตอบ (Interactive Dashboard) ขนาด 3 หน้า:

* **Page 1 — Installment Economics & Customer Behavior**
  * *KPIs:* Total Orders (96K), Installment Share (51.5%), Full Payment Share (48.5%), AOV Difference (+64.1%)
  * *Visuals:* เปรียบเทียบ Mean vs. Median Order Value และแนวโน้มรายเดือน Monthly AOV Trend (Jan 2017 – Aug 2018)
* **Page 2 — Installment Behavior**
  * *KPIs:* Average Installment Months (4.7 งวด), Most Popular Term (2 งวด)
  * *Visuals:* มูลค่าออเดอร์ตามระยะเวลางวด, สัดส่วนระยะเวลาผ่อน (Duration Share), อัตราการผ่อนรายหมวดสินค้า
* **Page 3 — Geography & Cost Drivers**
  * *KPIs:* Average Freight Burden (16.6%), รัฐที่มีสัดส่วนผ่อนสูงสุด (PB: 63.4%)
  * *Visuals:* แผนที่การผ่อนรายรัฐ, กราฟเปรียบเทียบระหว่าง Absolute Shipping Cost และ Relative Freight Burden

---

## 📁 โครงสร้างโปรเจกต์ (Repository Structure)

```text
├── sql/
│   └── 01_olist_data_preparation.sql
│
├── notebooks/
│   └── 02_installment_behavior_analysis.ipynb
│
├── dashboard/
│   ├── 03_Olist_Installment_Economics_Dashboard.pbix
│   └── Olist_Installment_Economics_Report.pdf
│
└── README.md
```

---

## ⚙️ ขั้นตอนการรันไฟล์งาน (Execution Pipeline)

1. **SQL Server (Data Preparation):**  
   รันสคริปต์ `01_olist_data_preparation.sql` เพื่อเตรียมข้อมูลระดับ Item เข้ากับ Order และสร้าง Database Views
2. **Python (Exploratory Data Analysis):**  
   เปิดไฟล์ `02_installment_behavior_analysis.ipynb` บน Jupyter Notebook หรือ Google Colab เพื่อตรวจสอบ Data Quality, สถิติพรรณนา, วิเคราะห์ความสัมพันธ์เชิงพฤติกรรม และพล็อตกราฟสำรวจสมมติฐาน
3. **Power BI (Business Intelligence):**  
   เปิดไฟล์ `03_Olist_Installment_Economics_Dashboard.pbix` เพื่อวิเคราะห์ข้อมูลเชิงโต้ตอบผ่าน Slicers (รัฐ, หมวดหมู่สินค้า, ช่วงเวลา, รูปแบบการชำระเงิน)
4. **Executive Reporting:**  
   ดูไฟล์ `Olist_Installment_Economics_Report.pdf` เพื่อดูรายงานสรุปผลการวิเคราะห์และข้อเสนอแนะเชิงธุรกิจในรูปแบบ Presentation

---

## 🎯 สรุปผลลัพธ์ของโครงการ (Project Outcome)

โครงการนี้สะท้อนกระบวนการทำงานด้าน Data Analytics อย่างครบวงจรตั้งแต่:

$$\text{Raw Transaction Data} \rightarrow \text{SQL Modeling} \rightarrow \text{Python EDA} \rightarrow \text{Business Insights} \rightarrow \text{Power BI} \rightarrow \text{Executive Reporting}$$

มุ่งเน้นการแปลงข้อมูลธุรกรรมดิบให้กลายเป็น **ข้อมูลเชิงลึกทางธุรกิจที่สามารถนำไปปฏิบัติได้จริง (Actionable Insights)** เพื่ออธิบายพฤติกรรมการใช้จ่ายของผู้บริโภคในมิติมูลค่าคำสั่งซื้อ ระยะเวลางวด หมวดหมู่สินค้า ภูมิศาสตร์ และโครงสร้างค่าจัดส่งอย่างเป็นระบบ
</details>
