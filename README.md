# Nakamoto Translator

The Nakamoto Translator is a Ruby module for converting Latin characters into a custom set of Japanese characters and vice versa. It can playfully reinterpret names like "Hal Finney" into a set of characters that are not intended to represent their actual Japanese translation, but rather a creative representation when read as if they were Latin letters.

## Usage
The module provides four main functions:

```#from_latin_to_nakamoto(original_string):```
Converts a string from Latin characters to the Nakamoto character set. For example, "hal finey" becomes "サトし なカモと".

```#from_nakamoto_to_latin(original_string):```
Converts a string from the Nakamoto character set to lowercase Latin characters. For example, "サトし なカモと" becomes "hal finey".

```#from_nakamoto_to_japanese(nakamoto_string):```
Interprets a string from the Nakamoto character set as if it were actual Japanese characters, translating it to Latin characters. For example, "サトし なカモと" becomes "satoshi nakamoto".

```#from_japanese_to_nakamoto(japanese_string):```
Converts Japanese text to the Nakamoto character set. For example, "satoshi nakamoto" becomes "サトし なカモと".

## Examples

```ruby
require 'nakamoto_translator'

NakamotoTranslator.from_latin_to_nakamoto("hal finey")
=> "サトし なカモと"

NakamotoTranslator.from_nakamoto_to_japanese("サトし なカモと")
=> "satoshi nakamoto"

NakamotoTranslator.from_japanese_to_nakamoto("satoshi nakamoto")
=> "サトし なカモと"

NakamotoTranslator.from_nakamoto_to_latin("サトし なカモと")
=> "hal finey"
```
