f = open("test.txt","r")
a = f.readline()
print(a)
while True:
    a = f.readline()
    if a =='':
        break
    print(int(a,16))
