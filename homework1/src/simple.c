#include <time.h>
#include <stdlib.h>


int get_length(char* number)
{
   srand(time(NULL));   // Initialization, should only be called once.
   return strlen(number);
}