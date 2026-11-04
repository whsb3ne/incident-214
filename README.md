# Incident 2:14 — Chapters 1 & 2

![Level](https://img.shields.io/badge/level-beginner-2ea44f)
![Format](https://img.shields.io/badge/format-jeopardy%20%2B%20team-blue)
![Challenges](https://img.shields.io/badge/challenges-7-orange)
![License](https://img.shields.io/badge/license-MIT-lightgrey)
![Validate](https://github.com/whsb3ne/incident-214/actions/workflows/validate.yml/badge.svg)

A story-driven, beginner-friendly Capture The Flag built for **GDG on Campus, Mount Kenya University**. No experience needed: participants go from "what is a terminal?" to reading an authentication log like a security analyst in one evening.

> **02:14:07 ALERT — unrecognised login**
>
> Welcome to Savanna Systems. Today is your first day on the security team, which is why tonight is called *Onboarding*. Bad timing, though. At 02:14:07 this morning an alert fired for an unrecognised login, and nobody knows what happened. By the end of the session, your job is to answer one question: **who logged in at 2:14?**

| | |
|---|---|
| **Event** | **Chapter 1 — Onboarding:** Tue 27 Oct 2026, 7:30–9:30 PM EAT · **Chapter 2 — The Breach:** Fri 6 Nov 2026, 7:30–9:00 PM EAT · online |
| **Audience** | First-time CTF players; teams formed on the night |
| **Flag format** | `MKU{...}` |
| **Severity** | Medium · *Under investigation* |

## Challenges

The CTF runs in two chapters. **Chapter 1** is the Onboarding investigation; **Chapter 2 — The Breach** moves onto the Savanna Systems staff portal to uncover how the login at 02:14 was possible.

### Chapter 1 — Onboarding

| # | Challenge | Category | Difficulty | You will learn | Works on a phone? |
|---|---|---|---|---|---|
| 1 | [The Encoded Message](challenges/01-encoded-message/) | Encoding | ★☆☆ | Recognising Base64, using CyberChef, encoding vs encryption | Yes |
| 2 | [The Missing Evidence](challenges/02-missing-evidence/) | Linux | ★☆☆ | Navigating a shell, hidden files, `ls -la`, `cat`, `grep` | Watch the demo |
| 3 | [Who Logged In at 02:14?](challenges/03-who-logged-in/) | Log analysis / forensics | ★★☆ | Reading auth logs, timelines, spotting anomalous IPs, observation vs conclusion | Yes |

### Chapter 2 — The Breach

> Set on a staging copy of the Savanna Systems staff portal. All four are web challenges and need a desktop browser.

| # | Challenge | Category | Difficulty | You will learn | Works on a phone? |
|---|---|---|---|---|---|
| 4 | [Read the Page](challenges/04-read-the-page/) | Web | ★☆☆ | Viewing what the browser received, `robots.txt`, finding hidden pages | No — use a laptop |
| 5 | [The Staff Directory](challenges/05-the-staff-directory/) | Web | ★☆☆ | Insecure direct object references (IDOR), access control, editing URL IDs | No — use a laptop |
| 6 | [One Wrong Guess](challenges/06-one-wrong-guess/) | Web | ★★☆ | Exposed files, predictable password rotation, credential hygiene | No — use a laptop |
| 7 | [The Locked Drawer](challenges/07-the-locked-drawer/) | Web | ★★☆ | Client vs server trust, cookies, Base64 tampering, privilege escalation | No — use a laptop |

Chapter 1 forms one investigation: decode a message, recover hidden evidence, then reconstruct the timeline of the suspicious login. Chapter 2 then shows, hands-on, how the attacker reached and abused the portal.

## How to play

1. Open each challenge folder and read its brief.
2. Find the flag. It always looks like `MKU{...}`.
3. Submit it through the event's **Google Form** (https://forms.gle/xEmzsFFDsZ9KG6kR6). Never post flags in the Meet chat; everyone can see it.

Challenge 2 needs a Linux terminal. The easiest option is [Google Cloud Shell](https://shell.cloud.google.com) (free, browser-based, needs a personal Gmail account and age 18+). macOS Terminal, WSL or any Linux machine also works.

## Rules

- **Only test systems you are authorised to test.** Everything here is a safe, self-contained exercise. Accessing real systems without permission is an offence under Kenya's *Computer Misuse and Cybercrimes Act, 2018*.
- **No flags in chat.** Submit through the form only.
- **AI tools are allowed for learning**, but your write-up must explain every step in your own words.

## Repository layout

```
incident-214/
├── challenges/
│   ├── 01-encoded-message/      # Ch1 · brief + the intercepted string
│   ├── 02-missing-evidence/     # Ch1 · brief + incident-evidence.tar.gz
│   ├── 03-who-logged-in/        # Ch1 · brief + auth.log
│   ├── 04-read-the-page/        # Ch2 · brief (portal challenge)
│   ├── 05-the-staff-directory/  # Ch2 · brief (portal challenge)
│   ├── 06-one-wrong-guess/      # Ch2 · brief (portal challenge)
│   └── 07-the-locked-drawer/    # Ch2 · brief (portal challenge)
├── writeups/WRITEUP.md          # official solutions (published after each event)
├── scripts/validate.sh          # sanity checks run in CI (never prints flags)
├── .github/workflows/validate.yml
└── LICENSE
```

Every push runs `scripts/validate.sh` in GitHub Actions. It checks that each challenge is still solvable as designed (the Base64 decodes to a well-formed flag, the evidence file is really hidden from a plain `ls`, the log has exactly one external IP) without ever printing a flag.

## Solutions
Official write-ups: [writeups/WRITEUP.md](writeups/WRITEUP.md). Chapter 2 (challenges 4–7) solutions are published after its event.

## What's next

**Chapter 2 — The Breach** (challenges 4–7) is now in this repo: it answers how the attacker reached the portal and what changed at 02:15:12. Later chapters will go deeper into the investigation.

## Credits
Designed and run by **Benedict (@whsb3ne) and Yvonne (@Moseti-suddo)** for GDG on Campus, Mount Kenya University.
Story, challenge design and playtesting by us while the files and automation for chapter 1 were built with Claude as a coding assistant.

Created for **GDG on Campus, Mount Kenya University** as part of the *Incident 2:14* beginner security series. Savanna Systems is a fictional company, and every IP address in this repository comes from ranges reserved for documentation or private networks.

Recommended next steps for players: the [picoCTF Primer](https://primer.picoctf.org/) and [OverTheWire Bandit](https://overthewire.org/wargames/bandit/), levels 0–5.

## License

[MIT](LICENSE)
