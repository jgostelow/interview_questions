# Overview

The goal of this exercise is to test a candidate's Ruby knowledge, problem solving ability, and their ability to learn new things.

The candidate will be expected to implement an API for text analysis.  It doesn't require knowledge of natural language processing techniques, but the candidate will probably wind up recreating some as we go along (text normalization, tokenization, etc.)  The basic setup is a (non-functional) Sinatra app with a single endpoint, `POST /text`.  There are two methods, `TextAnalyzer#semantic_analysis` and `TextAnalyzer#relevant_snippet`.  Each method has RDoc documentation describing inputs and outputs, and there are specs for each.

It's important to note: **the exercise is designed to take longer than 30 minutes.**  Be upfront with the candidate about this - it's expected that they won't finish, so there's no shame in leaving parts of the project undone.  We gave them a couple problems to tackle, in the hopes that they can pick the one they feel the most comfortable with and run with it.

## Do the specs completely cover the functionality, or are there additional curveballs we can give the candidate?

The specs are incomplete.  A couple of questions you can ask to get them to refine their program:

[ADVANCED] Try `TextAnalyzer#semantic_analysis('John Doe is just not a great tutor.  He could not help me figure out pivot tables.  My experience wasn't wonderful, and I won't be working with him again.')`.  This uses positive words (great, wonderful) but is a negative review.  Can they figure out how to incorporate words like "not" into their analysis?

[BASIC] Are they figuring out some way to normalize text?  (Lowercasing words will work for this exercise, you don't have to do anything fancy.)  Try `TextAnalyzer#relevant_snippet("Michael is awesome with math - he really knows algebra!  Seriously, though, he's great at this.  Calculus, Trigonometry, STATISTICS - he knows it all.", 40, ['math', 'algebra', 'calculus', 'trigonometry', 'statistics'])`.  They should pull out text with "Calculus, Trigonometry, STATISTICS", and not "math - he really knows algebra".

**Please add to the list above if you find a really good question during your interview.**

## FAQ

If the candidate is stuck trying to figure out how to split text up into words, this regex works well: `/[[:punct:][:space:]]/`  First, though, give them `/[[:space:]]/` and see if they improve it on their own first.  Use that with Ruby's `String#split` to get an array of words.

## Why Sinatra and not Rails?

Sinatra is a simple web framework for Ruby, like Flask for Python or Gin for Go.  The goal in using Sinatra is to figure out whether the candidate is comfortable with Ruby, or just with Rails.  Can they figure out what a POST request should look like outside of Rails?  Are they comfortable with the HTTP spec?

That said, most of the Sinatra setup has been done for them.  We handle app setup with things like go-skeleton and other templates, so this exercise is not designed to test their ability to build an app with a new framework from the ground up.  We just want to see if they can contribute to a project that uses a different framework.
