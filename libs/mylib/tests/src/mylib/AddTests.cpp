#include "mylib/Add.hpp"

#include <gtest/gtest.h>


namespace mylib::tests
{

TEST(AddTests, AddWorks)
{
    // Arrange
    auto const a = 1;
    auto const b = 2;

    // Act
    auto const result = Add(a, b);

    // Assert
    EXPECT_EQ(result, 3);
}

}  // namespace mylib::tests
