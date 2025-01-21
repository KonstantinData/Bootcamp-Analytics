import pandas as pd
from pandas.io.formats.format import return_docstring

BodySegmentAnalysis = {"Werte":[52.0, 13.7,4.94,68.1],
                       "Gesamtkörper-wasser":[52, None, None, None],
                       "Weiche Magermasse": [None,66.4,None,None],
                        "Fettfreie Masse": [None,70.6, None, None],
                        "Gewicht": [None, None, 138.7, None]
}

Index = ["Gesamtkörper-Wasser", "Proteine", "Minralien", "Körperfettmasse"]

df = pd.DataFrame(BodySegmentAnalysis, Index)

print(df)

Werte.s


