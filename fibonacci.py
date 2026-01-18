"""
Compute Fibonacci sequence.

This module provides a simple function to generate the Fibonacci sequence up to a given number of terms.

Example:
    >>> fib_sequence(10)
    [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

The function returns a list of the first `n` Fibonacci numbers, where `n` is a positive integer.
"""

from typing import List


def fib_sequence(n: int) -> List[int]:
    """Return the first *n* Fibonacci numbers.

    Parameters
    ----------
    n : int
        The number of terms to generate. Must be a positive integer.

    Returns
    -------
    List[int]
        A list containing the first *n* Fibonacci numbers.

    Raises
    ------
    ValueError
        If *n* is not a positive integer.
    """
    if not isinstance(n, int) or n <= 0:
        raise ValueError("n must be a positive integer")

    # The first two Fibonacci numbers are 0 and 1.
    if n == 1:
        return [0]
    if n == 2:
        return [0, 1]

    seq = [0, 1]
    while len(seq) < n:
        seq.append(seq[-1] + seq[-2])
    return seq


if __name__ == "__main__":
    import sys
    try:
        count = int(sys.argv[1]) if len(sys.argv) > 1 else 10
    except ValueError:
        print("Usage: python fibonacci.py <count>")
        sys.exit(1)
    print(fib_sequence(count))
"