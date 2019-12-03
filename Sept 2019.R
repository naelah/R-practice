# Q1A		What is the output?

rep(seq(10,40,8),5:2)

# Q1B		Write the R command to produce a vector of four 8's, seven 6's and three 5's

q1b = c(rep(8,4),rep(6,7),rep(5,3))
q1b

# Q1C		Use the seq command to produce the following output
#		400 380 360 340 320 300 280 260 240 220 200 180 160 140 120 100  80  60

q1c = rev(seq(60,400,by=20))
q1c

# Q1D		Produce the following output by using the data in part c
#     		[,1] [,2] [,3] [,4] [,5] [,6]
#		[1,]  400  380  360  340  320  300
#		[2,]  280  260  240  220  200  180
#		[3,]  160  140  120  100   80   60


q1d = matrix(q1c, nrow=3, byrow=T)
q1d

# Q1E		Based on the data in part d) obtain the following output
, , 1

     [,1] [,2] [,3]
[1,]  400  160  260
[2,]  280  380  140

, , 2

     [,1] [,2] [,3]
[1,]  360  120  220
[2,]  240  340  100

, , 3

     [,1] [,2] [,3]
[1,]  320   80  180
[2,]  200  300   60

q1e = array(q1d,c(2,3,3))
q1e

#Q1F		Write a suitable command to replace the value 80 in part d) with 888

q1d[3,5] = 80

#Q2A		Given that 
q2 = c(59,48,25,99,10,34,67,83)

#Obtain the R command for the following results
#10	25	34	48	59	67	83	99
sort(q2)

#5	3	6	2	1	7	8	4
order(q2)

#5	4	2	8	1	3	6	7
rank(q2)

#Q2B		Merge the data in part(a), X=A:H and Y={1:4,M,N,O,P}
#		The results 
  q2 X Y
1 59 A 1
2 48 B 2
3 25 C 3
4 99 D 4
5 10 E M
6 34 F N
7 67 G O
8 83 H P
> 

X=c("A","B","C","D","E","F","G","H")
Y=c(1:4,"M","N","O","P")
q2b1=data.frame(q2,X,Y)
q2b1

#Q3A		Given that
#		A = c(10,30,50,29,23,45,67,35)
#		B = {"Group 1","Group 2","Group 3"}
#		D = {"Bag X","Bag Y"}
#		Produce the following dataset.

> data1
  xt  A       B     D
1 59 10 Group 1 Bag X
2 48 30 Group 3 Bag Y
3 25 50 Group 2 Bag X
4 99 29 Group 1 Bag Y
5 10 23 Group 2 Bag X
6 34 45 Group 3 Bag Y
7 67 67 Group 1 Bag X

> data2
   xt  A       B     D
1: 59 10 Group 1 Bag X
2: 48 30 Group 3 Bag Y
3: 25 50 Group 2 Bag X
4: 99 29 Group 1 Bag Y
5: 10 23 Group 2 Bag X
6: 34 45 Group 3 Bag Y
7: 67 67 Group 1 Bag X
8: 83 35 Group 3 Bag Y

library(data.table)

xt = c(59,48,25,99,10,34,67,83)
A = c(10,30,50,29,23,45,67,35)
B = c("Group 1","Group 3","Group 2","Group 1","Group 2", "Group 3", "Group 1","Group 3")
D = gl(2,1,8,labels=c("Bag X","Bag Y"))

data1 = data.frame(xt,A,B,D)
data2 = data.table(xt,A,B,D)

#Q3B		Compute the dataset above to obtain the following results

		Output 1:
		Group 1 Group 2 Group 3 
		    106      73     110  
		
tapply(A,B,sum)

		Output 2:
		  Group.1 Group.2   x
		1 Group 1   Bag X  77
		2 Group 2   Bag X  73
		3 Group 1   Bag Y  29
		4 Group 3   Bag Y 110

aggregate(A,by=list(B,D),sum)

		Output 3:
		   	   B   V1	
		1: Group 1  106
		2: Group 2  110
		3: Group 3  73
		
library(data.table)
data.table(aggregate(xt,by=list(B),sum))


		Output 4:
		   	   D  V1
		1:   Bag X 161
		2:   Bag Y 264
data.table(aggregate(xt,by=list(D),sum))


		Output 5:
		   Group.1 Group.2   x
		1: Group 1   Bag X  77
		2: Group 2   Bag X  73
		3: Group 1   Bag Y  29
		4: Group 3   Bag Y 110

data.table(aggregate(A,by=list(B,D),sum))

Q4		Load dataset Prestige from library car

library(car)
pres.data = Prestige
		
# Q4A		Give the R command to remove missing values in the dataset

		q4a = na.omit(pres.data)
		q4a

# Q4B		State the dimension of the new dataset obtained in part(a)

		str(q4a)
		98 obs. of 6 variables == 98 rows, 6 columns

#  Q4C	By using the complete dataset obtained from part(a), write the appropriate command to determine the mean of Income and Prestige according to the three levels of type. The output is shown as below.

		                 bc        prof         wc
		income   5374.13636 10559.45161 5052.30435
		prestige   35.52727    67.84839   42.24348

attach(q4a)
mean1 = tapply(income, type, mean)
mean2 = tapply(prestige, type, mean)
data1 = rbind(income = mean1, prestige = mean2)

# Q4D		Write the R command to categorize the variable income into three groups A(high), B(middle) and C(low) as shown below. Hint: use the R command "cut"



# monte carlo

set.seed(123)
monte = function(x){

m = 1000
x = runif(m, min = 3, max = 9)
theta.hat = mean(exp(-2*x))*2
print(theta.hat)
}

exp(-3) - exp(-9)

