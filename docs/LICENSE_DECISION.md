# LootOwner – Lizenzprüfung (Entscheidung offen)

Stand: 2026-11-11. **Interne Vorbereitung; keine Lizenz erteilt, keine öffentliche Veröffentlichung freigegeben.**

## Geprüfter Stand

- Repository: `CrobIT-Solution/LootOwner` (privat, Branch `main`).
- Addon-Stand: **0.0.12 Beta Candidate**, Entwickler-/Maintainer-Anzeige: **Blackiron**.
- `LootOwner.lua` (Git-Blob-SHA: `b9ed00ad1865ae73ec2bd17b806ccd4ce5c95574`) und `LootOwner.toc` (`4edaebacd27bf9529bc8072cacfdcbc1ba1408e4`) werden nicht verändert.
- Das Addon verwendet eigene Tooltip-Ausgabe, WoW-API-Aufrufe und optionale MobInfo2-Globals (`MI2_TooltipFrame`, `MI2_MouseoverIndex`, `MI2TT_ExtraInfo*`). Die Verbindung zu MobInfo2 ist **optional**; keine MobInfo2-Quellcodedatei liegt im LootOwner-Repository.
- Im geprüften LootOwner-Quellcode ist kein Drittanbieter-Lizenzheader oder ausdrücklicher Copyright-Hinweis enthalten. Das belegt **nicht automatisch**, dass jede Codezeile frei von Dritt-Rechten ist. Ein vollständiger Ähnlichkeits- oder Herkunftsnachweis wurde nicht erstellt.
- MobInfo2 ist separat unter MIT veröffentlicht. Die bloße Nutzung seiner Schnittstellen erfordert **nicht automatisch**, dass LootOwner ebenfalls unter MIT lizenziert wird. Sollte doch geschützter MobInfo2-Code übernommen worden sein, müssten die entsprechenden MIT-Lizenz- und Copyright-Hinweise erhalten bleiben.
- Der angezeigte Entwicklername **Blackiron** ist eine Credit-Angabe. Er ersetzt die Prüfung, wer rechtlich die Befugnis hat, eine Lizenz zu erteilen, nicht.

## Lizenzoptionen – Entscheidung des Inhabers erforderlich

| Option | Wirkung | Trade-off |
|---|---|---|
| **MIT** (einfach, permissiv) | Benutzung, Änderungen und Weitergabe einschließlich Forks grundsätzlich möglich, bei Erhalt des Copyright- und Lizenzhinweises | Auch kommerzielle Weiterverwendung grundsätzlich erlaubt |
| **All Rights Reserved** / eigene Nutzungsbedingungen | Kontrolle über Bearbeitung und Weiterverbreitung bleibt stärker beim Rechteinhaber | Wer den Code weiterverwenden darf, muss ausdrücklich geregelt werden; Community-Beiträge/Forks sind komplizierter |
| **GPL-3.0** (Copyleft) | Änderungen und Weitergabe sind möglich, weitergegebene abgeleitete Versionen müssen die GPL-Bedingungen erfüllen | Mehr Pflichten für Weiterverbreiter und größere Kompatibilitätsprüfung |

**Vorschlag:** Für ein kleines, kostenloses Community-Addon ist MIT ein einfacher Weg, **wenn** ausdrücklich gewünscht ist, dass andere den Code kopieren, verbessern und weiterverbreiten dürfen. Soll dies nicht gewünscht sein, keine MIT-Lizenz ohne Rücksprache festlegen.

Wichtig: Eine kostenlose Nutzung des Addons und eine Open-Source-Lizenz sind **verschiedene Fragen**. Auch die CurseForge-Projektlizenz und die GitHub-`LICENSE`-Datei müssen übereinstimmen.

## Verbindliche Freigabegates

- [x] Getesteten Addon-Code identifiziert; keine MobInfo2-Originaldateien im Repository.
- [x] Vorhandene Lizenzhinweise im LootOwner-Code durchgesehen.
- [ ] Rechteinhaber/Quellcodeherkunft einschließlich eventueller Drittbeiträge abschließend bestätigen.
- [ ] Lizenzmodell ausdrücklich freigeben.
- [ ] Passende `LICENSE`-Datei und – falls nötig – Copyright-Attribution ergänzen.
- [ ] README, TOC/Release-Paket und CurseForge-Projektlizenz konsistent halten.
- [ ] Keine öffentliche Sichtbarkeit / kein CurseForge-Upload vor ausdrücklicher Veröffentlichungsfreigabe.

Quellen für die Entscheidung:
- GitHub Lizenzhinweise: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository
- CurseForge Submission/Licensing: https://support.curseforge.com/support/solutions/articles/9000199552
- MobInfo2-Lizenz: https://www.curseforge.com/wow/addons/mobinfo2

*Praktische, keine verbindliche Rechtsberatung.*
