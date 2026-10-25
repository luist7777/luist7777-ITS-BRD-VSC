Anw01: Der Ort an dem VariableA liegt, wird in Register 0 gespeichert.
Anw02: Ein Byte wird von dem Wert, auf den das Register 0 zeigt, in das Register 2 gespeichert.
Anw03: Es wird diesmal ein Byte von dem Wert, auf den das Register 0 zeigt, in das Register 3 gespeichert. Wir gehen aber durch #1 einen Byte weiter.
Anw04: Die Bits in dem Register 2 werden durch #8, 8 Stellen nach links verschoben und es werden genau 8 Nullen von rechts nachgerückt, also 2-Hex stellen bzw. 1 Byte (Logical Shift Left).
Anw05: Das Register 2 wird mit dem Register 3 verknüpft, aus 0xef00 wird 0xefbe.
Anw06: Der Wert des Registers 2 (Ein 16-bit Halfword), wird auf die Speicheradresse auf die R0 zeigt geschrieben.