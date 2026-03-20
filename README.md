# indian_aviation_analysis

## 1. Executive Summary
This project analyzes over 300,000 flight records to understand how flight prices are determined in the Indian aviation market. Using PostgreSQL for data cleaning and processing and Power BI for reporting, the raw data was cleaned and structured into useful insights.

The analysis helps explain how factors such as transit cities, flight class, and duration affect ticket prices, reducing uncertainty around pricing.

The key outcome is a set of data-driven insights that highlight the best booking times and regional price differences, helping airlines improve pricing strategies and enabling travellers to find better deals.

## 2. Project Overview

This project focuses on the Indian aviation market, where pricing is highly dynamic, and profit margins are tight. It aims to help airlines and travel platforms better understand how flight prices are determined and improve decision-making.

Airlines often change prices based on factors like routes, seat availability, and class, but the data is usually scattered and hard to analyze. This project brings over 38,000 flight records into a single structured dataset to provide a clear view of pricing patterns.

The main value of this project is turning raw data into actionable insights. It helps identify airline performance, understand the impact of transit routes on pricing, and determine the best booking times, ultimately improving both business strategy and customer experience.

## 3. Data Source

3. Data Source

The analysis is based on a large-scale transactional dataset sourced from Kaggle, originally split into two separate entities. This structure reflects real-world aviation systems where premium and budget segments are often managed independently.

**The Economy Segment:** 206,774 records covering carriers such as SpiceJet, IndiGo, and AirAsia.

**The Business Segment:** 93,487 records covering full-service carriers such as Vistara and Air India.

**Total Master Dataset:** A combined total of 300,261 records analyzed across 11 core variables.

**Temporal Coverage:** The data spans a 50-day period across February and March, providing a high-density snapshot of late-winter travel patterns.

## 4. Problem Statement

### What is the problem?

The aviation market faces pricing opacity, where it is difficult for travelers and businesses to clearly understand how flight prices are determined or what factors drive price changes, such as duration, stopovers, or timing.

### Why is it important?

**Revenue Management:** Poor pricing can lead to empty seats or lost revenue for airlines.

**Consumer Decisions:** Clear pricing insights help travelers make cost-effective choices.

**Market Competition:** Smaller airlines can use pricing insights to compete more effectively with major carriers like Vistara and Air India.

### What questions are we trying to answer?

**The Class Gap:** How does pricing differ between Economy and Business class across airlines?

**The Timing Factor:** Does departure time (morning vs. night) affect ticket prices?

**The Stopover Premium:** How much more do passengers pay for direct flights compared to 1-stop flights?

## 5. Tools & Methodology

**Tools Used:** PostgreSQL & Power BI.

### Technical Workflow

**I. Data Inspection & Cleaning**

* **Schema Design:** Created structured schemas to separate Economy and Business datasets before merging.

* **Type Conversion:** Converted price into a numeric format by removing symbols and text to enable analysis.

* **Data Standardization:** Cleaned and standardized the stop field to represent values consistently (e.g., 0 for non-stop, 1 for one-stop).

* Missing & Inconsistent Data Handling: Checked for null or inconsistent values and ensured data quality before analysis.

**II. Feature Engineering**

* **Duration Normalization:** Converted time_taken (e.g., "2h 10m") into a numeric duration_minutes field for easier comparison and analysis.

* **Class Labeling:** Created a clear airline_class field to separate Economy and Business segments.

* **Derived Metrics:** Generated additional fields such as price per minute and route-level summaries to support deeper insights.

**III. Data Integration & Transformation**

* **Table Union:** Used UNION ALL to combine cleaned Economy and Business tables into a single master dataset.

* **Data Structuring:**  Ensured a consistent schema across all records for reliable analysis.

**IV. Advanced Analytics**

* **Aggregations:** Used functions like AVG(), MIN(), and MAX() to analyze pricing trends across airlines and routes.

* **Window Functions:** Applied RANK() and similar functions to compare airline pricing and identify top and bottom performers.

* **Segmentation:** Grouped data by airline, route, class, and stop type to uncover pricing patterns and anomalies.

