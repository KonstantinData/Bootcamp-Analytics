### Dokumentation Phase 2: Datenbereinigung und Exploration mit Tabellenkalkulationen  

1. Import und Kopie der Tabelle  

2. Umbenennung zu "Unicorn_Company_Project_Konstantin Milonas"  

3. Exploration der Tabelle  

   3.1 Extraktion des "Bestelljahres" aus Spalte (B) in Spalte (C):  
   Formel: =MID(B2, 4, 4) als "Bestelljahr"  

   3.2 Formatierung der Datenspalten "Bestelldatum" und "Lieferdatum" im europäischen Datumsformat.  

   3.3 Beobachtung zur Auslassung von "Versandland":  
   Das Projekt geht davon aus, dass die Spalte "Versandland" unnötig ist, da alle Sendungen in die USA gehen. Eine Überprüfung der "Bestell-ID" zeigt jedoch, dass von 5009 eindeutigen "Bestell-IDs" 4195 mit dem Ländercode "CA" beginnen.  

   Mithilfe einer Pivot-Tabelle analysierte ich "Bestell-ID" als Zeile und Wert. Mit COUNTUNIQUE berechnete ich die eindeutigen Bestell-IDs und filterte mit "Beginnt mit CA", um den relativen Anteil dieser Bestell-IDs zu ermitteln.  

   Da keine Informationen wie "Bestellstadt" oder Ähnliches verfügbar sind, ist es naheliegend anzunehmen, dass diese Bestellungen aus Kanada stammen, aber in die USA versendet werden.  

   Ich extrahierte den Ländercode aus dieser Spalte und zeigte den vollständigen Namen als "Bestellstaat" mithilfe der folgenden Formel an:  

   =SWITCH(LEFT(B2, FIND("-", B2) - 1), "CA", "Kanada", "US", "Vereinigte Staaten", "Unbekannt")  

   3.4 Aufteilung der Spalte "Kundenname":  
   Die Spalte "Kundenname" zeigt den vollständigen Namen an, was bei der Suche Probleme verursachen könnte. Daher fügte ich zwei zusätzliche Spalten hinzu, um den Namen aufzuteilen:  

   Nachname:  
   =RIGHTB(F2, LENB(F2) - FIND(" ", F2))  

   Vorname:  
   =LEFTB(F2, FIND(" ", F2) - 1)  

   Anschließend blendete ich die Spalte "Kundenname" aus, um Redundanz zu vermeiden.  

5. Datenbereinigung  

   Bezüglich der Spalte "Bestell-ID" entschied ich in Abschnitt 3.3, dass keine Bereinigung erforderlich ist. Andernfalls würde ich den Stakeholder kontaktieren, um zu bestätigen, ob meine Annahme korrekt ist.  

### Abschluss der zugewiesenen Aufgaben  

1. **Welche Stadt hatte die höchsten Verkäufe?**  

   New York City  

2. **Wie hoch ist der durchschnittliche Rabatt für alle Bestellungen?**  

   Durchschnittlicher Rabatt für alle Bestellungen = 15,62 %  

3. **Welches Produkt ist bei Kunden im Segment "Consumer" am beliebtesten?**  

   Das beliebteste Produkt im Segment "Consumer" sind **Heftklammer-Umschläge**  

4. **Wie hoch ist der Gesamtgewinn für die Kategorie "Bürobedarf"?**  

   Der Gesamtgewinn beträgt 122474  

5. **Wer ist der Kunde mit den meisten Bestellungen?**  
   *(Hinweis: Verwenden Sie die Spalte "Bestell-ID", um diese Frage zu beantworten.)*  

   Der Kunde mit den meisten Bestellungen ist Sean Miller mit der Kunden-ID CA-2015-145317  

6. **Welcher Staat hat den höchsten Gewinn erzielt?**  

   Der Staat Kalifornien erzielte 76368 an Verkäufen  

7. **Wie viele Bestellungen wurden über die Versandart "Standard Class" versendet?**  

   5968 Bestellungen wurden über "Standard Class" versendet  

