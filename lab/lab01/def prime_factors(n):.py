def prime_factors(n):
    while n > 1:
        k = smallest_factor(n)
        print(k) 
        n = n // k

def smallest_factor(n):
    k = 2
    while n % k != 0:
        k = k + 1
    return k

print(prime_factors(30))