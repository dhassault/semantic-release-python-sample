import random

from sample_package.sample_function import my_sum

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