**V. Validation & Quality Checks**

Verified data consistency after transformation to ensure accurate calculations.

Cross-checked aggregated results to confirm reliability of insights.

**VI. Output & Visualization**

Exported the final dataset to Power BI for visualization.

Built interactive dashboards to communicate insights such as pricing trends, route comparisons, and optimal booking patterns.

## 6. Exploratory Data Analysis (EDA)

The EDA focused on understanding what drives airfare differences across routes, time, and class. The analysis revealed clear patterns in pricing behaviour.

* **I. Class Premium (Business vs Economy)**
Business class fares are consistently high and stable, while Economy fares are more sensitive to booking time and show greater price fluctuation. This reflects different customer segments, with business travelers being less price-sensitive.

* **II. Outliers (Ultra-Budget Flights)**
Some Economy flights with very long durations (15+ hours) were priced below average direct flights. These are typically multi-stop, low-cost routes used to fill seats on less popular connections.

<img width="765" height="462" alt="image" src="https://github.com/user-attachments/assets/d2cf42b0-9d72-4790-b470-8473f9d735fd" />

*Distribution of flight prices based on the number of stops*

* **III. Route Distribution (Hub Dominance)**
Major hubs like Delhi and Mumbai have the highest number of flights and strong price competition, leading to more dynamic pricing. Smaller city routes have fewer flights but higher average prices due to limited competition.

* **IV. Time-Based Trends (Morning Premium)**
Flights departing in the early morning (6:00–9:00 AM) are priced higher, while late-night flights are cheaper. This shows that departure time significantly influences ticket prices.

** **V. Stops vs Price (Unexpected Pattern)**
While more stops are usually expected to lower prices, some 1-stop flights are more expensive than non-stop flights. This happens when the stopover is in a high-demand hub, adding value for passengers and increasing price.

<img width="765" height="461" alt="image" src="https://github.com/user-attachments/assets/50aa41e9-845c-44c5-bb76-8cae4ad105f3" />

*Average Ticket Price by Stop Category*


## 7. Key Insights

### Insight 1: The "Class" Disconnect

* **What happened?:** Business class tickets maintain a high, stable price point (often 6x–9x higher than Economy) regardless of the booking lead time, whereas Economy prices spike significantly within 48 hours of departure.

* **Why did it happen?:** Business travellers are typically corporate-funded and less price-sensitive, valuing flexibility over cost. Economy demand is driven by individual leisure travellers who are highly price-elastic but forced to pay "panic prices" for last-minute travel.

* **Why does it matter?:** Airlines should avoid discounting Business class last-minute as it devalues the brand. Instead, they should focus late-stage digital marketing on "last-minute leisure" packages for Economy to capture high-margin urgent travellers.

### Insight 2: The Morning Peak

* **What happened?:** Flights departing in the "Early Morning" window (6:00 AM – 9:00 AM) carry an average 15–20% premium compared to late-night flights on the same route.

* **Why did it happen?:** This is the peak window for "same-day" business travel, where professionals fly out for meetings and return the same evening, creating a high-demand, low-supply environment for those specific slots.

* **Why does it matter?:** Budget carriers can increase their "Load Factor" by aggressively undercutting full-service airlines during the mid-day "lull," attracting price-sensitive travelers who are willing to trade an early start for significant savings.

### Insight 3: The "Stopover" Paradox

* **What happened?:** On several high-traffic routes (e.g., Delhi to Bangalore), 1-stop flights were frequently more expensive than non-stop flights, despite having a much longer total duration.

* **Why did it happen?:** This occurs when the transit hub (like Mumbai) is experiencing a local demand surge, or because the airline is accounting for the increased "block hours" and operational costs of two take-offs and landings.

* **Why does it matter?:** Travel platforms and aggregators should implement "Value Alerts" to notify users when a faster, non-stop flight is actually the cheaper option, as many consumers incorrectly assume that "more stops = more savings."

## 8. Visuals Preview

**Visual Type 1: Power BI report Screenshots**

