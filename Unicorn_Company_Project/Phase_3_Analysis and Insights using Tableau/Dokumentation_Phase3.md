### Phase 3: Analysen und Erkenntnisse unter Verwendung von Tableau

Um eine bessere übersicht zu bekommen, habe ich die Tabelle in Segmente aufgegliedert

    - Orders
    - Products
    - Customers
    - Financials

Diese habe ich als CSV exportiert und in Tableau importiert.

Um die Daten evtl. auch für eine Datenbank nutzbar zu machen, habe ich zusätzlich entsprechende
Primary und Foreign Keys inkludiert, welche jetzt hier für Tableau keine Rolle spielen.

## Vorgegebene Projektfragen

Die Fragen sind identisch mit denen aus der explorativen Phase 1 in SQL. Die Ergebnisse für
Tableau habe ich per screenshot zur jeweiligen Aufgabe festgehalten.

1. **Welche Stadt im Bundesstaat Tennessee ist am profitabelsten?**

    Die profitabelste Stadt im Staat "Tennessee" = Lebanon

2. **Wie hoch ist der durchschnittliche Jahresgewinn für diese Stadt über alle Jahre hinweg?**

    Der durchschnittliche Jahresgewinn für "Lebanon" beläuft sich über alle Jahre hinweg 
    auf 27,67 USD.  

3. **Welche Produktkategorie ist im Durchschnitt die profitabelste in Iowa über alle Jahre?**

    Für Iowa gibt es nur eine Produktkategorie und das sind die Office Supplies.

4. **Welches Produkt in dieser Kategorie war 2016 in allen Bundesstaaten am beliebtesten?**

    Das populärste Produkt ist Plantronics Voyager Pro DH - Bluetooth Headset

5. **Welcher Monat war insgesamt der profitabelste im Jahr 2018?**

    Der August war in 2018 der profitabelste Monat.

6. **Wie stark variierten die monatlichen Gewinne im Jahr 2018?**
    
    Die Standardabweichung der monatlichen Gewinne im Jahr 2018 beträgt 3.736,62 Dollar.

## Selbst generierte Fragestellungen zur Gewinnung von Erkenntnissen

Basierend auf dem Projekthintergrund ergeben sich  Zwei Kern-Businessfragen:

    1.  Wie kann Unicorn seine profitabelsten Produktkategorien und Standorte ident ifizieren, 
        um diese gezielt zu fördern und das Geschäftswachstum zu maximieren?

    2.  Welche Trends oder Schwachstellen in den Verkaufsdaten (2015–2018) können genutzt werden, um Entscheidungen 
        zur Optimierung von Produktangeboten, Marketingstrategien und operativer Effizienz zu treffen?

Daraus habe ich folgende Aufgabenstellungen abgeleitet:

**Visualisierungen zur Identifikation profitabler Produktkategorien und Standorte**

- **Heatmap (Standorte):** Die Heatmap zeigt, welche Regionen – beispielsweise Städte oder Bundesstaaten – besonders 
    profitabel sind. Farben heben die Unterschiede zwischen profitablen und weniger profitablen Gebieten hervor.  
- **Balkendiagramm (Produktkategorien):** Das Balkendiagramm vergleicht die Profitabilität der verschiedenen Produktkategorien. 
    Die Sortierung nach Profit ermöglicht einen schnellen Überblick, welche Kategorien am stärksten zum Erfolg beitragen.  
- **Trendlinie (Profit nach Region über Zeit):** Mithilfe der Trendlinie wird visualisiert, wie sich der Profit in den 
    Top-Regionen über die letzten Jahre entwickelt hat. Dadurch lassen sich Wachstumschancen und Herausforderungen in bestimmten Regionen identifizieren.  

**Visualisierungen zur Analyse von Trends und Schwachstellen**

- **Zeitleisten-Diagramm (Umsatz/Profit über Zeit):** Das Diagramm stellt dar, wie sich Umsatz und Profit über die Zeit 
    entwickelt haben. Schwankungen und Saisonalitäten können dadurch sichtbar gemacht und in die strategische Planung einbezogen werden.  
- **Treemap (Produktunterkategorien):** Die Treemap zeigt die Umsatz- und Profitverteilung innerhalb einer Produktkategorie. 
    Sie hilft dabei, besonders erfolgreiche Unterkategorien zu identifizieren.  
- **Pareto-Chart (Kundenbeiträge):** Das Pareto-Chart analysiert, welche Kunden oder Kundengruppen den größten Beitrag zum 
    Umsatz oder Profit leisten. Es unterstützt die Bewertung, ob die 80/20-Regel in diesem Fall zutrifft.  

**Interaktive Filter und Parameter**

- **Produktkategorie-/Regionen-Filter:** Filter ermöglichen die Anpassung der Daten nach Kategorien, Regionen oder Jahren. 
    Dadurch können gezielt die gewünschten Informationen analysiert werden.  
- **Zeitbereichs-Schieberegler:** Der Schieberegler erlaubt die Eingrenzung auf spezifische Zeiträume, wie ein bestimmtes 
    Jahr oder Quartal, um gezielte Zeitreihenanalysen durchzuführen.  

**Kombinierte Dashboard-Ansicht**

- **KPIs oben:** Wichtige Kennzahlen wie Gesamtprofit, Umsatzwachstum und die profitabelste Kategorie oder Region werden übersichtlich 
    oben im Dashboard dargestellt, um einen schnellen Überblick zu ermöglichen.  
- **Interaktive Karten:** Karten ermöglichen den Drill-Down von einer nationalen Ebene auf regionale Details und liefern tiefere 
    Einblicke in bestimmte Gebiete.  
- **Vergleichsgrafiken:** Vergleichsgrafiken zeigen nebeneinander profitablere und weniger profitable Kategorien oder Regionen. 
    Unterschiede werden so auf einen Blick ersichtlich.  