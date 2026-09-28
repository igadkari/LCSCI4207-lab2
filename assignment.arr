import file("lab2-support.arr") as support # Week 2 Lab: Encryptors # # I experimented with each encryptor using different inputs, including # empty strings, single letters, mixed case, punctuation, digits, and spaces. # I compared the outputs to determine what each encryptor does. # ---------------- Experiment Log ---------------- # Encryptor 1 # Experiment: "hello" -> "hellohellohellohellohello" # Experiment: "a" -> "aaaaa" # Experiment: "" -> "" # Conclusion: The string is repeated 5 times. # Encryptor 2 # Experiment: "hello" -> "hell" # Experiment: "Hello, World!" -> "Hell" # Experiment: "" -> error # Conclusion: It returns the first 4 characters using string-substring. # Encryptor 3 # Experiment: "hello" -> "hello" # Experiment: "Hello, World!" -> "Hello, World!" # Experiment: "hello world." -> "hello world!" # Conclusion: Every period is replaced with an exclamation mark. # Encryptor 4 # Experiment: "hello" -> "hellhellhellhellhell" # Experiment: "Hello, World!" -> "HellHellHellHellHell" # Conclusion: It takes the first 4 characters and repeats them 5 times. # Encryptor 5 # Experiment: "hello" -> "hfllp" # Experiment: "abc123, Hi!" -> "bbc123, Hj!" # Experiment: "AEIOU" -> "BFJPV" # Experiment: "umbrella" -> "vmbrfllb" # Conclusion: Every vowel, upper or lower case, becomes the next letter. # a -> b, e -> f, i -> j, o -> p, u -> v # A -> B, E -> F, I -> J, O -> P, U -> V # Encryptor 6 # Experiment: "Hello, World!" -> "hello, wold!" # Conclusion: The string is changed to lowercase and every r is removed. # Encryptor 7 # Experiment: "hello" -> 5 # Experiment: "Hello, World!" -> 13 # Conclusion: It returns the length of the string as a Number. # Encryptor 8 # Experiment: "hello" -> "hello!!!hello!!!hello!!!" # Conclusion: It adds "!!!" to the end of the string and repeats the result 3 times. # Encryptor 9 # Experiment: "cat" -> 99 # Experiment: "cats" -> 99 # Experiment: "catalog" -> 99 # Experiment: "catastrophe" -> 99 # Conclusion: It returns the code of the first character. # The code for "c" is 99. # Encryptor 10 # Experiment: "Horse and cart" -> "hpsfhpsfhpsfhpsfhpsf" # Conclusion: The string is first lowercased and r is removed. # Then periods are changed to !, vowels are changed to the next letter, # and the first 4 characters are repeated 5 times. # # Experiment: "a.bcd" -> "b!bcb!bcb!bcb!bcb!bc" # Conclusion: The period is changed to ! before the first 4 characters # are selected and repeated. # # Experiment: "RRRRRR" -> error # Conclusion: Removing all r characters can leave a string that is too # short for string-substring to take the first 4 characters. # # Final conclusion: Encryptor 10 chains encryptors 6, 3, 5, and 4 # in that order. # ---------------- Functions ---------------- fun my-encryptor1(s :: String) -> String: doc: "repeats the string 5 times" string-repeat(s, 5) end check: my-encryptor1('hello') is 'hellohellohellohellohello' my-encryptor1('a') is 'aaaaa' my-encryptor1('') is '' end fun my-encryptor2(s :: String) -> String: doc: "returns the first 4 characters of the string" string-substring(s, 0, 4) end check: my-encryptor2('hello') is 'hell' my-encryptor2('Hello, World!') is 'Hell' end fun my-encryptor3(s :: String) -> String: doc: "replaces every period with an exclamation mark" string-replace(s, '.', '!') end check: my-encryptor3('hello world.') is 'hello world!' my-encryptor3('hello') is 'hello' end fun my-encryptor4(s :: String) -> String: doc: "repeats the first 4 characters 5 times" string-repeat(string-substring(s, 0, 4), 5) end check: my-encryptor4('hello') is 'hellhellhellhellhell' my-encryptor4('Hello, World!') is 'HellHellHellHellHell' end fun my-encryptor5(s :: String) -> String: doc: "replaces each vowel with the next letter" a = string-replace(s, 'a', 'b') e = string-replace(a, 'e', 'f') i = string-replace(e, 'i', 'j') o = string-replace(i, 'o', 'p') u = string-replace(o, 'u', 'v') upper-a = string-replace(u, 'A', 'B') upper-e = string-replace(upper-a, 'E', 'F') upper-i = string-replace(upper-e, 'I', 'J') upper-o = string-replace(upper-i, 'O', 'P') string-replace(upper-o, 'U', 'V') end check: my-encryptor5('hello') is 'hfllp' my-encryptor5('AEIOU') is 'BFJPV' my-encryptor5('umbrella') is 'vmbrfllb' end fun my-encryptor6(s :: String) -> String: doc: "makes the string lowercase and removes every r" string-replace(string-to-lower(s), 'r', '') end check: my-encryptor6('Hello, World!') is 'hello, wold!' end fun my-encryptor7(s :: String) -> Number: doc: "returns the length of the string" string-length(s) end check: my-encryptor7('hello') is 5 my-encryptor7('Hello, World!') is 13 end fun my-encryptor8(s :: String) -> String: doc: "adds !!! to the end and repeats the result 3 times" string-repeat(s + '!!!', 3) end check: my-encryptor8('hello') is 'hello!!!hello!!!hello!!!' end fun my-encryptor9(s :: String) -> Number: doc: "returns the code of the first character" string-to-code-point(string-char-at(s, 0)) end check: my-encryptor9('cat') is 99 my-encryptor9('catalog') is 99 end fun my-encryptor10(s :: String) -> String: doc: "applies encryptors 6, 3, 5, and 4 in order" step1 = my-encryptor6(s) step2 = my-encryptor3(step1) step3 = my-encryptor5(step2) my-encryptor4(step3) end check: my-encryptor10('Horse and cart') is 'hpsfhpsfhpsfhpsfhpsf' my-encryptor10('a.bcd') is 'b!bcb!bcb!bcb!bcb!bc' end # ---------------- Support Testers ---------------- support.test-encryptor1(my-encryptor1) support.test-encryptor2(my-encryptor2) support.test-encryptor3(my-encryptor3) support.test-encryptor4(my-encryptor4) support.test-encryptor5(my-encryptor5) support.test-encryptor6(my-encryptor6) support.test-encryptor7(my-encryptor7) support.test-encryptor8(my-encryptor8) support.test-encryptor9(my-encryptor9) support.test-encryptor10(my-encryptor10)use context starter2024

