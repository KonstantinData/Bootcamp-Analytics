# **Data Lakehouse mit Synology NAS, PostgreSQL und AWS**

## **Projektübersicht**
Dieses Projekt beschreibt die Einrichtung einer **Data Lakehouse-Architektur**, die lokale Speicher- und Verarbeitungskapazitäten auf einer **Synology NAS DS723+** mit der Skalierbarkeit von **AWS-Diensten** kombiniert. 

### **Architekturziele:**
- **Kombinierte Speicherung:** Nutzung der NAS für lokale Daten und AWS S3 für cloudbasierte Datenverwaltung.
- **Datenintegration:** Automatisierte Datenpipelines zwischen NAS und AWS.
- **Analyse und Dashboards:** Erstellung von Visualisierungen in Tableau auf Basis von Daten aus PostgreSQL und AWS S3/Athena.

---

## **Architekturübersicht**

### **Komponenten:**
1. **Synology NAS DS723+:**
   - Lokaler Speicher für strukturierte und semi-strukturierte Daten.
   - Docker-Container für:
     - **PostgreSQL**: Relationale Datenbank für strukturierte Daten.
     - **Apache Airflow**: Verwaltung von ETL-Pipelines.

2. **AWS-Dienste:**
   - **S3**: Skalierbarer Cloud-Speicher für Roh- und verarbeitete Daten.
   - **Glue**: Cloudbasierte ETL-Pipelines.
   - **Athena**: Serverlose SQL-Abfragen direkt auf S3-Daten.

3. **Tableau:**
   - Erstellung von Dashboards und Berichten durch Verbindung zu PostgreSQL (lokal) und AWS Athena (cloudbasiert).

---

## **Datenfluss**

### **1. Datenquellen:**
- CSV- und JSON-Dateien auf der NAS (lokale Rohdaten).
- Cloud-Daten aus APIs oder direkten Uploads in AWS S3.

### **2. Datenverarbeitung:**
- **Lokal (NAS):**
  - Airflow orchestriert ETL-Jobs, die Rohdaten in PostgreSQL laden und transformieren.
- **Cloud (AWS):**
  - AWS Glue verarbeitet Rohdaten in S3 und speichert sie in optimierten Formaten (z. B. Parquet).

### **3. Speicherung und Abfrage:**
- Strukturierte Daten liegen in PostgreSQL (lokal) für BI und Reporting.
- Große Datenmengen und unstrukturierte Daten bleiben in S3 und sind über Athena direkt abfragbar.

### **4. Visualisierung:**
- Tableau verbindet sich mit PostgreSQL (für lokale Analysen) und AWS Athena (für Big Data-Abfragen).

---

## **Setup-Anleitung**

### **1. Synology NAS Setup**
1. **PostgreSQL als Docker-Container installieren:**
   ```bash
   docker run --name postgres-lakehouse \
   -e POSTGRES_USER=admin \
   -e POSTGRES_PASSWORD=your_password \
   -e POSTGRES_DB=lakehouse \
   -v /volume1/docker/postgres:/var/lib/postgresql/data \
   -p 5432:5432 \
   -d postgres
   ```

2. **Datenverzeichnisse erstellen:**
   - `/volume1/lakehouse/raw_data`: Speicherung von Rohdaten.
   - `/volume1/lakehouse/processed`: Bereinigte und transformierte Daten.

3. **Apache Airflow installieren:**
   ```bash
   docker run -d -p 8080:8080 \
   -e AIRFLOW__CORE__LOAD_EXAMPLES=False \
   -v /volume1/docker/airflow:/opt/airflow \
   apache/airflow:latest
   ```