<img width="676" height="476" alt="Screenshot 2026-03-13 224451" src="https://github.com/user-attachments/assets/1da51d84-3359-49d1-8f11-e2a06708c9a5" />

*Executive Overview of Page*


<img width="685" height="480" alt="Screenshot 2026-03-17 141643" src="https://github.com/user-attachments/assets/652ccbcd-3317-4743-852c-11ee29e02e7b" />

*Time & Operatinal Performance Page*


<img width="738" height="429" alt="image" src="https://github.com/user-attachments/assets/c0743450-b1d4-4142-aaba-ae27e0c0ccd3" />

*Homepage of the Report*


**Visual Type 2: Raw Business Class Table**


<img width="816" height="467" alt="image" src="https://github.com/user-attachments/assets/7ee276c2-2ae6-432e-9b72-c384f2824d35" />

*Raw Business Table*


<img width="1130" height="390" alt="image" src="https://github.com/user-attachments/assets/db3afd7f-2c20-4f04-9770-0142acce3e7f" />

*Cleaned Business Table*


**Visual Type 3: Before and After Cleaning the Economy Table**

<img width="822" height="465" alt="image" src="https://github.com/user-attachments/assets/88bf9ee1-ab78-4cd4-bd43-63ab198afd90" />

*Raw Economy Table*


<img width="1168" height="355" alt="image" src="https://github.com/user-attachments/assets/5e0fa738-f7a8-4160-ba0e-ba411db0df1a" />

*Cleaned Economy Table*


**Visual Type 4: Combined Indian Aviation Table**

<img width="1112" height="166" alt="image" src="https://github.com/user-attachments/assets/3ff42a57-1fbc-4aee-acd7-633862334535" />

**Visual Type 5: SQL query to Create the uncleaned Business and Economy Table**

<img width="317" height="204" alt="image" src="https://github.com/user-attachments/assets/7b1150a2-8c67-4146-90c7-fc60418c72b4" />

*SQL Query for the Uncleaned Business Table*


<img width="330" height="212" alt="image" src="https://github.com/user-attachments/assets/1f590688-71f3-4021-9d2b-585adc2d0c69" />

*SQL Query for the Uncleaned Business Table*


**Visual Type 6: SQL query to create and change the data types of the new Business Table**

<img width="533" height="505" alt="image" src="https://github.com/user-attachments/assets/646f9d4d-0435-4f1b-b0c9-e343980ee26a" />

------------------------------------------------------------------

<img width="353" height="494" alt="image" src="https://github.com/user-attachments/assets/097307c8-9f6d-4867-b91f-ade7cc70c69e" />

------------------------------------------------------------------

<img width="332" height="369" alt="image" src="https://github.com/user-attachments/assets/05fda6e1-b6f6-4753-b4da-65854374f7ae" />

------------------------------------------------------------------

<img width="518" height="277" alt="image" src="https://github.com/user-attachments/assets/bc1a8a6a-29fb-48d5-b564-659e21342322" />

----------------------------------------------------------------------

<img width="413" height="448" alt="image" src="https://github.com/user-attachments/assets/82d09ebd-e542-4289-b13b-c3c8332a8b09" />

----------------------------------------------------------------------

<img width="652" height="432" alt="image" src="https://github.com/user-attachments/assets/ef306e21-8430-45d6-8ecd-08279942ead9" />

**Visual Type: SQL query to create and change the data types of the new Economy Table**

<img width="551" height="516" alt="image" src="https://github.com/user-attachments/assets/faa734b7-c3a6-4899-b01d-aa6ac1b9847c" />

----------------------------------------------------------------------

<img width="367" height="518" alt="image" src="https://github.com/user-attachments/assets/c3ee71e3-2e43-4d1a-93b5-aa1a4f0adb0b" />

----------------------------------------------------------------------

<img width="319" height="376" alt="image" src="https://github.com/user-attachments/assets/27d58ea0-6de7-4bb2-abae-5092a38e0577" />

----------------------------------------------------------------------

<img width="516" height="506" alt="image" src="https://github.com/user-attachments/assets/0aff9acc-73e3-477c-b155-202e3c4bf2f4" />

