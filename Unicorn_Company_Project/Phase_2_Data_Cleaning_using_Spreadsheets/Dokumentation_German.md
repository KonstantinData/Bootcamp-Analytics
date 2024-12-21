### Dokumentation Phase 2: Datenbereinigung und Exploration mit Tabellenkalkulationen  

1. Import und Kopie der Tabelle  

2. Umbenennen in "Unicorn_Company_Project_Konstantin Milonas"  

3. Exploration der Tabelle  

   3.1 Extraktion des "Bestelljahres" aus Spalte (B) in Spalte (C):  
   Formel: `=MID(B2, 4, 4)` als "Bestelljahr"  

   3.2 Formatierung der Datenspalten "Bestelldatum" und "Versanddatum" in das europäische Datumsformat.  

   3.3 Beobachtung zur Auslassung der Spalte "Versandland":  
   Es wird angenommen, dass die Spalte "Versandland" nicht erforderlich ist, da alle Lieferungen in die USA gehen. Bei Überprüfung der "Bestell-ID" zeigt sich jedoch, dass von 5009 verschiedenen "Bestell-IDs" 4195 mit dem Ländercode "CA" beginnen.  

   Mithilfe einer Pivot-Tabelle habe ich "Bestell-ID" als Zeile und Wert analysiert. Durch die Anwendung von `COUNTUNIQUE` habe ich die eindeutigen Bestell-IDs berechnet und einen Filter "Beginnt mit CA" verwendet, um die relative Anzahl dieser Bestell-IDs zu ermitteln.  

   Da keine Informationen zu "Bestellstadt" oder ähnlichem verfügbar sind, ist es naheliegend anzunehmen, dass diese Bestellungen aus Kanada stammen, jedoch in die USA geliefert werden.  

   Ich habe den Ländercode aus dieser Spalte extrahiert und den vollständigen Namen als "Bestellstatus" mit der folgenden Formel angezeigt:  

   `=SWITCH(LEFT(B2, FIND("-", B2) - 1), "CA", "Kanada", "US", "Vereinigte Staaten", "Unbekannt")`  

   3.4 Aufteilung der Spalte "Kundenname":  
   Die Spalte "Kundenname" zeigt den vollständigen Namen an, was bei der Suche nach Daten problematisch sein könnte. Daher habe ich zwei zusätzliche Spalten hinzugefügt, um den Namen aufzuteilen:  

   Nachname:  
   `=RIGHTB(F2, LENB(F2) - FIND(" ", F2))`  

   Vorname:  
   `=LEFTB(F2, FIND(" ", F2) - 1)`  

   Anschließend habe ich die Spalte "Kundenname" ausgeblendet, um Redundanzen zu vermeiden.  

5. Datenbereinigung  

   Für die Spalte "Bestell-ID" habe ich in Abschnitt 3.3 beschlossen, dass keine Bereinigung erforderlich ist. Sollte es dennoch Unklarheiten geben, würde ich Rücksprache mit dem Stakeholder halten, um meine Annahme zu bestätigen.  

### Erfüllung der vorgegebenen Aufgaben  

9. Berechne den Preis pro Einheit für jedes Produkt (vor Rabatten) und füge ihn in einer separaten Spalte ein.  
   Welches ist das teuerste Produkt? Hinweis: Verwende die Spalten Menge (Quantity), Verkäufe (Sales) und Rabatt (Discount).  

   Es gibt bereits eine Spalte "Einheitspreis", aber da sie nicht angibt, ob der Preis vor oder nach einem Rabatt liegt, muss der Einheitspreis auf Basis des Verkaufswertes berechnet werden.  

   Zu diesem Zweck habe ich ein berechnetes Feld in der Pivot-Tabelle erstellt und die folgende Formel eingegeben:  

   `= WENN(Discount = 1, Sales / Quantity, (Sales / Quantity) / (1 - Discount))`  

   **Erklärung der Formel**  

   Die Formel berechnet den Stückpreis entweder direkt aus Umsatz und Menge, wenn der Rabatt 100 % beträgt, oder stellt den ursprünglichen Stückpreis vor Rabatt wieder her, indem der rabattierte Stückpreis durch den verbleibenden Prozentsatz geteilt wird.  

   Der erste Teil der Formel stellt sicher, dass es keine NULL-Werte gibt.  
