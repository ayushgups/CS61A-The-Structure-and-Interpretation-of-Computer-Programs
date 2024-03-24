def falling(n, k):
    """Compute the falling factorial of n to depth k.

    >>> falling(6, 3)  # 6 * 5 * 4
    120
    >>> falling(4, 3)  # 4 * 3 * 2
    24
    >>> falling(4, 1)  # 4
    4
    >>> falling(4, 0)
    1
    """
    if k == 0:
        return 1
    total = 1
    counter = 0
    while counter < k: 
        total = total * n
        n = n - 1
        counter = counter + 1
    
    return total 
        

def divisible_by_k(n, k):
    """
    >>> a = divisible_by_k(10, 2)  # 2, 4, 6, 8, and 10 are divisible by 2
    2
    4
    6
    8
    10
    >>> a
    5
    >>> b = divisible_by_k(3, 1)  # 1, 2, and 3 are divisible by 1
    1
    2
    3
    >>> b
    3
    >>> c = divisible_by_k(6, 7)  # There are no integers up to 6 divisible by 7
    >>> c
    0
    """
    if n < k:
        return 0
    counter = 0
    change = 1
    while n >= change: 
        if change % k == 0:
            print(change)
            counter = counter + 1
        change = change + 1

    return counter


def sum_digits(y):
    """Sum all the digits of y.

    >>> sum_digits(10) # 1 + 0 = 1
    1
    >>> sum_digits(4224) # 4 + 2 + 2 + 4 = 12
    12
    >>> sum_digits(1234567890)
    45
    >>> a = sum_digits(123) # make sure that you are using return rather than print
    >>> a
    6
    """

    total = 0
    current_number = y
    while y != 0:
        y = y % 10
        total = total + y
        current_number = current_number // 10
        y = current_number
    return total 

    


def double_eights(n):
    """Return true if n has two eights in a row.
    >>> double_eights(8)
    False
    >>> double_eights(88)
    True
    >>> double_eights(2882)
    True
    >>> double_eights(880088)
    True
    >>> double_eights(12345)
    False
    >>> double_eights(80808080)
    False
    """


    num = n 
    while num != 0:
        num = num % 10
        if num == 8 and (n // 10) % 10 == 8:
            return True
        else:
            n = n // 10
            num = n
        return False
        
        



