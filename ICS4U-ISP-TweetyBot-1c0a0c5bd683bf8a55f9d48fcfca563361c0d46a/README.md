# Grade 12 Computer Science ISP

Overall expectations being assessed in this independent study project:

* A1. 	demonstrate the ability to use different data types and expressions when creating computer programs;
* A2. 	describe and use modular programming concepts and principles in the creation of computer programs;
* A4. 	use proper code maintenance techniques when creating computer programs.
* B1. 	demonstrate the ability to manage the software development process effectively, through all of its stages – planning, development ... and closing;
* B2. 	apply standard project management techniques in the context of a student-managed ... project.
* C1. 	demonstrate the ability to apply modular design concepts in computer programs;

In all phases of this ISP, you will be guided by an exemplar produced by Mr. Gordon.

The emphasis in this ISP is on understanding and applying the process of software development. The greatest success has historically come to students who plan their deliverables according to a manageeable schedule and stick to their plan.

## Scope

Aim to create a modest application that solves a problem you care about. If you solve the problem well, it is highly likely that others will find your application useful as well. Challenge yourself with something new, but avoid overreaching.

## Due dates

Planning, development, and closing will occur by the start of March Break. You can set due dates for deliverables in your project. You are strongly recommended to plan deliverable dates by working around due dates for deliverables in your other classes.

Note that you will be granted significant opportunities to work in class, but that there is, like any Grade 12 university preparation course, an expectation that work be completed outside of class time as well.

## Proposal

Modify this document and add your responses to the following prompts below.

### What problem will your application solve?

*Write a paragraph to describe the utility of your application. This applies equally for games. When would someone use your application? Why would they use your application?*

I will be building a Twitter bot that leverages a Markov Chain algorithm to generate tweets that are fairly realistic. My bot, being based on a Markov Chain algorithm will be fairly versatile, as it's source text can be updated to allow it to imitate the style of the writer of the text. Markov Chain based twitter bots are know in the bot making community as literary bots, and can be among the most amusing of twitter bots when the algorithm is implemented well. My initial idea for the bot is to have it draw from fake and sensationalist news to synthesis new and outrageous "News" and parody it's ridiculous source material. To generate a tweet, the bot will randomly select between a variety of text files derived from fake/Sensationalist news, and then execute the Markov Chain algorithm to build a word probability library, and then generate the tweet. The output of the bot will vary depending on which set of source text it has chosen on that iteration, thus generating a variety of different absurd content to post to twitter.

While this bot does not solve any specific problems, and is not particularly useful, I think that in an age so heavily dominated by sensationalized and fake news stories, it will hopefully serve as a relevant parody of some of the terrible news content posted to the internet.

### What is your inspiration for this project?

*Have you seen another application that you wish to improve on? Has someone asked you to create this?*

I was inspired to make a Twitter bot when I was planning how to make a messenger app during software class, and Mr. Gordon said aloud that he hoped someone would finish the Markov Chain project from last year and make a Twitter bot out of it. I knew that I wanted to make something that interacted with the Internet, and a Twitter bot seemed like a great way to mess around with a social media API and learn a bit more about learning algorithms like the Markov Chain. I was inspired to create a bot that posts fake news by all of the ridiculous claims that the Trump administration and their acolytes have been making on social media. I initially wanted to create a fact-checker bot that fact checked tweets by suspect accounts, and called them out if they were proliferating falsehoods. I decided against that though because I have never coded a Twitter bot, and Mr. Gordon suggested that I stick with a Markov Chain driven bot.  

### What is your prior experience in this area?

*Have you written an application like this before? Have you made use of any required APIs before?*

Building this bot will require the use of swift, the Twitter API, and the Markov Chain Algorithm. I have no experience with the Twitter API, but I have made a Markov Chain driven text generator in Swift before. I think learning how to use the Twitter API should prove interesting.

### What are skills do you hope to acquire by completing this project?

*For example, you might be writing a networked application for the first time. Or, you may be writing an application that requires a particularly well designed user interface. Describe what you expect to learn by writing this application.*

I chose to undertake this project to learn more about how social media APIs can be used. I'd like to get good at interfacing with the Twitter API, and in doing to so hopefully acquire some coding skills that are transferrable to other APIs. Hopefully I can learn more about coding apps that interact with the internet through this project, as I can potentially see myself making connected app for my group project. I'm also fascinated by complex algorithms, and while the Markov Chain is pretty simple, I would still like to learn more about it.

### What dependencies, if any, will be required to complete your project?

*If you are writing a networked application, you might be using an API like Alamofire to simplify that part of the implementation. If you are writing an application that communicates over Bluetooth, you may be using the Core Bluetooth framework. Please list any expected dependencies for your project.*

This app will require the Twitter API, and possibly a network connection management framework (though I am not yet certain)

### Rate the personal difficulty level of this project.

The algorithm for this project shouldn't be too tricky given that I spent some time working with a very simple version of it last year. The hard part will be interfacing with Twitter, as in my research I have yet to find many guides on building Twitter bots using swift. I think overall this project will be difficult, to very difficult, depending on how hard it ends up being to find good documentation of swift Twitter bots.

### Identify what you think your biggest challenge for successfully completing this ISP will be.

As I stated above, I think the general lack of popularity of swift-based Twitter bots will make it difficult to get information on how to interface with Twitter. If I can get around that hurdle, I think the rest should be within my abilities.

### Markov Chains For Dummies!

My twitter bot will rely heavily on data models derived using a Markov Chain. The Markov Chain is a mathematical system that jumps between a set of state in accordance with the probability attached to each of the possible jumps. This mathematical construct was conceived by Andrey Markov and can be used to model probabilltiy driven decision making when there a lot of possible choices. The markov chain can be described as a 'pointer' that begins at a seed state, and then has a set probabillity of moving to a number of other states, or staying put. For example, ina  two state system the pointer might begin on state A and have a 70% chance of moving to state B, and a 30% chance of remaining at A. Once at B there will be an X% probabillity of moving back to A, and a Y% probabillity of staying put. This decision making structure can be scaled up and applied to choosing what word should follow a seed word by calculating the frequency of all possible words occuring after the seed word, and then using that to calculate their probabillity of being the next state of the chain. The 'pointer in this scenario is whatever word has just been selected, and the possible state changes are all of the words in the source text that occur after that pointer word at least once. Due to the output string of words' origin in actual probabillities derived form a source text, the string will resemble a sentence that could possibly be a member of the source text. I will apply this to my bot by creating a markov chain algorithm that operates on source text taken from the sub-par tweets of select news organizations, to generate a tweet simmilar to something the orignial source might tweet. 

The below diagram shows what a three state chain might look like.

![Markov Chain](https://raw.githubusercontent.com/rsgc-mccutcheon-m/ICS4U-ISP-TweetyBot/577ad27d8415db9afb444a20d8892edd27d53af9/CixTo.png)


Note from Mr. Gordon: Could you take some time here to expand on your understanding of the Markov Chain algorithm and how you would implement it? Create an example or two and walk yourself and the reader through how the algorithm works. Imagine a reader who is not a computer scientist but wants to understand how your program will work at a technical level.
