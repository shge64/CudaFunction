What we have done
Create a class (Simple.h) that contains a virtual function and another class (Vsimple.h) that extended from first one and try to run it in Cuda.

To run Cuda we downloaded and installed Cuda toolkit 10.0 and try to run our first code.
Then change the code and try to test virtual codes.

Knowledge gained:

__Global__    	a function that running in Host and run Device code
__device__   	a function that run and called from Device
__host__    	default value for all functions that called from host and run on host

Errors:
Code:		MSB3721: The command …. Exited with code 2
Solution:		Project/Properties/Cuda c++ /Common/Generate relocatable device code = Yes (-rdc=true)


Code:		MSB3721: The command …. exited with code 255
Solution:		Tools/Option/MsBuild project build output verbosity = Normal

Code:		Expected expression..	
Solution:		Project/Properties/Cuda toolkit Custom dir =  [path of cuda toolkit]



