# Why documentation is important

*(Work in Progress)*

Why Documentation is the most important skill you can have as a developer.

## Why is documentation important on its own?

As I think back on my as-yet short career as a developer, the number one problem I've had across my four teams has always been poor documentation.

## What does good documentation look like?

For one thing, good documentation answers broad, general questions.
Good documentation also probably follows a narrative structure to make it easier to read.
The best documentation also has an index and/or a search functionality that you can use to quickly find a specific component.

Good documentation is in exactly one spot.

The rust documentation, written with `mdbook` is a great example, and `mdbook` is an awesome tool for building docs.
In fact I've (TODO) built parts of this very website with `mdbook`, specifically the docs section that shows how to build and deploy this website, and the decisions I made in setting it up.

## Some rules for good documentation

1. All named resources are referenced with hyperlinks
1. Images are labeled and use consistent icons
1. Boundaries in diagrams are consistent within the diagram
    - For example, if a box represents a host, and inside there is a
      box representing a process, all other second-level boxes should
      represent processes. Use circles or dashed boxes for, for example,
      files in the same diagram.