struct item {
    int size;
    int val;
};

// taken from http://rosettacode.org/wiki/Knapsack_problem/0-1
struct item items[] = {
{9, 150},
{13, 35},
{153, 200},
{50, 160},
{15, 60},
{68, 45},
{27, 60},
{39, 40},
{23, 30},
{52, 10},
{11, 70},
{32, 30},
{24, 15},
{48, 10},
{73, 40},
{42, 70},
{43, 75},
{22, 80},
{7, 20},
{18, 12},
{4, 50},
{30, 10}}; 

int N = 22; // counted from above

int knap(int cap)
  { int i, space, max, t;
    for (i = 0, max = 0; i < N; i++)
      if ((space = cap-items[i].size) >= 0)
        if ((t = knap(space) + items[i].val) > max) 
          max = t;
    return max;     
  }
