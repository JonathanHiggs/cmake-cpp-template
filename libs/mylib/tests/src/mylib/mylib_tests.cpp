#include "mylib/mylib.hpp"

#include <gtest/gtest.h>


namespace mylib::tests
{

TEST(AddTests, AddIsCorrect)
{
    // Arrange
    auto a = 1;
    auto b = 2;

    // Act
    auto result = add(a, b);

    // Assert
    EXPECT_EQ(result, 3);
}

}  // namespace mylib::tests
