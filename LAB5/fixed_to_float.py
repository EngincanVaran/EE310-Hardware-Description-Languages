from random import uniform
import ctypes

def fixed_to_float(A):
    F = bin(ctypes.c_uint.from_buffer(ctypes.c_float(A)).value)[2:]
    return ('0'*(32-len(F)) + F)

A = 43/25 # Enter an input
# A = uniform(-1000.0,1000.0) # comment out this line if you want random input

Af=fixed_to_float(A)

print("A in fixed-pt format   : {}".format(A))
print("A in floating-pt format: {}".format(Af))
print("                      s: {}".format(Af[0]))
print("                     e': {}".format(Af[1:9]))
print("                      m: {}".format(Af[9:32]))


