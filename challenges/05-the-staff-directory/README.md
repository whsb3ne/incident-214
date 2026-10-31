# Challenge 5: The Staff Directory

**Category:** Web · **Difficulty:** ★☆☆ · **Format:** pairs

The dev notes mention a staff directory built for a pilot. IT says **six** people had accounts on the portal on the night of the incident, but the directory only lists five. Find the sixth account and submit the flag on their profile.

**Portal:** https://savanna-portal.yvonnemoseti71.workers.dev/staff

**Tools:** just your browser and its address bar.

<details>
<summary>Hint 1</summary>

Open a profile and watch the address bar. What changes from one person to the next?
</details>

<details>
<summary>Hint 2</summary>

The directory is a list of links, but a link is only one way to reach a page.
</details>

<details>
<summary>Hint 3</summary>

What happens if you type a number that nobody linked to?
</details>

### Think like an analyst

Before you try anything, predict what the server will return for an ID that doesn't exist. Then check. After you find the sixth account, ask yourself: did the portal ever check who *you* were? What should it have checked?

### Why it matters

This is called an **insecure direct object reference (IDOR)**. If a page is reached by a guessable number and the server never checks who is asking, anyone can walk through every record by counting. "Not linked" does not mean "protected".
