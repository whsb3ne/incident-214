# Challenge 4: Read the Page

**Category:** Web · **Difficulty:** ★☆☆ · **Format:** live, everyone together

IT preserved a staging copy of the Savanna Systems staff portal exactly as it was on the night of the incident. Before anyone can say how the attacker got in, someone has to look at the portal the way the attacker did.

**Portal:** https://savanna-portal.yvonnemoseti71.workers.dev/

Somewhere in the portal there is an internal page that was never meant to be public. Find it and submit the flag inside it.

**Tools:** a desktop browser. Everything here works in Chrome, Edge, Firefox or Safari. Press `F12` to open DevTools.

> **On a phone?** DevTools is hard to use on mobile. Pair up with someone on a laptop.

<details>
<summary>Hint 1</summary>

A web page contains more than what is shown on screen. How can you read what the browser received?
</details>

<details>
<summary>Hint 2</summary>

Which file tells search engines where they should not look?
</details>

<details>
<summary>Hint 3</summary>

Add `/robots.txt` to the portal address, then visit the path it lists.
</details>

### Think like an analyst

Before you open the file, write down what you expect it to contain. Then compare. Why would a company list a private path in a public file?

### Why it matters

`robots.txt` is a polite request to search engines, not a lock. Anyone can read it, so listing a private path there points straight at it.
