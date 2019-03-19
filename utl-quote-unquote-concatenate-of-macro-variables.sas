Quote, unquote and concatenate of macro variables                                                        
                                                                                                         
                                                                                                         
SAS Forum                                                                                                
http://tinyurl.com/y6osky8q                                                                              
https://communities.sas.com/t5/SAS-Programming/quote-unquote-concatenate-of-macro-variables/m-p/544303   
                                                                                                         
                                                                                                         
The quotes are useful                                                                                    
                                                                                                         
                                                                                                         
INPUT                                                                                                    
=====                                                                                                    
                                                                                                         
 %LET BRA ="ALL";                                                                                        
 %LET PRO1="AB" ;                                                                                        
 %LET PRO2="CD" ;                                                                                        
                                                                                                         
I need to inset                                                                                          
                                                                                                         
     ALL into position 1                                                                                 
     AB  into position 2                                                                                 
     CD  into position 3                                                                                 
                         1                 2 3                                                           
O:\Arne\OUTINSIGHTS\heat__retail_2017_2018____.htm                                                       
                                                                                                         
OUTPUT                                                                                                   
======                                                                                                   
                                                                                                         
Macro variable want                 2                    2  3                                            
                                   ---                  -- --                                            
%let want=O:\Arne\OUTINSIGHTS\heat_ALL_retail_2017_2018_AB_CD.htm                                        
                                                                                                         
                                                                                                         
SOLUTION                                                                                                 
=========                                                                                                
                                                                                                         
%symdel want;                                                                                            
%let rc=%sysfunc(dosubl('                                                                                
   data _null_;                                                                                          
      want=cats("O:\Arne\OUTINSIGHTS\Heat_",&bra,"_RETAIL_2017_2018_",&pro1,"_",&pro2,".htm");           
      call symputx("want",want);                                                                         
   '));                                                                                                  
run;quit;                                                                                                
                                                                                                         
%put &=want;                                                                                             
                                                                                                         
