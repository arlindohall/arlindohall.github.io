---
title: "Glua: a toy lua interpreter"
description: A dive into the design of and motivations behind Glua
date: November 29, 2021
---

Glua: a toy lua interpreter
===

I admire Lua as a language because of its simplicity, and though I don't use it for much (except a now-abandoned attempt at Advent of code a few years ago), I know it was the inspiration for a lot of the cool features of the interpreters in the book _Crafting Interpreters_, which I've worked through, and I'd like to see how I would implement some of those language features without peeking at Lua's own design decisions.

This is really just an experiment to learn more about the extent of my knowledge of interpreters, and to go back and compare my decisions to some of Lua's to see where I can improve that knowledge. One thing I'll own up to up front is that I'll be ignoring almost all garbage collector–related features since I can just punt those issues to Go. I am excited to try to implement [weak tables](https://www.lua.org/pil/17.html) in a language that handles its own GC without a similar feature, but I haven't started planning that out yet.