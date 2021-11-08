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