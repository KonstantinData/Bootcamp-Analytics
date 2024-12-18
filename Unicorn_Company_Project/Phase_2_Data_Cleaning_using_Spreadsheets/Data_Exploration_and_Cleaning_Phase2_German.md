# 📝 **Analyse mit Tabellenkalkulationen**

---

## 📁 **Projektdaten**  
Die Tabelle im CSV-Format wurde auf Grundlage der 20 explorativen Fragen aus Phase 1 erstellt.  
Alle in den Abfragen berücksichtigten Spalten bilden die Basis für diese Datei.

---

## 🔎 **Einleitung**  

Dieses Projekt konzentriert sich auf die Nutzung von **Google Spreadsheets** für die Datenanalyse. Bevor eine ungeleitete Datenexploration durchgeführt wurde, habe ich mehrere strukturierte Fragen bearbeitet, um umsetzbare Erkenntnisse abzuleiten. Die Fragen wurden entweder im Team oder individuell bearbeitet, wobei die angewandten Methoden dokumentiert wurden.

Die Aufgabe umfasste auch die Identifizierung der wichtigsten **Unterschiede zwischen Datenbanken und Tabellenkalkulationen**:

### 📊 **Unterschiede zwischen Datenbank- und Tabellenkalkulationsspalten**  
- **Fehlende Spalten in der Tabellenkalkulation**:  
   - `Customer_id`: Namen der Kunden in jeder Zeile machten IDs überflüssig.  
   - `Shipping_postal_code`: Wurde als nicht essenziell betrachtet, da die Bestellungen bereits versendet wurden.  
   - `Shipping_country`: Alle Bestellungen kamen aus den USA.  
   - `Order_details_id`: Die Details pro Zeile machten diese Spalte überflüssig.  
   - `Product_id`: Spezifische Produkte wurden in jeder Zeile beschrieben.  

- **Zusätzliche Spalte in der Tabellenkalkulation**:  
   - `Shipping_price`: Nach dem Versand zur weiteren Analyse hinzugefügt.  

Diese Unterschiede verdeutlichen, wie sich relationale Datenbanken und Tabellenkalkulationen bei der Verwaltung und Visualisierung von Daten unterscheiden.

---

## 🏎️ **Beantwortete Fragen**

1. **Welche Stadt hatte den höchsten Umsatz?**  
2. **Wie hoch ist der durchschnittliche Rabatt für alle Bestellungen?**  
3. **Welches Produkt ist bei Kunden im Segment „Consumer“ am beliebtesten?**  
4. **Wie hoch ist der Gesamtgewinn für die Kategorie „Office Supplies“?**  
5. **Welcher Kunde hat die meisten Einkäufe getätigt?**  
6. **Welcher Bundesstaat erzielte den höchsten Gewinn?**  
7. **Wie viele Bestellungen wurden über die Versandart „Standard Class“ versendet?**  
8. **Welche Region hatte den höchsten Umsatz im Juni?**  
9. **Berechne den Preis pro Einheit für jedes Produkt (vor Rabatten).**  
    - *Was ist das teuerste Produkt?*  
10. **Erstelle eine Pivot-Tabelle für den Gesamtumsatz nach Hersteller und Kategorie.**  
    - *Welcher Hersteller hatte die zweithöchsten Umsätze in „Technology“?*  
11. **Was ist die Unterkategorie von „Xerox 1887“?**  
12. **Wie viele Tage liegen zwischen Bestell- und Versanddatum? Füge bedingte Formatierung (Farbskala) hinzu.**  
13. **Wie viele Tage beträgt der Unterschied für die Bestell-ID „CA-2015-100363“?**  
14. **Wie hoch ist der Versandpreis für die Bestell-ID „CA-2015-100678“?**  
15. **Erstelle eine Spalte, die Kundenname, Stadt und Bundesstaat zu einer einzigen Zeichenkette kombiniert.**  
16. **Kategorisiere Bestellungen mithilfe der IFS-Funktion als „High“, „Low“ oder „Loss“ basierend auf Gewinn und Umsatz.**  
    - *Füge bedingte Formatierung hinzu*:  
      - High → Grün  
      - Low → Gelb  
      - Loss → Rot  
    - *Wie viele „Loss“-Fälle gibt es?*  
17. **Erstelle eine Dropdown-Liste für Kategorie und Produkt, um dynamisch Stückpreise anzuzeigen.**  

---

## 📊 **Erweiterte Einblicke (Optional)**  
- Erstelle ein Dashboard für den Gesamtumsatz, Gewinn und den durchschnittlichen Rabatt nach Region.  
- Entwickle ein monatliches Analysetool mit Visualisierungen für Umsatz und Gewinnmargen.  
- Baue ein dynamisches „Gewinn pro Jahr“-Dashboard mit:  
    - Den profitabelsten und am wenigsten profitablen Unterkategorien.  
    - Den besten und schlechtesten Kunden.  
    - Schlüsselkennzahlen: Summe von positiven/negativen Gewinnen, Bestellanzahlen.  
    - Histogrammen und Liniendiagrammen für monatliche Gewinne.  

---

## 🧰 **Werkzeuge und Methoden**  
- **Tabellenkalkulationsfunktionen**: IFS, INDEX MATCH, FILTER, bedingte Formatierung.  
- **Pivot-Tabellen**: Zur Aggregation und Zusammenfassung von Daten.  
- **Benannte Bereiche**: Für dynamische Dropdowns.  
- **Dynamische Dashboards**: Zur Visualisierung von Trends und KPIs.  

---

## 📎 **Ergebnisse**  
- Link zu Google Spreadsheet mit Antworten, neuen Spalten und Pivot-Tabellen.  
- Eine detaillierte Erklärung der Methoden, die für jede Frage angewandt wurden.  
