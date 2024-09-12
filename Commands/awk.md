# AWK  
------

## Basic Structure
---
> normal form

    pattern { action }

> before any lines are read   
> if condition is true   
> after the last line is read

    BEGIN { print "START" }

          { print         } 

    END   { print "STOP"  }
    

> $ = refer to a field/col in the current line

    BEGIN { print "File\tOwner"}
    { print $8, "\t", $3 }
    END   { print " - DONE -" }


     
        
         
> AWK Table (lawrence_welk ~ /(one|two|three)/)


| | Regular Expression Operators |
|--------|----------------------|
| Operator	    |      Meaning   |
|~	|Matches|
|!~	|Doesn't match|


