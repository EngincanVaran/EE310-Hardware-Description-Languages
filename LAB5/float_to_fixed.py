
def float_to_fixed(A):
    s = int(A[0],2)
    
    ep= int(A[1:9],2)
    e = ep-127
    
    m = 1 + int(A[9:32],2)/(2**23)
    
    return (((-1)**s)*(2**e)*m)

A = '00000000100000000000000000000000'  # Enter your input as string
   
Af= float_to_fixed(A)

print("A in floating-pt format: {}".format(A))
print("                      s: {}".format(A[0]))
print("                     e': {}".format(A[1:9]))
print("                      m: {}".format(A[9:32]))
print("A in fixed-pt format   : {}".format(Af))