4. **Airflow-ETL-Pipeline erstellen:**
   Beispiel: Lade CSV-Daten in PostgreSQL.
   ```python
   from airflow import DAG
   from airflow.operators.python_operator import PythonOperator
   import pandas as pd
   from sqlalchemy import create_engine

   def load_csv_to_postgres():
       engine = create_engine('postgresql://admin:your_password@NAS-IP:5432/lakehouse')
       df = pd.read_csv('/volume1/lakehouse/raw_data/sales_data.csv')
       df.to_sql('fact_sales', engine, if_exists='replace', index=False)

   dag = DAG('etl_pipeline', schedule_interval='@daily')
   task = PythonOperator(task_id='load_to_postgres', python_callable=load_csv_to_postgres, dag=dag)
   ```

---

### **2. AWS Setup**
1. **S3-Bucket erstellen:**
   - Gehe zu AWS S3 und erstelle einen Bucket (z. B. `lakehouse-bucket`).
   - Unterordner:
     - `raw_data/`: Speicherung von Rohdaten.
     - `processed/`: Transformierte Daten (z. B. Parquet).

2. **Datenintegration mit AWS Glue:**
   - Schreibe ein Glue-Skript, um Rohdaten aus S3 zu bereinigen und in Parquet umzuwandeln.
   - Beispiel:
     ```python
     import pyspark
     from awsglue.context import GlueContext

     glueContext = GlueContext(spark.sparkContext)
     raw_data = glueContext.create_dynamic_frame.from_options(
         connection_type="s3",
         connection_options={"paths": ["s3://lakehouse-bucket/raw_data/"]},
         format="csv"
     )
     processed_data = raw_data.toDF().write.parquet("s3://lakehouse-bucket/processed/")
     ```

3. **SQL-Abfragen mit Athena:**
   - Erstelle eine Athena-Tabelle basierend auf Parquet-Dateien in S3.
   ```sql
   CREATE EXTERNAL TABLE fact_sales (
       SaleID INT,
       ProductID INT,
       CustomerID INT,
       SaleDate STRING,
       Amount DECIMAL(10, 2)
   )
   STORED AS PARQUET
   LOCATION 's3://lakehouse-bucket/processed/';
   ```

---

### **3. Tableau Setup**
1. **Verbindung zu PostgreSQL:**
   - PostgreSQL-Treiber installieren.
   - In Tableau:
     - **Host:** NAS-IP
     - **Port:** 5432
     - **Benutzername:** admin
     - **Passwort:** your_password

2. **Verbindung zu AWS Athena:**
   - ODBC-Treiber für Athena installieren.
   - Verbindung einrichten:
     - **Server:** Athena-Endpoint (z. B. `athena.us-west-1.amazonaws.com`).
     - **Datenquelle:** S3-Bucket mit Parquet-Dateien.

3. **Dashboards erstellen:**
   - Lokale Daten (PostgreSQL) für BI und Reporting.
   - Cloud-Daten (Athena/S3) für Big Data-Analysen.

---

## **Dateistruktur**
```plaintext
lakehouse/
├── raw_data/            # Rohdaten (CSV, JSON)
├── processed/           # Bereinigte und transformierte Daten (Parquet)
├── docker/              # Docker-Container-Konfigurationen
│   ├── postgres/        # PostgreSQL-Daten
│   ├── airflow/         # Airflow-DAGs und Logs
```

---

## **Nächste Schritte**
1. **Synchronisation einrichten:**
   - Nutze **Cloud Sync** auf der NAS, um Daten automatisch zwischen NAS und S3 zu synchronisieren.
2. **ETL-Pipelines erweitern:**
   - Füge zusätzliche Datenquellen (z. B. APIs) hinzu.
3. **Analyse vertiefen:**
   - Erstelle komplexere Dashboards und setze maschinelles Lernen mit Python oder AWS Sagemaker ein.

---

## **Mitmachen**
Gerne kannst du das Projekt forken und eigene Ideen oder Pipelines hinzufügen. Feedback und Pull Requests sind willkommen!

---

### **Autor**
Dieses Projekt wurde von Konstantin Milonas erstellt.  
Kontakt: **[info@condata.io]**

---

### **Lizenz**
Dieses Projekt steht unter der [MIT-Lizenz](LICENSE).
