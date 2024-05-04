#include <mylib/Add.hpp>

#include <iostream>
#include <string>


int main(int argv, char** argc)
{
    if (argv != 3)
    {
        std::cerr << "Invalid parameters\nmyapp [int] [int]\n";
        return 1;
    }

    int a = std::stoi(argc[1ul]);
    int b = std::stoi(argc[2ul]);

    auto result = mylib::Add(a, b);

    std::cout << argc[1ul] << " + " << argc[2ul] << " = " << result << '\n';
    return 0;
}
