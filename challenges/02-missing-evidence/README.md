# Challenge 2: The Missing Evidence

**Category:** Linux · **Difficulty:** ★☆☆ · **Format:** live demo, optional hands-on

The responder who handled the 02:14 alert left an evidence folder behind. The report says everything is in there, but at first glance something is missing.

## Get the evidence

Open [Google Cloud Shell](https://shell.cloud.google.com) (or any Linux/macOS terminal) and paste:

```bash
curl -sL https://raw.githubusercontent.com/whsb3ne/incident-214/main/challenges/02-missing-evidence/incident-evidence.tar.gz | tar -xz
cd incident-evidence && ls
```

> **On Windows?** Use Cloud Shell or WSL. Windows PowerShell treats `curl` and `ls` differently, and File Explorer does not hide files the way Linux does, which would spoil the lesson.

Your task: find the recovered evidence and submit the flag inside it.

<details>
<summary>Hint 1</summary>

Read `readme.txt` carefully. What does it say about visibility?
</details>

<details>
<summary>Hint 2</summary>

On Linux, files whose names start with a `.` are hidden from a plain `ls`.
</details>

<details>
<summary>Hint 3</summary>

Try `ls -la`, then open what you find with `cat`.
</details>

### Stretch goal

Can you find the flag with a **single command**, without knowing which file it is in?
