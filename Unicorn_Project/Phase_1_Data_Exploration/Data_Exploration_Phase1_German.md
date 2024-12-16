# **Phase 1: Data Exploration Process**

## **1. General Approach**

Bevor ich spezifische Fragen zur Datenanalyse beantworte, führe ich eine **erste Datenprüfung** durch. Ziel ist es, die Struktur und Qualität der Daten zu verstehen und mögliche Bereinigungsbedarfe zu identifizieren:

- **Überprüfung auf:**
   - Sonderzeichen  
   - Mehrfachinformationen in einer Spalte  
   - Null-Werte  

- **Prüfung des Spaltenformats:**  
   - **String- und Textwerte**  
   - **Datumswerte**  

---

## **2. Customer Table**

### **Überblick**
- **Anzahl Einträge:** 795  
- **Spalten:**
   - `customer_id`  
   - `customer_name`  
   - `customer_segment`  

### **Kundensegmente**
Die Kunden lassen sich in drei Segmente unterteilen:  
1. **Consumer**  
2. **Corporate**  
3. **Home Office**  

### **Datenintegrität**
- Keine **Null-Werte** vorhanden  
- Keine **doppelten Namen**  
- Konsistente Werte in der Spalte `customer_id`  

### **Datenproblem: `customer_id`**
- Aktuelles Format: **`int8(64)`**  
   - PostgreSQL-Syntaxfehler, da `BIGINT` (`int8`) keine Präzisionsangaben unterstützt.  
   - Ursache: Fehler bei der Datenmigration.  

### **Lösungsvorschlag**
- **`BIGINT`** für Ganzzahlen  
- **`NUMERIC(64,0)`** für exakte numerische Werte  

---

## **3. Order Details Table**

### **Spaltenübersicht**
- `order_details_id`  
- `order_id`  
- `product_id`  
- `quantity`  
- `order_discount`  
- `order_profits`  
- `order_profit_ratio`  
- `order_sales`  

### **Analyseergebnisse**
1. **Anzahl Einträge:** 9.997  
2. **Eindeutige Bestellungen:** 5.013 (`order_id`)  
3. **Aufbau der `order_id`:**  
   - **Ländercode** (z.B. US, CA)  
   - **Jahr** (2015–2017)  
   - **Bestellnummer**  

   **SQL zur Aufteilung:**  
   ```sql
   SELECT 
       SPLIT_PART(order_id, '-', 1) AS country_code,
       SPLIT_PART(order_id, '-', 2) AS year,
       SPLIT_PART(order_id, '-', 3) AS order_number
   FROM order_details;
   ```
4. **Eindeutige Produkte:** 1.850 (`product_id`)  
5. **Null-Werte:** Keine in `order_id`  

---

## **4. Orders Table**

### **Struktur & Analyse**
- **Anzahl Einträge:** 5.013  
- **Spalten:**  
   - `order_id`, `customer_id`, `order_date`, `shipping_city`, `shipping_state`,  
     `shipping_region`, `shipping_country`, `shipping_code`, `shipping_date`, `shipping_mode`  

### **Shipping Insights**
- **Ein Versandland:** Alle Lieferungen betreffen ein einzelnes Land (vermutlich USA).  
- **Regionen, Staaten & Städte:**  
   - Regionen: 4  
   - Staaten: 49  
   - Städte: 531  

### **Versandklassen**
Vier unterschiedliche Versandklassen:  
1. **Second Class**  
2. **Standard Class**  
3. **First Class**  
4. **Same Day**  

### **Datumsformat**
- Format: **YYYY/MM/DD:00.00.00**  
- Relevanz: Nur das Datum, keine Uhrzeit.  

---

## **5. Products Table**

### **Überblick**
- **Anzahl Einträge:** 1.850  
- **Spalten:**  
   - `product_id`  
   - `product_name`  
   - `product_category`  
   - `product_subcategory`  
   - `product_manufacturer`  

### **Analyseergebnisse**
1. **Produktnamen:**  
   - Uneinheitliches Format, teilweise mit Sonderzeichen.  

2. **Produktkategorien:**
   - **3 Hauptkategorien:**  
      - Furniture  
      - Office Supplies  
      - Technology  

   - Aufgeteilt in **17 Unterkategorien**:  
      z.B. Tables, Chairs, Copiers, Paper, Accessories, Binders.  

3. **Hersteller:**  
   - 183 eindeutige Hersteller  

4. **Null-Werte:** Keine  

---

## **Zusammenfassung**

Die Tabellenanalyse bietet einen klaren Überblick über die Datenstruktur und ermöglicht die Identifikation von:  
- **Datenproblemen** (z.B. `customer_id` Format).  
- **Eindeutigen Einträgen** und **Konsistenz** der Daten.  
- **Wichtige Erkenntnisse** zu Bestell-, Versand- und Produktinformationen.  

Diese Ergebnisse bilden die Grundlage für weitere Analysen zu **Bestellverteilung**, **Produktleistung** und **Versandeffizienz**. 🚀  
