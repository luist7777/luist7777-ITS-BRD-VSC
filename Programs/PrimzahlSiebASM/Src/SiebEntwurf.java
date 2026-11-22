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