8. **Welche Region hatte im Juni die höchsten Verkaufszahlen?**  

   Die Region "West" erzielte im Juni die höchsten Verkaufszahlen mit 55953  

9. **Berechnen Sie den Stückpreis für jedes Produkt (vor Rabatt) und fügen Sie ihn in eine separate Spalte ein.  
   Welches Produkt ist das teuerste? Hinweis: Verwenden Sie die Spalten Menge, Umsatz und Rabatt.**  

   Es gibt bereits eine Spalte für den Stückpreis, aber da nicht ersichtlich ist, ob der Preis vor oder nach Rabatt angegeben ist, müssen wir ihn basierend auf dem Umsatzwert berechnen.  

   Dazu erstellte ich ein berechnetes Feld in der Pivot-Tabelle und gab folgende Formel ein:  

   =IF(Discount = 1, Sales / Quantity, (Sales / Quantity) / (1 - Discount))  

   **Erläuterung der Formel**  

   Die Formel berechnet den Stückpreis entweder direkt aus Umsatz und Menge, wenn der Rabatt 100 % beträgt, oder rekonstruiert den ursprünglichen Stückpreis vor Rabatt, indem der rabattierte Stückpreis durch den verbleibenden Prozentsatz geteilt wird.  

   Der erste Teil der Formel stellt sicher, dass keine NULL-Werte vorhanden sind.  

10. **Erstellen Sie eine Pivot-Tabelle, die die Gesamteinnahmen für jede Kombination aus Hersteller und Kategorie anzeigt.  
      In der Kategorie "Technologie", welcher Hersteller hatte die zweithöchsten Verkaufszahlen?**  

      Canon hatte mit 107506 die höchsten Gesamteinnahmen in der Kategorie "Technologie".  

11. **Welcher Unterkategorie gehört "Xerox 1887" an?**  

      Die Unterkategorie ist Papier.  

12. **Erstellen Sie eine neue Spalte, die die Anzahl der Tage zwischen dem Bestelldatum und dem Lieferdatum für jede Bestellung berechnet.  
      Erstellen Sie eine bedingte Formatierung "Farbskala" für diese Spalte von grünlich bis rötlich.**  

      Das Ergebnis ist im Ordner "screenshots_answers_Spreadsheet_Questions" dargestellt.  

13. **Wie viele Tage liegen zwischen Bestelldatum und Lieferdatum für die Bestell-ID "CA-2015-100363"?**  

      Die Anzahl der Tage beträgt 5.  

14. **Wie hoch sind die Versandkosten für die Bestell-ID "CA-2015-100678"?**  

      Die Versandkosten betragen 11,99.  

15. **Erstellen Sie eine neue Spalte, die den Kundenname, die Stadt und den Staat für jede Bestellung zu einem einzigen String zusammenfügt.**  

      Das Ergebnis ist im Ordner "screenshots_answers_Spreadsheet_Questions" dargestellt.  

```md
16. **Verwenden Sie die IFS-Funktion, um eine neue Spalte zu erstellen, die jede Bestellung anhand von Gewinn- 
      und Umsatzkriterien als"High", "Low" oder "Loss" kategorisiert.**

   **"High"** wird definiert als:
      - Wenn der Umsatz über 200 liegt und der Gewinn über 20
      - Wenn der Gewinn über 40 liegt.
   
      Für andere Fälle:
      - Wenn der Gewinn gleich oder kleiner als 0 ist, wird dies als „Loss“ kategorisiert.
      - Alle anderen Fälle werden als "Low" kategorisiert.

      `Das Ergebnis wird im Ordner "screenshots_answers_Spreadsheet_Questions" angezeigt.´

16.1 **Verwenden Sie die bedingte Formatierung, um die Spalten mit den Werten „High“ in Grün, „Low“ in Gelb und „Loss“ in Rot zu färben.**

      `Das Ergebnis wird im Ordner "screenshots_answers_Spreadsheet_Questions" angezeigt.´

16.2  **Wie viele „Loss“-Fälle gibt es?**

      `Es gibt 2029 Loss-Fälle.´

