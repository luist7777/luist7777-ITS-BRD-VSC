# 1. Analyse der Aufgabe #
    - Allgemeines Ziel der Aufgabe:
        - Erstellung eines Assembler Programmes, welches uns alle
          Primzahlen im Zahlenbereich von 2-1000 liefert
    - Verwendung des Algorithmus "Sieb des Eratosthenes" (Das 
      Rausstreichen aller Vielfachen von gefundener Primzahlen)
    - Teile und herrsche Prinzip:
        - Trennung von dem eigentlichen Sieben der Zahlen
          und dem Rausfiltern und Übertragen der Zahlenwerte

# 2. Java Code als Pseudocode #
```java
package Programs.PrimzahlSiebASM.Src;

public class SiebEntwurf {
    private byte[] sieb = new byte[1001];
    private short[] primzahlen = new short[200];

    public void sieben() {
        for (int i = 2; i <= 1000; i++) {
            sieb[i] = 1;
        }

        for (int i = 2; i <= 31; i++) {
            if (sieb[i] == 1) {
                for (int j = i * i; j <= 1000; j += i) {
                    sieb[j] = 0;
                }
            }
        }
    }

    public int abspeichern() {
        int k = 0;

        for (int i = 2; i <= 1000; i++) {
            if (sieb[i] == 1) {
                primzahlen[k] = (short) i;
                k++;
            }
        }
        return k;
    }
}
```

# 3. Erklärung des Codes und teilweise übersetzung in Assembler Code #

## Datenbereich ##
Array 1: "sieb"
	- Reserviert 1001 bytes im Arbeitsspeicher (index 0 bis 1000)
	- Gespeicherter Wert (1 Byte): 1 = Primzahl, 0 = keine Primzahl

Array 2: "primzahlen"
	- Reserviert Speicherplatz für 200 mögliche Primzahlen
	- Jedes Element sind 2 bytes (Halfword), weil Werte bis 1000
	  nicht in ein Byte passen

## Methoden ##
Methode 1: "sieben"
	- Speicheradresse von "sieb" laden
	- Schleife, die in "sieb" alle indexe von 2-1000 auf 1 setzt
	  (Indexe 0 und 1 bleiben auf 0 weil die erste Primzahl 2 ist)

	- Äußere Schleife mit Zählvariable i = 2, läuft solange i <= 31
	- Wenn sieb[i] == 1 dann in innere Schleife gehen
	- Innere Schleife mit Zählvariable j = i * i läuft solange
	  j <= 1000, wird um j += i inkrementiert, nimmt also alle
	  vielfachen von dem jetzigen i
	- sieb[j] keine Primzahl also auf 0 setzen

Methode 2: "abspeichern"
	- Speicheradresse von "primzahlen" und "sieb" laden
	- Variable k als index zähler für "primzahlen" deklarieren
	- Schleife mit Zählvariable i = 2, läuft alle zahlen von 2-1000
	  durch
	- prüft ob in "sieb" eine 1 gesetzt ist, wenn ja, dann
	  in "primzahlen" einfügen und k inkrementieren (Pro Element
      2 Bytes weitergehen, weil es ein short Array ist)
	- Am ende den Wert von k zurückgeben