# Why documentation is important

Why Documentation is the most important skill you can have as a developer.

## Why is documentation important?

As I think back on my as-yet short career as a developer, the number one problem I've had across my four teams has always been poor documentation.
I've worked on the problem of region parity and region builds, which is in large part a problem of coordination across teams, which obviously would benefit from better documentation.
I've worked on building out existing AWS services in new regions when the team could not do so, and the biggest issues I faced there was not understanding the different components of the service or the requirements to get it running in-region.
And I've worked on building new services, at the edge (my current team), and using custom hardware (when I helped launch AWS Ground Station), where having more wholistic documentation was the one thing that could have sped up my work.
In all of these cases, the biggest barrier to my learning and the teams' success was a a way to more quickly understand the architecture decisions of existing teams, and a more thorough public record of the decisions these teams had made.

If I make a new web service, let's say a simple CRUD app, obviously my first priority should be to provide some value to users of the app.
Assuming I do get users and buy-in from the app, my next priority should be to document the app, its architecture, dependencies, and requirements to start it up on a new machine/prod environment/development environment.
That's a pretty strong statement, but there's a few common situations that would merit this sort of investment.

1. I leave my company or my team and others are responsible for continuing development of my project
1. Another team takes over operation of my project
1. I leave my project for a time and come back for some critical change
1. My project expands and a new member joins my team and needs to get started
1. My project gets a bunch of org-internal customers (or gets open-sourced) and people are interested in how it works because they use it extensively day-to-day
1. My project gets widely adopted and non-technical users, or users who don't or can't know the internals of the app, who need to know how to use the app

All of this feeds into the reason that documentation is so important.
If you don't have good documentation, each of the above items becomes a way your project can fail.
If it's not supportable or usable, then your project isn't good, no matter how good you are at writing code or how many improvements you made to the logic, or even how innovative your idea is.
If users can't user your code, and you can't grow your team to build out your service, then you're going to have a hard time even getting off the ground.

## What does good documentation look like?

For one thing, good documentation answers broad, general questions.
Good documentation also probably follows a narrative structure to make it easier to read.
The best documentation also has an index and/or a search functionality that you can use to quickly find a specific component.

Good documentation is in exactly one spot.

The rust documentation, written with `mdbook` is a great example, and `mdbook` is an awesome tool for building docs.

Good documentation also doesn't give short, obvious descriptions of each individual API method.
The methods themselves should be named in a way to provide this information.
The documentation should be written with an eye to someone trying to figure out *why* they would call that method, not what the method does.

Good documentation is focused on one specific user.
In the above section, I listed a few use cases for my documentation.
Each one should correspond to a page or section in the docs where I list out the user workflow for that person.
For the new user, I should describe the architecture (this can be shared with the curious technical user), the components, the requirements to set up a development server, and how to submit and get approval for a change.
For a non-technical user, I want to provide an overview of the capabilities of my app and means to resolve common errors and interact with the service.

## Some rules for good documentation

1. All named resources are referenced with hyperlinks
    - This includes classes and methods in code, cloud resources such as buckets and servers, and CD resources such as pipelines and topic subscriptions
1. Images are labeled and use consistent icons
1. Boundaries in diagrams are consistent within the diagram
    - For example, if a box represents a host, and inside there is a box representing a process, all other second-level boxes should represent processes
    - Use circles or dashed boxes for, for example, files in the same diagram
1. Documentation is hosed on a separate website using a documentation tool like `javadoc`, `rdoc`, or `mdbook`
    - In order to host multiple kinds of documentation, you probably need a splash page that is the root of all the docs, that includes links to all the doc pages, one for each kinds of user of your system
    - Don't rely on your CD tool or code repositories to host the pages because latency in that tool or an issue with your build process could prevent access to the docs at a critical moment
    - The means for hosting this should be easy to update and heavily linked to your source where possible to encourage keeping the content up-to-date