### Automatisierte Aufgaben in der AWS-Umgebung und Bildverkleinerung mit einem Bash-Skript

---

Das Ziel dieses Codes ist es, ein Bash-Skript zu erstellen, das automatisierte Aufgaben in der Amazon Web Services (AWS)-Umgebung durchführt und gleichzeitig eine Funktion zur Bildverkleinerung bietet. Konkret umfasst dies die Erstellung von zwei S3-Buckets, einer Lambda-Funktion und die Aktivierung von S3-Bucket-Events für die Lambda-Funktion. Darüber hinaus bietet das Skript eine Benutzerinteraktion für die Bildverkleinerung an.

----

##### Funktionalität des Codes:

**1. Erstellen von S3-Buckets:** Das Skript erstellt zwei S3-Buckets mit den vom Benutzer angegebenen Namen. Diese Buckets dienen als Speicherorte für die zu verarbeitenden Bilder und die verkleinerten Ergebnisse.

**2. Erstellen der Lambda-Funktion:** Eine Lambda-Funktion wird erstellt und konfiguriert, um Bildverkleinerungen durchzuführen. Dabei wird die Größe der Bilder reduziert, um Speicherplatz zu sparen und die Effizienz bei der Weiterverarbeitung zu erhöhen.

**3. Aktivieren von S3-Bucket-Events für die Lambda-Funktion:** Es werden S3-Bucket-Events aktiviert, damit die Lambda-Funktion automatisch ausgeführt wird, wenn neue Objekte im ersten Bucket erstellt werden. Auf diese Weise wird eine nahtlose Integration geschaffen, um die Bildverkleinerung bei Bedarf automatisch auszulösen.

**4. Benutzerinteraktion für die Bildverkleinerung:** Das Skript bietet dem Benutzer die Möglichkeit, die Bildverkleinerung manuell anzufordern. Wenn der Benutzer zustimmt, wird der Pfad zum Bild abgefragt und das Bild entsprechend verkleinert. Dies ermöglicht eine flexible Handhabung für spezifische Anwendungsfälle und individuelle Anforderungen.

---

##### Aufgrund folgender Fehler ist es nicht gelungen, die vollständige Funktionalität sicherzustellen:

**1. Fehlende Implementierung der Funktion sss:** Im Code gibt es eine Zeile mit dem Kommentar "sss", die keine implementierte Funktion hat. Es ist unklar, ob dies eine leere Platzhalterfunktion sein soll oder ein Überbleibsel aus einem vorherigen Entwicklungsschritt ist.

**2. Fehlender Befehl zur Bildverkleinerung:** Nachdem der Benutzer zugestimmt hat, ein Bild zu verkleinern, wird ein Platzhaltertext ausgegeben, jedoch fehlt der tatsächliche Befehl zur Bildverkleinerung. Dies könnte die Funktionalität des Skripts beeinträchtigen.

**3. Möglicherweise nicht formatierter ARN:** Es besteht die Möglichkeit, dass die ARN-Formatierung bei der Aktivierung der S3-Bucket-Events nicht korrekt ist. Dies könnte auf ein Problem mit der Zusammensetzung des ARN zurückzuführen sein und sollte überprüft werden.

**4. Mögliche Berechtigungsfehler:** Die Fehlermeldung deutet darauf hin, dass möglicherweise Berechtigungsfehler auftreten könnten, insbesondere wenn die IAM-Rolle nicht über die erforderlichen Berechtigungen zum Aktivieren von S3-Bucket-Events verfügt. Eine Überprüfung der IAM-Rollen und Berechtigungen ist daher ratsam, um dieses Problem zu lösen.



Leider sind wir uns bei den genauen Ursachen der Fehler nicht ganz sicher und vermuten diese anhand der vorliegenden Informationen. Weitere Überprüfungen und Tests sind erforderlich, um die genauen Probleme zu identifizieren und zu beheben.


