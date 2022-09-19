def sumNum(num):
  previousNum=0
  for i in range(num):
    sum = previousNum + i
    print(sum)
    previousNum = i

print("Printing current and previous number sum in a given range")
sumNum(10)
