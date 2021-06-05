# text-analyzer

## Overview

This contains an API for performing sentiment analysis and extracting relevant data from a piece of text.

It contains on endpoint which takes in text, a number of characters, and some relevant terms, and returns the most relevant part of the text.  It will also determine if the text is positive, negative, or neutral.  For example:

```
POST /text HTTP/1.1
Host: localhost:4567
Content-Type: application/json
Cache-Control: no-cache

{
	"text": "Micah is a really big help with all my math assignments.  His mastery of math is really great, especially on difficult concepts like fractions.",
	"num_chars": 30,
	"relevant_words": [
		"math",
		"help"
	]
}
```

Should return something like:

```json
{
    "semantic_analysis": "positive",
    "relevant_snippet": "really big help with all my math"
}
```

## Problem

You will need to implement some sentiment analysis (determining whether the text is positive, negative, or neutral) and a way to extract a relevant snippet from the text.

The criteria for `most relevant` snippet is this:

	- A substring of at or over N characters (the substring may go over N characters to avoid splitting a word)
	- With the greatest number of `relevant_words` included in the substring

Don't worry about finishing the problem - it's designed to take more time than we have.

The two functions you need to work on are in `lib/text_analyzer.rb`.  The code for the Sinatra server is in `lib/text_analyzer/app.rb`.

There are some tests for you already; you can run `make test` to see whether you pass or not.

To start the server, execute `make run`.