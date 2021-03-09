import random

A0 = open("TestA0.txt","w")
A1 = open("TestA1.txt","w")
A2 = open("TestA2.txt","w")
A3 = open("TestA3.txt","w")

B0 = open("TestB0.txt","w")
B1 = open("TestB1.txt","w")
B2 = open("TestB2.txt","w")
B3 = open("TestB3.txt","w")

C0 = open("TestC0.txt","w")
C1 = open("TestC1.txt","w")
C2 = open("TestC2.txt","w")
C3 = open("TestC3.txt","w")

A = [[0]*4]
B = [[0]*4]
T = [0]*8
C = [[0]*4]

for i in range(0,100):
	A.append([0]*4)
	B.append([0]*4)
	C.append([0]*4)

for k in range(0,100):
	for i in range(0,4):
		A[k][i] = random.randint(0,256)
	for i in range(0,4):
		B[k][i] = random.randint(0,256)

	T = [0]*8

	for i in range(0,4):
	    for x in range(0,4):
	        T[i+x] = (T[i+x]  + A[k][i] * B[k][x]) % 256

	for i in range(0,4) :
		C[k][i] = (T[i]-T[4+i]) % 256

for i in range(0,100):
	A0.write( format(A[i][0],'#06b')[2:] +"\n" )
	A1.write( format(A[i][1],'#06b')[2:] +"\n" )
	A2.write( format(A[i][2],'#06b')[2:] +"\n" )
	A3.write( format(A[i][3],'#06b')[2:] +"\n" )
	B0.write( format(B[i][0],'#06b')[2:] +"\n" )
	B1.write( format(B[i][1],'#06b')[2:] +"\n" )
	B2.write( format(B[i][2],'#06b')[2:] +"\n" )
	B3.write( format(B[i][3],'#06b')[2:] +"\n" )
	C0.write( format(C[i][0],'#06b')[2:] +"\n" )
	C1.write( format(C[i][1],'#06b')[2:] +"\n" )
	C2.write( format(C[i][2],'#06b')[2:] +"\n" )
	C3.write( format(C[i][3],'#06b')[2:] +"\n" )
	