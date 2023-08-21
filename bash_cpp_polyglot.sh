#!/bin/bash

bashcpp_polyglot() { 
    
    
    echo "#include <iostream>" > outfile
    echo "// > /dev/null 2>&1 || exit " >> outfile 
    echo "int main() { return 0; }" >> outfile
    }


bashcpp_polyglot
cp outfile outfile.sh #BASH script  
cp outfile outfile.cpp #C++ script 

bash outfile.sh
g++ outfile.cpp -o outfile_cpp 


# EXPLANATION 

# Line 1: BASH - treats entire line as comment, C++ treats as preprocessor directive 
# Line 2: BASH - "//" is root directory, and output is supressed and redirected to /dev/null, the "||" operator is "execute command on the right if left fails"
# -------- C++ - treats entire line as a comment 
# Line 3: BASH - exits before reaching this line, C++ main function (required)


