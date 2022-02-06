int fib(int n)
{
    if (n == 0) return 0;
        
    int prevPrev = 0;
    int prev = 1;
    int result = 0;
 
    while (n > 0)
    {
        n--;
        result = prev + prevPrev;
        prevPrev = prev;
        prev = result;
    }
    return result;
}
