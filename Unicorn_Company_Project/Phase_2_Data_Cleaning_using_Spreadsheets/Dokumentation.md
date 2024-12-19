### Dokumentation der Phase 2: Datenbereinigung und Exploration mit Spreadsheets  

1. **Import und Kopie der Tabelle**  

2. **Umbenennung in "Unicorn_Company_Project_Konstantin Milonas"**  

3. **Exploration der Tabelle**  
   3.1 **Extraktion des "Order Jahres" aus Spalte (B) in Spalte (C):**  

   Formel: `=TEIL(B2, 4, 4)` als "Order Year"  

   3.2 **Formatierung der Datumsspalten "Order Date" und "Ship Date" in das europäische Datumsformat.**  

   3.3 **Beobachtung zur Auslassung der Spalte "Shipping Country":**  
   Im Projekt wird angenommen, dass die Spalte "Shipping Country" weggelassen wurde, da alle Lieferungen in die USA gehen. Eine Überprüfung der "Order ID" zeigt jedoch, dass von insgesamt 5009 eindeutigen "Order IDs" 4195 mit der Länderkennung "CA" beginnen.  

   Mithilfe einer Pivot-Tabelle habe ich die "Order ID" als Zeile und Wert analysiert. Mit der Funktion `COUNTUNIQUE` konnte ich die einzigartigen Order IDs berechnen und durch einen Filter "Beginnt mit CA" den relativen Anteil ermitteln.  

   Da keine "Order City" oder ähnliche Angaben vorliegen, ist anzunehmen, dass diese Aufträge aus Kanada stammen und in die USA geliefert werden.  

   Ich habe das Länderkürzel aus der Spalte extrahiert und als vollen Namen unter "Order State" angezeigt:  

   ```excel
   =SWITCH(LEFT(B2, FIND("-", B2) - 1), "CA", "Canada", "US", "United States", "Unbekannt")
   ```  

   3.4 **Aufteilung der Spalte "Customer Name":**  
   Die Spalte "Customer Name" enthält den vollständigen Namen, was bei Suchen zu Fehlern führen kann. Daher habe ich zwei zusätzliche Spalten eingefügt, um den Namen aufzuteilen:  

   - **"Last Name"**:  
     ```excel
     =RIGHTB(F2, LENB(F2) - FIND(" ", F2))
     ```  
   - **"First Name"**:  
     ```excel
     =LEFTB(F2, FIND(" ", F2) - 1)
     ```  

   Die ursprüngliche Spalte "Customer Name" wurde ausgeblendet.  

4. **Bereinigung von Daten**  

   Zur Spalte "Order ID" habe ich unter Punkt 3.3 bereits eine Entscheidung getroffen, dass keine Bereinigung notwendig ist. Andernfalls würde ich Kontakt mit dem Stakeholder aufnehmen, um zu klären, ob meine Annahme korrekt ist.  