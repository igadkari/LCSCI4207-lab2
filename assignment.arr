
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

