## OVERVIEW

This repository is a collection of various Polyglot files which provide a resource for those interested in exploring benign polyglots and the programming techniques used to create them. 

Polyglot files are files which are valid in more than one format simultaneously (ex. both JPEG and PDF at the same time). Polyglot files often come as programs which essentially are single files
which contain valid syntax for multiple languages, as seen in this wikipedia example here: https://en.wikipedia.org/wiki/Polyglot_(computing). 

Far from being purely curious oddities for software hobbyists, polyglots are of significant academic research interest, as these files are often used to sidestep and evade malware detection tools. 

Many malware analysis tools rely on analyzing files based on their filetype, which is exactly the target polyglot files aim to exploit, as they can hide malicious paylod which otheriwse may be detected. 
There are many GitHub repositories dedicated to more "classic" polyglots. This repository aims to focus on a specific subgroup which will be explained in subsequent paragraphs. 

Polyglots often contain malicious payload directly in the file, obfuscated by cleverly manipulating the syntax of more than one file format.

Consider a polyglot which **generates** malicious payload during runtime. These variants are infeasible to reliably detect with static analysis approaches alone since the code that will ultimately be malicious has not yet even been created, yet alone executed. Such a file may be not only valid in more than one format, but may **dynamically** morph into another format at runtime, generate other files, modify its own source code, and ultimately delete itself. The possible variations on this theme are enormous. 

### Repository Goals

- Collect and organize benign polyglots to creatively explore what techniques can be used to create these files, with an emphasis on those which use various metaprogramming techniques at both compile time and runtime. 

### Repository Polyglot Categorization 

1) DynamicChain - Scripts which use generative and/or reflexive metaprogramming techniques to create a series of files which form an "execution chain". These files will generate file A in one language, and file A will contain all the code needed to generate file B from A alone and so on.
   
2) SelfMorph - Scripts which start off as one or more valid file formats, and then during runtime, change their format into one or more *other* valid format.

3) RecursiveMorph - Scripts which specifically use recursion and/or co-recursion *only* to change from their initial format(s) into other formats during *each* recursive or co-recursive call.

#### Repository Notes

I will include explanations of the goals of each Polyglot file, and aim to make each one as unique as possible from others. In the event including the explanations within the files themselves as comments, I will append this README and in the future provide an improved way to organize and categorize these files. 

Please do not hesitate to request (challenge?) me with specific file extensions and languages (will even do Java). 
