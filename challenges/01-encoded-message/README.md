# Challenge 1: The Encoded Message

**Category:** Encoding · **Difficulty:** ★☆☆ · **Format:** solved together

During the incident review, analysts found this string in a Savanna Systems server message queue. Nobody knows what it says.

```
TUtVe2ZpcnN0X2ZsYWdfZm91bmR9
```

Decode it to recover the flag.

**Tool:** [CyberChef](https://gchq.github.io/CyberChef/) runs entirely in your browser, including on a phone.

<details>
<summary>Hint 1</summary>

Does it look like a common encoding? Notice the character set: letters, digits, and sometimes `+`, `/` or `=`.
</details>

<details>
<summary>Hint 2</summary>

This is decoding, not code-breaking. There is no key.
</details>

<details>
<summary>Hint 3</summary>

In CyberChef, drag the **From Base64** operation into the recipe.
</details>

### Why it matters

Base64 is an **encoding**, not **encryption**. Anyone can reverse it without a key, so it must never be used to "protect" passwords or secrets.
