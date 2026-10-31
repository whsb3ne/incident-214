# Challenge 6: One Wrong Guess

**Category:** Web · **Difficulty:** ★★☆ · **Format:** team challenge

The auth log shows the attacker failing to log in as `admin` at 02:13:58 and succeeding nine seconds later. Reproduce what they did on the staging portal, and find out how they could have known what to type.

Submit the flag shown inside the admin panel.

**Portal:** https://savanna-portal.yvonnemoseti71.workers.dev/

**Tools:** a desktop browser.

<details>
<summary>Hint 1</summary>

What did the contractor's handover note say about where the nightly export job writes its files?
</details>

<details>
<summary>Hint 2</summary>

Try the password you found. Does what happens match the log?
</details>

<details>
<summary>Hint 3</summary>

Read the README in that folder. What changes in a password every year?
</details>

### Think like an analyst

Does what you just did match the attacker's pattern in the log? What does that prove, and what does it **not** prove? What is the *earliest* suspicious event you can now see, and is it really 02:14?

### Stretch

Why is a predictable password rotation almost as bad as a leaked password?