import file("lab2-support.arr") as support

# Encryptor 1
# Repeats the string 5 times
fun my-encryptor1(s :: String) -> String:
  string-repeat(s, 5)
end

check:
  my-encryptor1('hello') is 'hellohellohellohellohello'
  my-encryptor1('a') is 'aaaaa'
  my-encryptor1('') is ''
end


# Encryptor 2
# Takes the first 4 characters
fun my-encryptor2(s :: String) -> String:
  string-substring(s, 0, 4)
end

check:
  my-encryptor2('hello') is 'hell'
  my-encryptor2('Hello, World!') is 'Hell'
end


# Encryptor 3
# Changes periods to exclamation marks
fun my-encryptor3(s :: String) -> String:
  string-replace(s, '.', '!')
end

check:
  my-encryptor3('hello world.') is 'hello world!'
  my-encryptor3('hello') is 'hello'
end


# Encryptor 4
# Repeats the first 4 characters 5 times
fun my-encryptor4(s :: String) -> String:
  string-repeat(string-substring(s, 0, 4), 5)
end

check:
  my-encryptor4('hello') is 'hellhellhellhellhell'
  my-encryptor4('Hello, World!') is 'HellHellHellHellHell'
end


# Encryptor 5
# Changes each vowel to the next letter
fun my-encryptor5(s :: String) -> String:
  s1 = string-replace(s, 'a', 'b')
  s2 = string-replace(s1, 'e', 'f')
  s3 = string-replace(s2, 'i', 'j')
  s4 = string-replace(s3, 'o', 'p')
  s5 = string-replace(s4, 'u', 'v')
  s6 = string-replace(s5, 'A', 'B')
  s7 = string-replace(s6, 'E', 'F')
  s8 = string-replace(s7, 'I', 'J')
  s9 = string-replace(s8, 'O', 'P')
  string-replace(s9, 'U', 'V')
end

check:
  my-encryptor5('hello') is 'hfllp'
  my-encryptor5('AEIOU') is 'BFJPV'
  my-encryptor5('umbrella') is 'vmbrfllb'
end


# Encryptor 6
# Makes the string lowercase and removes r
fun my-encryptor6(s :: String) -> String:
  string-replace(string-to-lower(s), 'r', '')
end

check:
  my-encryptor6('Hello, World!') is 'hello, wold!'
end


# Encryptor 7
# Returns the length of the string
fun my-encryptor7(s :: String) -> Number:
  string-length(s)
end

check:
  my-encryptor7('hello') is 5
  my-encryptor7('Hello, World!') is 13
end


# Encryptor 8
# Adds !!! and repeats it 3 times
fun my-encryptor8(s :: String) -> String:
  string-repeat(s + '!!!', 3)
end

check:
  my-encryptor8('hello') is 'hello!!!hello!!!hello!!!'
end


# Encryptor 9
# Returns the code of the first character
fun my-encryptor9(s :: String) -> Number:
  string-to-code-point(string-char-at(s, 0))
end

check:
  my-encryptor9('cat') is 99
  my-encryptor9('catalog') is 99
end


# Encryptor 10
# Uses encryptors 6, 3, 5, and 4
fun my-encryptor10(s :: String) -> String:
  a = my-encryptor6(s)
  b = my-encryptor3(a)
  c = my-encryptor5(b)
  my-encryptor4(c)
end

check:
  my-encryptor10('Horse and cart') is 'hpsfhpsfhpsfhpsfhpsf'
  my-encryptor10('a.bcd') is 'b!bcb!bcb!bcb!bcb!bc'
end


# Test the encryptors
support.test-encryptor1(my-encryptor1)
support.test-encryptor2(my-encryptor2)
support.test-encryptor3(my-encryptor3)
support.test-encryptor4(my-encryptor4)
support.test-encryptor5(my-encryptor5)
support.test-encryptor6(my-encryptor6)
support.test-encryptor7(my-encryptor7)
support.test-encryptor8(my-encryptor8)
support.test-encryptor9(my-encryptor9)
support.test-encryptor10(my-encryptor10)

