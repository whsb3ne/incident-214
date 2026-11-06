# Challenge 4: Read the Page

**Category:** Web · **Difficulty:** ★☆☆ · **Format:** live, everyone together

IT preserved a staging copy of the Savanna Systems staff portal from the night of the incident. At first glance, everything appears normal—but the public pages do not tell the whole story.

Somewhere on the portal is an internal page that was never linked in the navigation and was never meant to be found by visitors. Track it down and recover the flag hidden inside.

**Portal:** https://savanna-portal.yvonnemoseti71.workers.dev/

**Tools:** a desktop browser. Everything here works in Chrome, Edge, Firefox or Safari. Press `F12` to open DevTools.

> **On a phone?** DevTools is hard to use on mobile. Pair up with someone on a laptop.

<details>
<summary>Hint 1</summary>

The page shown in your browser is only part of what the website provides. What other information can you inspect?
</details>

<details>
<summary>Hint 2</summary>

Websites sometimes publish instructions for search-engine crawlers. Which standard file tells them which paths not to visit?
</details>

<details>
<summary>Hint 3</summary>

Check `/robots.txt` on the portal. What path does it mention, and what happens when you visit it directly?
</details>

### Think like an analyst

Before you open the file, write down what you expect it to contain. Then compare. Why would a company list a private path in a public file?

### Why it matters

`robots.txt` is a polite request to search engines, not a lock. Anyone can read it, so listing a private path there points straight at it.
