# Challenge 7: The Locked Drawer

**Category:** Web · **Difficulty:** ★★☆ · **Format:** team challenge (continues Challenge 6)

Inside the admin panel, the activity feed ends with a role change the log cannot explain, and an archive download a minute later. Find out what was in the archive and how the role changed.

Submit the flag shown when you open the archive.

**Portal:** https://savanna-portal.yvonnemoseti71.workers.dev/

**Tools:** a desktop browser. CyberChef is useful.

<details>
<summary>Hint 1</summary>

The download button is greyed out. Is the button what stops you, or is something else checking?
</details>

<details>
<summary>Hint 2</summary>

What does the server look at to decide who you are? Where does your browser keep things the site has given it?
</details>

<details>
<summary>Hint 3</summary>

Where have you seen a string that ends in `=` before?
</details>

### Think like an analyst

Why did removing the greyed-out button not help? Which part of the system actually made the decision? Write the one sentence you would put in an incident report about what happened at 02:15:12.

### Why it matters

A browser is not a vault. Anything the browser holds, including buttons, hidden fields and cookies, can be changed by the person using it. The server must decide using data it controls, for example a server-side session or a signed cookie.
