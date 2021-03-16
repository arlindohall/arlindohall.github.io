---
title: Random Strings in Bash
description: Examples of how to create structured random strings in bash
    especially regarding hex and base64 data, which can be made easily
    if you know what commands to use.
---

Random Strings in Bash
=====

On Linux (and MacOS) systems, there's a really nifty feature that you can use to get random data: `/dev/random` (or, if you're in a hurry you can use `/dev/urandom`).
This special file contains random bytes, which is useful for creating one-off keys or other temporary random data.
Sometimes, though, you need structured random data or encoded data.
For example, you might need a random hex string like a uuid (but not a uuid because then you can just use `uuid`).

If you just need a bunch of random data, then getting it is as simple as the following:

```
cat /dev/random
# ... lots of weird characters here,
# and probably your shell will get messed up
```

Oh no, this runs forever!
It turns out that `/dev/random` isn't actually a file, it's a psuedo-file that just pretends to be infinitely long.
It actually generates the data as you read from it.
Instead, what we want is

```
head -c 8 /dev/random
# hA���F0
```

Fortunately for us, the `head` command can process raw bytes (it doesn't care about ASCII).
Cool, so we have a bunch of bytes.
But the thing is, you might need more structured data, for example a base64 string.
There's lots of reasons this might be the case, probably you just have a system that handles ASCII or UTF-8 data (like a web service), so you need to encode those bytes as printable text.
We don't want to just scan the file for printable characters, though because we'd have to skip lots of bytes.
In my example output, if we accepted any ASCII characters, we would only be able to take `hAF0` from those 8 bytes, throwing the other 50% away.
If we could only accept lower-case letters and numbers (like if we wanted hex data), we could only accept `h0`, which would be a loss rate of 75%.
That's a lot of waste!

Encoded Data
-----

To make a 8-character base64-encoded string, you need 6 bytes of random data.

```
head -c 6 /dev/random | base64
# j2bQWTpg
```

Cool! What about hex?
To make an 8-character hex-encoded string, you need 4 bytes of random data.

```
head -c 4 /dev/random | hexdump
# 0000000 f2 ca 39 00 4e 4f eb dc ef 25 92 c8 7a 5d f9 42
# 0000010
```

Uh, oh.
That's not what we wanted.
Hexdump is really cool for digging through files because by default, it prints out each byte with padding and prefixes each group of 16 bytes with a byte counter, which makes it easy to track where you are in a file.
But we want something much simpler, just the hex-encoded string version of some binary data.

I have two aliases I put in my `config.fish` [^aliases]:

```fish
alias hd-rows "hexdump -e '16/1 \"%02x\" \"\n\"'"
alias hd "hexdump -e '\"%02x\"'"
```

[^aliases]: If you use bash, you can use the same alias, just replace the space
    after `alias` with an equal sign.

Okay so if you use those aliases, you can do...

```
head -c 4 /dev/random | hd
# 7933b80d
```

Conclusion
-----

It's not that hard to deal with binary data on the command line if you know just a few commands, especially if what you want is encoded binary data.
Most of this should work on any POSIX system.
I ran the above in [fish shell](https://fishshell.com/) because that's what I use on my Mac, and it's not even POSIX-compatible.
If you want to learn more about using bash, I can't recommend Julia Evans's [Bite Sized Bash](https://wizardzines.com/zines/bite-size-bash/) highly enough.
She writes in a way that's not hostile to beginners, but finds a way to pack in helpful information so that I always learn something from her comics (she inspired me to write this post).

So yeah, happy randomizing!