16.3  **Erstellen Sie in einem neuen Blatt ein Dropdown-Menü mit Kategorie und Produkt, das den Preis pro Einheit zurückgibt 
      (wie Sie eszuvor in Übung 9 gelöst haben).**

16.3.1**Um die Arbeit zu erleichtern und das Layout übersichtlicher zu gestalten, definieren Sie zunächst "benannte Bereiche" für jede
      Spalte, die Sie verwenden – Produktname, Kategorie, Preis pro Einheit.**

      `Benannte Bereiche wurden für folgende Spalten erstellt: Kategorie, Produktname und Preis pro Einheit vor Rabatt. Diese benannten Bereiche können jetzt in einem neuen Blatt verwendet werden, um Suchwerkzeuge wie Dropdown-Menüs, Filter, INDEX-Funktionen und mehr zu erstellen.´

16.3.2 **Erstellen Sie ein Dropdown-Menü für Kategorien:**

      - Verwenden Sie zur Datenvalidierung eine separate Zelle, um ein Dropdown-Menü für Kategorien zu erstellen, und nutzen Sie die Spalte „Kategorie“ in Ihren Daten als Quelle. In den Kriterien für die Datenvalidierung verwenden Sie „Dropdown (aus einem Bereich)“ und geben den benannten Bereich für Ihre Kategorie-Spalte ein.

      `Ich habe ein neues Blatt mit dem Namen vs02_16.3 - 16.5 erstellt. Mithilfe der Datenvalidierung habe ich ein Dropdown-Menü mit den in dem zuvor erstellten benannten Bereich „Kategorie“ definierten Kriterien erstellt.´

16.3.3 **Verwenden Sie auf einem separaten Blatt die Funktion „FILTER“, um die Produkte basierend auf der ausgewählten Kategorie zu filtern
      Erstellen Sie hierfür auch einen benannten Bereich.**

      `Für eine bessere Darstellung habe ich kein zusätzliches Blatt erstellt. Stattdessen habe ich eine Spalte mit dem Titel „Pre-Filter für Produktnamen nach Kategorie“ auf dem Blatt „vs02_16.3 - 16.5“ hinzugefügt.´

      ```excel
      =FILTER(Product_Name, Category = A2)
      ```

      `Diese Formel füllt die Spalte „Pre-Filter für Produktnamen nach Kategorie“ mit den Produktnamen, die der aus dem Dropdown-Menü ausgewählten Kategorie entsprechen.´

16.3.4 **Erstellen Sie ein Dropdown-Menü für Produktnamen basierend auf der ausgewählten Kategorie und verwenden Sie den benannten Bereich
         den Sie auf dem separaten Blatt erstellt haben.**

      `Ich hätte einen weiteren benannten Bereich in der Spalte „Pre-Filter für Produktnamen nach Kategorie“ erstellen können, habe jedoch stattdessen den Bereich ='vs02_16.3 - 16.5'!$E2:$E verwendet, um das Dropdown-Menü zu erstellen.´

      `"Wichtiger Hinweis: Wenn die Kategorie geändert wird, erscheint ein Fehler in der Spalte „Produktname“, der darauf hinweist, dass die Eingabe innerhalb des erforderlichen Bereichs liegen muss. Dieser Fehler verschwindet, sobald eine Auswahl aus der aktualisierten Dropdown-Liste für Produktnamen getroffen wird."´

16.3.5 **Verwenden Sie die INDEX MATCH-Funktion, um den entsprechenden Preis pro Produkteinheit zu finden. Sie können diese Struktur
         verwenden:**

      ```excel
      =INDEX(Unit_Price_before_Discount; VERGLEICH(B2;Product_Name; 0))
      ```

      `Diese Formel zeigt den Preis des „Produktnamens“ an. In diesem Fall habe ich mich entschieden, den Preis vor Rabatt anzuzeigen.´
      ```