# Incident 2:14, Chapter 1: Onboarding — Official Write-up

> **Spoiler warning:** this write-up contains every flag. Try the [challenges](../challenges/) yourself first.

| | |
|---|---|
| **Event** | Incident 2:14, Chapter 1: Onboarding · GDG on Campus, Mount Kenya University |
| **Date** | Tuesday 27 October 2026, online (Google Meet) |
| **Level** | Beginner |
| **Flag format** | `MKU{...}` |

## Overview

Savanna Systems had an alert for an unrecognised login at **02:14:07**. The CTF has three challenges that together form one investigation: decode a message, recover hidden evidence, and reconstruct the timeline of the suspicious login.

| # | Challenge | Category | Flag |
|---|---|---|---|
| 1 | [The Encoded Message](#challenge-1-the-encoded-message) | Encoding | `MKU{first_flag_found}` |
| 2 | [The Missing Evidence](#challenge-2-the-missing-evidence) | Linux | `MKU{look_closer}` |
| 3 | [Who Logged In at 02:14?](#challenge-3-who-logged-in-at-0214) | Log analysis | `MKU{admin_203.0.113.77}` |

---

## Challenge 1: The Encoded Message

**Category:** Encoding · **Difficulty:** ★☆☆

### The problem

Analysts found this string in a Savanna Systems server message queue and asked us to decode it:

```
TUtVe2ZpcnN0X2ZsYWdfZm91bmR9
```

### Steps

1. **Looked at the characters.** Only letters (upper and lower case) and digits, with no spaces. That pattern is typical of Base64, which uses `A–Z`, `a–z`, `0–9`, `+` and `/`, sometimes padded with `=`.
2. **Opened [CyberChef](https://gchq.github.io/CyberChef/)** in the browser.
3. **Added the "From Base64" operation** to the recipe and pasted the string into the Input box.
4. **Read the output:**

```
MKU{first_flag_found}
```

On Linux or macOS the same thing works in a terminal:

```bash
echo 'TUtVe2ZpcnN0X2ZsYWdfZm91bmR9' | base64 -d
```

### Flag

`MKU{first_flag_found}`

### What I learned

- Base64 is **encoding**, not **encryption**. Anyone can reverse it without a key, so it must never be used to hide passwords or secrets.
- A Base64 string starting with `TUtV` decodes to `MKU`, a quick way to spot flags in this series.

---

## Challenge 2: The Missing Evidence

**Category:** Linux · **Difficulty:** ★☆☆

### The problem

The responder who handled the 02:14 alert left an evidence folder behind, but "at first glance something is missing". We had to find the hidden evidence and the flag inside it.

### Steps

1. **Opened [Google Cloud Shell](https://shell.cloud.google.com)** (a free Linux terminal in the browser), then downloaded and unpacked the evidence:

    ```bash
    curl -sL https://raw.githubusercontent.com/whsb3ne/incident-214/main/challenges/02-missing-evidence/incident-evidence.tar.gz | tar -xz
    cd incident-evidence && ls
    ```

    ```
    notes.txt  readme.txt
    ```

2. **Read both files** with `cat`:

    ```
    $ cat readme.txt
    Incident report
    Check the available files carefully.
    Some evidence may not be immediately visible.

    $ cat notes.txt
    The login alert occurred at 02:14.
    No conclusion has been reached.
    ```

    The readme hints that something is "not immediately visible". On Linux, files whose names start with a dot are hidden from a plain `ls`.

3. **Listed all files, including hidden ones,** with `ls -la` (`-l` long format, `-a` all files):

    ```
    $ ls -la
    -rw-r--r-- 1 user user   37 Oct 23 23:14 .evidence.txt
    -rw-r--r-- 1 user user   67 Oct 23 23:14 notes.txt
    -rw-r--r-- 1 user user   99 Oct 23 23:14 readme.txt
    ```

4. **Read the hidden file:**

    ```
    $ cat .evidence.txt
    Recovered evidence: MKU{look_closer}
    ```

**Stretch goal (one command):** `grep -r "MKU{" .` searches every file in the folder, hidden ones included, and prints the flag directly.

### Flag

`MKU{look_closer}`

### What I learned

- "Hidden" files on Linux are just files whose names start with a dot. They aren't protected, only not shown by default.
- Always use `ls -la` when investigating, because attackers can hide tools and notes this way.
- `grep -r` searches a whole folder for text in one go.

---

## Challenge 3: Who Logged In at 02:14?

**Category:** Log analysis / forensics · **Difficulty:** ★★☆

### The problem

We were given the server's [`auth.log`](../challenges/03-who-logged-in/auth.log) for the night of the incident and had to find the account and IP address behind the unrecognised login, submitted as `MKU{account_ip}`.

### Steps

1. **Read the whole log first** to learn what "normal" looks like. It has 13 lines, each with a time, user, IP, event and result. Staff log in, access files and log out, all from IPs starting with `192.168.1.`.

2. **Found the events during the minute 02:14:**

    ```
    $ grep "^02:14" auth.log
    02:14:07 user=admin ip=203.0.113.77 event=login result=success
    02:14:33 user=wanjiru ip=192.168.1.21 event=file_access result=success
    ```

    Only the admin line is a **login**, and its time matches the alert exactly. Wanjiru's line is a file access; she had already logged in at 02:03:15.

3. **Compared the IP addresses.** Every staff IP is internal: amina `192.168.1.12`, otieno `192.168.1.18`, wanjiru `192.168.1.21`, and the admin account itself logged out from `192.168.1.5` at 23:41. Only `203.0.113.77` is different, so that login came from outside the office network.

4. **Followed that IP through the whole log:**

    ```
    $ grep "203.0.113.77" auth.log
    02:13:58 user=admin ip=203.0.113.77 event=login result=failure
    02:14:07 user=admin ip=203.0.113.77 event=login result=success
    02:15:12 user=admin ip=203.0.113.77 event=privilege_change result=success
    02:19:05 user=admin ip=203.0.113.77 event=logout result=success
    ```

    | Time | Event | Note |
    |---|---|---|
    | 02:13:58 | Login **failed** | First attempt |
    | 02:14:07 | Login **succeeded** | 9 seconds later, the moment of the alert |
    | 02:15:12 | **Privilege change** | About a minute after logging in |
    | 02:19:05 | Logout | About 5 minutes after logging in |

### Flag

`MKU{admin_203.0.113.77}`

### What I learned

- Read the whole log before zooming in on the alert time, so you know what normal looks like.
- Look for what doesn't fit. Here it was the one IP outside the usual internal range.
- **Observation vs conclusion:** the log shows the admin account logging in from an outside IP and changing privileges. It does *not* prove who was typing. It could be the real admin working remotely, or someone with a stolen password. More evidence is needed before calling it a compromise.
- **Dead end:** at first we suspected Wanjiru because her activity was close to 02:14. But she logged in 11 minutes earlier from a normal internal IP, and her 02:14 event was only a file access.
- Fun fact: `203.0.113.0/24` is reserved for documentation (RFC 5737), so it isn't a real network.

---

## Overall takeaways

- Encoding is not security.
- Hidden doesn't mean gone: check with `ls -la`.
- Good investigations separate what the evidence shows from what we assume.

## What's next

**Chapter 2** picks up where this one ends: was it really the admin, and what changed at 02:15:12?

Keep practising: [picoCTF](https://picoctf.org) · [OverTheWire Bandit](https://overthewire.org/wargames/bandit/) (levels 0–5) · [TryHackMe](https://tryhackme.com) (free room: Linux Fundamentals Part 1)

---

*Written by the Incident 2:14 organisers for GDG on Campus, Mount Kenya University.*
