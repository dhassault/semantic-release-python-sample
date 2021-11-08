import random

from sample_package.sample_function import my_div, my_mul, my_sum

random.seed(42)


def test_my_sum() -> None:
    """Evaluate the output of `my_sum`
    by creating 2 random integers.
    The ground truth is given by the python
    function `sum`.
    """
    x_val = random.randrange(999)
    y_val = random.randrange(999)
    assert my_sum(x_val, y_val) == sum([x_val, y_val])


def test_my_mul() -> None:
    """Evaluate the output of `my_mul`
    by creating 2 random integers.
    The ground truth is given by the python
    multiplier operator.
    """
    x_val = random.randrange(999)
    y_val = random.randrange(999)
    assert my_mul(x_val, y_val) == (x_val * y_val)


def test_my_div() -> None:
    """Evaluate the output of `my_div`
    by creating 2 random integers.
    The ground truth is given by the python
    divide operator.
    """
    x_val = random.randrange(999)
    y_val = random.randrange(999)
    assert my_div(x_val, y_val) == (x_val / y_val)
