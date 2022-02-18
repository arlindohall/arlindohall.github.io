---
title: Miller Hall
description: The home page of my personal website describes who I am,
    what I do, and some of my latest projects.
---

About Me
=====

I am a software developer and tinkerer based in Herndon, Virginia.
Software is my job and my hobby, and my work and personal projects are listed below.
On the weekends I like to read (maybe don't check out my goodreads because I always forget to update it) and take walks with my wife and my dog.
I'm originally from North Carolina, and I graduated from Clemson in 2016.
I love all things Carolinas: barbecue, the Appalachians, the Outer Banks, the NC music scene...

Work
-----

- I have been an SDE at AWS in Northern Virginia since 2017
- I spent three years on a team focused on software quality during the region build process
- I now work on building edge solutions custom-built to customer needs

Projects
-----

I've given up on most of these, as I prefer the peak of the dunning-kruger effect to the valleys.

<img class="image-center"
    src="/assets/dunning-kruger.jpg"
    title="LittleT889, CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0, via Wikimedia Commons"
    alt="Dunning-kruger effect graph, from wikimedia commons">
</img>

- I've started writing a toy interpreter for the Lua language in Go as a way to try to learn Go, to compare the performance of a tree-walk intepreter and a bytecode machine, and to apply what I learned from the two below projects. The language is called [`glua`](https://github.com/arlindohall/glua) and it's still in-progress. I have more details [here](/posts/glua-a-toy-lua-interpreter.html)
- I'm working through the book [_Crafting Interpreters_](https://craftinginterpreters.com) in Rust. I build a functioning tree-walk interpreter, but it's really slow because of the incredibly simple memory management and the fact that I clone some large data types rather than deal with lifetimes. It was my first rust projec though, and I learned a lot: [rlox](https://github.com/arlindohall/rlox)
- I've now started the bytecode interpreter from _Crafting Interpreters_ in Rust after following the C implementation. This one I'm a little more proud of: [clox](https://github.com/arlindohall/clox)
- I'm mentoring a Clemson University senior capstone team to build a sign-in console for the Clemson Makerspace. The code isn't open-sourced yet but we are planning to do so.
