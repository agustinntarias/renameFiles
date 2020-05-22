# This bash script renames all files under a 
# certain directory as follows:
# if the file is named as word(number) then 
# we change this to word0..0(number) where
# the number of 0's plus number is 3.

#######Explanation
# exp1='\(^.*\)\([^0-9]\)\([0-9]\)$'
# exp2='\(^.*\)\([^0-9]\)\([0-9]\{2\}\)$'
# sed "/$exp1/ s/$exp1/\1\200\3/; /$exp2/ s/$exp2/\1\20\3/"

# I will explain the sed command:
# we begin with sed "/$exp1/ s/$exp1/\1\200\3/; /$exp2/ s/$exp2/\1\20\3/"
# this matches $exp1 and replaces it with \1\200\3 or matches 
# $exp2 and matches it with \1\20\3. They are separated by a semicolon (;).

# Now we will analyze each s/// command:
# s / $exp1 / sub1
# where exp1 = '\(^.*\)\([^0-9]\)\([0-9]\)$'
# and sub1 = \1\200\3

# We have exp1 = \(^ .* \)   \( [^0-9] \)   \( [0-9] \)   $
# ^: indicates the beggining of the string
# $: indicates the end of the string
# \( and \) : anything between these parentheses will be accessible
#   latter as \1, \2,... according to their order of appearance
# [0-9]: this matches any character that is either 0, 1,... or 9.
# [^0-9]: this matches any chacter that is not 0 nor 1, ... nor 9.
# ^.*: starts at the beginning of the line and matches anything (.) 0 or more times (*) until it finds the next group 
# NOTE: note that this regex works for any string containning numbers before the last digit (or digits). 
# For example if the input is advent0fc0d3s9, the output will put a 0 between the last 9 and the "s" so that output = advent0fc0d3s09.

# We have sub1  = \1  \2  00  \3
# \1,\2,\3: these commands access the 1st, 2nd and 3rd group of characters matched in expression1 respectively
# 00: this just inserts "00" between the second and third group.

# Similarly we have:
# exp2 = '\(   ^.*  \)  \(  [^0-9]  \)  \(  [0-9]  \{2\}  \)  $'
# sub2 =\1 \2 0  \3
# The only noticeable change is the "\{2\} part, which indicates that 
# the preceeding character (namely, [0-9]) must be repeated twice (counting
# first occurrence.



