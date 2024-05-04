#include "mylib/other/AddTwice.hpp"

#include <gtest/gtest.h>


namespace mylib::other::tests
{

    TEST(AddTwiceTests, AddTwiceWorks)
    {
        // Arrange
        auto const a = 1;
        auto const b = 2;

        // Act
        auto const result = AddTwice(a, b);

        // Assert
        EXPECT_EQ(result, 5);
    }

}  // namespace mylib::tests
