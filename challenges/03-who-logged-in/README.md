# Challenge 3: Who Logged In at 02:14?

**Category:** Log analysis / forensics · **Difficulty:** ★★☆ · **Format:** team challenge (30 minutes)

This is the authentication log for the night of the incident: [`auth.log`](auth.log). The incident report mentions **02:14**. Investigate the events around that time and work out which account and IP address were involved.

## Submit

The **account** and **IP address** behind the unrecognised login, joined by an underscore:

```
MKU{account_ip}
```

Example of the format only: `MKU{alice_10.0.0.1}`. Keep the dots in the IP address.

<details>
<summary>Hint 1</summary>

How many events happened during the minute 02:14?
</details>

<details>
<summary>Hint 2</summary>

All the staff IP addresses have something in common. Which one doesn't fit?
</details>

<details>
<summary>Hint 3</summary>

Follow that IP address through the whole log, from first appearance to last.
</details>

### Think like an analyst

Be ready to explain your answer, not just submit it. What happened just **before** and just **after** the login? Is what you found **proof** of a compromise, or an **observation** that needs more investigation?
