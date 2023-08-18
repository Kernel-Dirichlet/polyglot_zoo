#!/bin/bash
echo "Hello, world! (I am a shell file!)"
echo "print('Hello, World! (I am a python file!)')" > hello.py
echo "hello_c = 'Hello world! (I am a C file!)'" >> hello.py
echo "f = open('hello.c','w')" >> hello.py
echo "f.write('#include <stdio.h>\n')" >> hello.py
echo "f.write('int main() {\n')" >> hello.py
echo "f.write('\t printf("\"{}"\");'.format(hello_c))" >> hello.py
echo "f.write('\n\t return 0;')" >> hello.py
echo "f.write('\n}')" >> hello.py 
echo "f.close()" >> hello.py

php_map() { 
    
    PHP_HEADER="/*" #Note that this will actually write a list of current directories to the PHP file. 
    PHP_FOOTER="*/"
    
    #you could further obfuscate the PHP contents by running $(cat hello.x >> new.php) into the PHP file, as the entire file is just a comment 
    
    echo ${PHP_HEADER} > new.php
    cat $0 >> new.php
    echo ${PHP_FOOTER} >> new.php
    for i in $(seq 1 10); do 
      CONTENTS=$(cat new.php)
      echo ${PHP_HEADER} > "new-$i.php"
      echo "${CONTENTS}" >> "new-$i.php"
      echo "${PHP_FOOTER}" >> "new-$i.php"
      cat "new-$i".php 
      cat hello 
      php "new-$i".php 
     
    done 
    
    
}
static_chain_execute() {
    
    (cat $0 | sed -n '5,13p') > hello.sh 
    #This function executes the generated programs from this shell script during execution  
    SHELL_CONTENTS=$(cat hello.sh)
    PYTHON_CONTENTS=$(cat hello.py)
    C_CONTENTS=$(cat hello.c)
    echo "===== SHELL CONTENTS ====="
    echo ${SHELL_CONTENTS}
    bash hello.sh 
    echo "===== PYTHON CONTENTS ====="
    echo ${PYTHON_CONTENTS}
    python3 hello.py 
    echo "===== C CONTENTS ====="
    echo ${C_CONTENTS} 
    gcc hello.c -o hello && ./hello
    php_map 
   
    
    
}
dynamic_chain_execute() { 
    
    #This function calls the next "linked" program in the chain, deleting itself first
    #First we append the shell code, because we want hello.sh to generate hello.py, not the current script
    #we generate a helper function for parsing...
    
    #First we will append the hello.py file, which doesn't affect earlier code because this function is only called conditionally
    #we will use the native subprocess module to call a shell command to run the hello.c program 
    
    (cat $0 | sed -n '5,13p') > hello.sh 
    echo "#import subprocess" >> hello.sh
    echo "#cmd = 'gcc hello.c -o hello && ./hello'" >> hello.sh #here we combine the compile and execution commands into a single shell command like before 
    echo "#subprocess.run(cmd,shell=True)" >> hello.sh
    
     
    #bash hello.sh && (grep '^#' hello.sh | sed 's/^#//') >> hello.py && rm hello.sh && python3 hello.py && rm hello.py && rm hello.c - single line command of below
    
    bash hello.sh && (grep '^#' hello.sh | sed 's/^#//') >> hello.py #executes shell script, which pipes grep filtering and calls hello.py
    rm hello.sh #removes hello.sh before calling hello.py 
    python3 hello.py #runs hello.py
    rm hello.py #removes hello.py 
    rm hello.c #removes hello.c which was executed already from hello.py 
    #ls -A  ##uncomment to verify all the files have been removed 
    
    #finally, we turn this script into a PHP file at the end. 
    
    PHP_HEADER="/*" #Note that this will actually write a list of current directories to the PHP file
    PHP_FOOTER="*/"
    
    #you could further obfuscate the PHP contents by running $(cat hello.x >> new.php) into the PHP file, as the entire file is just a comment 
    php_map 
    #rm $0 #removes current script, leaving behind only the PHP file
    
    
}
static_chain_execute #bells are ringing ;) 