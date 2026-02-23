# Diátaxis

A systematic approach to technical documentation authoring.

## Diátaxis is a way of thinking about and doing documentation.

It prescribes approaches to content, architecture and form that emerge from a systematic approach to understanding the needs of documentation users.

Diátaxis identifies four distinct needs, and four corresponding forms of documentation - tutorials, how-to guides, technical reference and explanation. It places them in a systematic relationship, and proposes that documentation should itself be organised around the structures of those needs.

Diátaxis solves problems related to documentation content (what to write), style (how to write it) and architecture (how to organise it).

At the core of Diátaxis are the four different kinds of documentation it identifies. If you’re encountering Diátaxis for the first time, start with these pages.

Tutorials - learning-oriented experiences

How-to guides - goal-oriented directions

Reference - information-oriented technical description

Explanation - understanding-oriented discussion

Diátaxis prescribes principles that guide action. These translate into particular ways of working, with implications for documentation process and execution.


## Tutorials
A tutorial is an experience that takes place under the guidance of a tutor. A tutorial is always learning-oriented.

A tutorial is a practical activity, in which the student learns by doing something meaningful, towards some achievable goal.

A tutorial serves the user’s acquisition of skills and knowledge - their study. Its purpose is not to help the user get something done, but to help them learn.

### The language of tutorials
We …
The first-person plural affirms the relationship between tutor and learner: you are not alone; we are in this together.

In this tutorial, we will …
Describe what the learner will accomplish.

First, do x. Now, do y. Now that you have done y, do z.
No room for ambiguity or doubt.

We must always do x before we do y because… (see Explanation for more details).
Provide minimal explanation of actions in the most basic language possible. Link to more detailed explanation.

The output should look something like …
Give your learner clear expectations.

Notice that … Remember that … Let’s check …
Give your learner plenty of clues to help confirm they are on the right track and orient themselves.

You have built a secure, three-layer hylomorphic stasis engine…
Describe (and admire, in a mild way) what your learner has accomplished.

## How-to guides
How-to guides are directions that guide the reader through a problem or towards a result. How-to guides are goal-oriented.

A how-to guide helps the user get something done, correctly and safely; it guides the user’s action.

It’s concerned with work - navigating from one side to the other of a real-world problem-field.

Examples could be: how to calibrate the radar array; how to use fixtures in pytest; how to configure reconnection back-off policies. On the other hand, how to build a web application is not - that’s not addressing a specific goal or problem, it’s a vastly open-ended sphere of skill.

### The language of how-to guides
This guide shows you how to…
Describe clearly the problem or task that the guide shows the user how to solve.

If you want x, do y. To achieve w, do z.
Use conditional imperatives.

Refer to the x reference guide for a full list of options.
Don’t pollute your practical how-to guide with every possible thing the user might do related to x.

## Reference
Reference guides are technical descriptions of the machinery and how to operate it. Reference material is information-oriented.

Reference material contains propositional or theoretical knowledge that a user looks to in their work.

The only purpose of a reference guide is to describe, as succinctly as possible, and in an orderly way. Whereas the content of tutorials and how-to guides are led by needs of the user, reference material is led by the product it describes.

In the case of software, reference guides describe the software itself - APIs, classes, functions and so on - and how to use them.

### The language of reference guides
Django’s default logging configuration inherits Python’s defaults. It’s available as django.utils.log.DEFAULT_LOGGING and defined in django/utils/log.py
State facts about the machinery and its behaviour.

Sub-commands are: a, b, c, d, e, f.
List commands, options, operations, features, flags, limitations, error messages, etc.

You must use a. You must not apply b unless c. Never d.
Provide warnings where appropriate.

## Explanation
Explanation is a discursive treatment of a subject, that permits reflection. Explanation is understanding-oriented.

Explanation deepens and broadens the reader’s understanding of a subject. It brings clarity, light and context.

The concept of reflection is important. Reflection occurs after something else, and depends on something else, yet at the same time brings something new - shines a new light - on the subject matter.

The perspective of explanation is higher and wider than that of the other three types. It does not take the user’s eye-level view, as in a how-to guide, or a close-up view of the machinery, like reference material. Its scope in each case is a topic - “an area of knowledge”, that somehow has to be bounded in a reasonable, meaningful way.

For the user, explanation joins things together. It’s an answer to the question: Can you tell me about …?

### The language of explanation
The reason for x is because historically, y …
Explain.

W is better than z, because …
Offer judgements and even opinions where appropriate..

An x in system y is analogous to a w in system z. However …
Provide context that helps the reader.

Some users prefer w (because z). This can be a good approach, but…
Weigh up alternatives.

An x interacts with a y as follows: …
Unfold the machinery’s internal secrets, to help understand why something does what it does.

