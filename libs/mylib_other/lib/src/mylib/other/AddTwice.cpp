#include "mylib/other/AddTwice.hpp"

#include "mylib/Add.hpp"


namespace mylib::other
{

int AddTwice(int a, int b) noexcept
{
    return Add(Add(a, b), b);
}

}  // namespace mylib::other
