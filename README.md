# Incident 2:14 — Chapter 1: Onboarding

![Level](https://img.shields.io/badge/level-beginner-2ea44f)
![Format](https://img.shields.io/badge/format-jeopardy%20%2B%20team-blue)
![Challenges](https://img.shields.io/badge/challenges-3-orange)
![License](https://img.shields.io/badge/license-MIT-lightgrey)
![Validate](https://github.com/whsb3ne/incident-214/actions/workflows/validate.yml/badge.svg)

A story-driven, beginner-friendly Capture The Flag built for **GDG on Campus, Mount Kenya University**. No experience needed: participants go from "what is a terminal?" to reading an authentication log like a security analyst in one evening.

> **02:14:07 ALERT — unrecognised login**
>
> Welcome to Savanna Systems. Today is your first day on the security team, which is why tonight is called *Onboarding*. Bad timing, though. At 02:14:07 this morning an alert fired for an unrecognised login, and nobody knows what happened. By the end of the session, your job is to answer one question: **who logged in at 2:14?**

| | |
|---|---|
| **Event** | Tuesday 27 October 2026, 7:30–9:30 PM EAT, online (Google Meet) |
| **Audience** | First-time CTF players; teams formed on the night |
| **Flag format** | `MKU{...}` |
| **Severity** | Medium · *Under investigation* |

## Challenges

| # | Challenge | Category | Difficulty | You will learn | Works on a phone? |
|---|---|---|---|---|---|
| 1 | [The Encoded Message](challenges/01-encoded-message/) | Encoding | ★☆☆ | Recognising Base64, using CyberChef, encoding vs encryption | Yes |
| 2 | [The Missing Evidence](challenges/02-missing-evidence/) | Linux | ★☆☆ | Navigating a shell, hidden files, `ls -la`, `cat`, `grep` | Watch the demo |
| 3 | [Who Logged In at 02:14?](challenges/03-who-logged-in/) | Log analysis / forensics | ★★☆ | Reading auth logs, timelines, spotting anomalous IPs, observation vs conclusion | Yes |

The three challenges form one investigation: decode a message, recover hidden evidence, then reconstruct the timeline of the suspicious login.

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
│   ├── 01-encoded-message/      # brief + the intercepted string
│   ├── 02-missing-evidence/     # brief + incident-evidence.tar.gz
│   └── 03-who-logged-in/        # brief + auth.log
├── scripts/validate.sh          # sanity checks run in CI (never prints flags)
└── .github/workflows/validate.yml
```

Every push runs `scripts/validate.sh` in GitHub Actions. It checks that each challenge is still solvable as designed (the Base64 decodes to a well-formed flag, the evidence file is really hidden from a plain `ls`, the log has exactly one external IP) without ever printing a flag.

## Solutions

Official write-ups `writeups/WRITEUP.md`

## What's next

**Chapter 2** picks up where this one ends: was it really the admin, and what changed at 02:15:12?

## Credits
Designed and run by **Benedict (@whsb3ne) and Yvonne (@Moseti-suddo)** for GDG on Campus, Mount Kenya University.
Story, challenge design and playtesting by us while the files and automation were built with Claude as a coding assistant.

Created for **GDG on Campus, Mount Kenya University** as part of the *Incident 2:14* beginner security series. Savanna Systems is a fictional company, and every IP address in this repository comes from ranges reserved for documentation or private networks.

Recommended next steps for players: the [picoCTF Primer](https://primer.picoctf.org/) and [OverTheWire Bandit](https://overthewire.org/wargames/bandit/), levels 0–5.

## License

[MIT](LICENSE)
