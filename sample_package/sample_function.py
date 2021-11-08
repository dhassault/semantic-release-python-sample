from typing import Union


def my_sum(x_val: int, y_val: int) -> int:
    """Sum 2 integers.

    Args:
        x_val (int): integer to sum.
        y_val (int): integer to sum.

    Returns:
        int: result of the summation.
    """
    assert isinstance(x_val, int) and isinstance(
        y_val, int
    ), "Input parameters should be integers."
    return x_val + y_val


def my_mul(x_val: int, y_val: int) -> int:
    """Multiply 2 integers.

    Args:
        x_val (int): integer to multiply.
        y_val (int): integer to multiply.

    Returns:
        int: result of the multiplication.
    """
    assert isinstance(x_val, int) and isinstance(
        y_val, int
    ), "Input parameters should be integers."
    return x_val * y_val


def my_div(x_val: int, y_val: int) -> Union[int, float]:
    """Divide 2 integers.

    Args:
        x_val (int): integer to divide.
        y_val (int): integer to divide.

    Returns:
        int: result of the division.
    """
    assert isinstance(x_val, int) and isinstance(
        y_val, int
    ), "Input parameters should be integers."
    return x_val / y_val
