#include <iostream>
using namespace std;
int main(void)
{
	int points = 0;
	string value = "";
	cout << "Enter calories, steps or distance: ";
	cin >> value;
	cout << "Enter total: ";
	cin >> points;
if (value == "calories" || value == "steps")
{ 
	points = points/10;
}
else if (value == "distance")
{ 
	points*=10;
}
else 
{
	cout << "error";
}
cout << points + "points";
return 0;
}