----------------------------------------------------------------------

<img width="546" height="457" alt="image" src="https://github.com/user-attachments/assets/400fa132-5dfc-4d73-8eed-aa2ed2246dc8" />

**Visual Type: SQL query to create and combine the business and economy table into one table**

<img width="384" height="284" alt="image" src="https://github.com/user-attachments/assets/cbd86a3b-1556-47a5-ad75-3d33734dc852" />

----------------------------------------------------------------------

<img width="727" height="284" alt="image" src="https://github.com/user-attachments/assets/b028bdcc-32f0-43ab-a554-a8885e3195ef" />

**Visual Type 7: SQL Query to carry out exploratory data analysis on the final table**

<img width="654" height="303" alt="image" src="https://github.com/user-attachments/assets/4f9f3519-75a9-4344-ada9-a074d1411d92" />


## 9. Strategic Recommendations

1. Revenue Management & Pricing

Airlines should optimise pricing based on demand patterns. Mid-day flights (11:00 AM – 3:00 PM), which have lower demand, can be discounted to attract price-sensitive travellers. For Business class, airlines like Vistara and Air India should introduce flexible offers such as companion discounts or last-minute upgrades during off-peak days to improve seat occupancy and revenue.

2. Product & Competitive Positioning

Pricing for long-duration 1-stop flights should be adjusted to remain competitive, especially when they are currently priced higher than direct flights. These should be positioned as lower-cost alternatives. Additionally, there is a clear gap between Economy and Business class, creating an opportunity to introduce a “Premium Economy” option to capture mid-range customers.

3. Customer Experience for Aggregators

Travel platforms should improve user experience by highlighting better-value options. For example, when a direct flight is cheaper than a 1-stop option, it should be flagged as a “Smart Choice.” This helps users make faster decisions and increases trust in the platform.

## 10. Limitations & Assumptions

* Timeframe: The data covers only a 50-day period, so it does not capture seasonal trends like holidays or peak travel periods.

* Pricing Assumption: Ticket prices are treated as final costs, although they may exclude extra charges such as baggage or seat selection.

* Missing Data: Key factors like flight occupancy (load factor), which strongly affect pricing, are not included in the dataset.

## 11. Implementation Plan
The final solution is a Power BI dashboard connected to a cleaned PostgreSQL database, enabling real-time monitoring instead of static reporting. This allows stakeholders to easily track pricing trends and make faster decisions.

The dashboard includes interactive filters for airline, routes, and class, making it easy to analyse specific markets and detect pricing differences. It also supports automated price alerts by flagging flights that fall significantly below market averages, helping teams respond quickly to competitor pricing changes.

From an operational perspective, different teams can use the insights directly—Revenue teams can adjust pricing based on demand patterns, while Marketing can time promotions using booking trends. The system is also scalable, as the PostgreSQL backend can handle larger datasets, and new data can be added without disrupting the dashboard.

## 12. Conclusion
This project shows how structured data cleaning and analysis can reveal key pricing patterns in the aviation market. By transforming raw data into a clean SQL dataset, it became possible to clearly identify the main factors driving airfare.

Overall, the analysis provides a practical framework that airlines and travel platforms can use to improve pricing strategies and stay competitive in a fast-changing market.


## 13. Table of Contents
1. [Executive Summary](#1-executive-summary)
2. [Project Overview](#2-project-overview)
3. [Data Source](#3-data-source)
4. [Problem Statement](#4-problem-statement)
5. [Tools & Methodology](#5-tools--methodology)
6. [Exploratory Data Analysis (EDA)](#6-exploratory-data-analysis-eda)
7. [Key Insights](#7-key-insights)
8. [Visuals Preview](#8-visuals-preview)
9. [Strategic Recommendations](#9-strategic-recommendations)
10. [Limitations & Assumptions](#10-limitations--assumptions)
11. [Implementation Plan](#11-implementation-plan)
12. [Technical Skills Summary](#technical-skills-summary)
13. [Conclusion](#12-conclusion)
