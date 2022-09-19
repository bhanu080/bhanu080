l1 = [1, 2, 23, 10, 17]
l2 = [3, 4, 2, 36, 12]
l3=[]
for i in l1:
   if(i % 2 != 0):
     l3.append(i)
for j in l2:
  if(j % 2 == 0):
    l3.append(j)

print(l3)
