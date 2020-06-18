A [Jekyll](https://github.com/jekyll/jekyll) plugin to color your braces according to depth!

Usage: `{{content | markdownify | rainbowify[ : wrapDepth]}}`.

It doesn't have to be `markdownify` specifically, but you need to pass the `content` to `rainbowify` *after* the Liquid has been parsed out of it, otherwise it will try to put the HTML `span`s around each of the `{{`braces`}}` Liquid uses and wreck your careful formatting.

`wrapDepth` defines how many levels of nesting are allowed before `rainbowify` starts wrapping the numbers around in the `class`es it applies to the braces. The default is 8. The generated class names take the form `brace-depth-{depth}`. Check out `_sass/rainbowbraces.scss` to see what targeting them looks like.
