---
title: 剑指offer（四）：7-13 #标题
categories: 剑指offer #分类，可多个；若单个去掉括号
tags: [查找, 替换空格, 打印链表] #标签，可多个；若单个去掉括号
mathjax: true #是否引用公式
kewords: #本文关键词
description: #本文描述，若为空就自动全文前150字)
copyright: true #是否需要版权申明，默认有
reward: true #是否需要打赏，默认有
toc: true #是否需要目录，默认有
password: #是否加密，为空不加密
date: 2018-2-10 10:09:02 #日期
---


# Fibonacci数列

## 剑7-斐波那契数列
大家都知道斐波那契数列，现在要求输入一个整数n，请你输出斐波那契数列的第n项。
n<=39
```python
class Solution:
    def Fibonacci(self,n):
        if n == 0:
            return 0
        if n == 1:
            return 1
        if n == 2:
            return 1
        if n >= 3:
            s = []*n
            s.append(1)
            s.append(1)
            for i in range(2,n):
                s.append(s[i-1]+s[i-2])
            return s[n-1]
```
## 剑8-跳台阶
一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个n级的台阶总共有多少种跳法。

分析：

1.假设当有n个台阶时假设有f(n)种走法。
2.青蛙最后一步要么跨1个台阶要么跨2个台阶。
3.当最后一步跨1个台阶时即之前有n-1个台阶，根据1的假设即n-1个台阶有f(n-1)种走法。
4. 当最后一步跨2个台阶时即之前有n-2个台阶，根据1的假设即n-2个台阶有f(n-2 )种走法。
5.显然n个台阶的走法等于前两种情况的走法之和即f(n)=f(n-1)+f(n-2)。
6.找出递推公式后要找公式出口，即当n为1、2时的情况，显然n=1时f(1)等于1，f(2)等于2
7.         | 1, (n=1)
   f(n) =  |2, (n=2)
           | f(n-1)+f(n-2) ,(n>2,n为整数)

```python 
class Solution:
    def jumpFloor(self, number):
        if number <=0:
            return 0
        elif number <= 2:
            return number
        else:
            a = 1
            b = 2
            #a,b=1,2
            for i in range(2,number):
                temp = a+b
                a = b
                b = temp
                #a,b = b,a+b
            return b
```

其中`a,b=a,a+b`是指：
```python
t=a
a=b
b=b+t
```
也就是，此时a加的是未改变之前的a。举个例子：
```python
a，b=0,1 #复合赋值 实际上就是a=0,b=1
while     
b<10
print(b)
a,b=b,a+b 
#实际上还是复合赋值a=b,b=a+b;那输出结果将是
a=0  b=1     1
a=1  b=1     1
a=1  b=2     2
a=2  b=3     3
a=3  b=5     5
a=5  b=8     8
a=8  b=13   #大于了10不做输出

```

## 剑9-变跳台阶
一只青蛙一次可以跳上1级台阶，也可以跳上2级……它也可以跳上n级。求该青蛙跳上一个n级的台阶总共有多少种跳法。

分析：
因为n级台阶，第一步有n种跳法：跳1级、跳2级、到跳n级
跳1级，剩下n-1级，则剩下跳法是f(n-1)
跳2级，剩下n-2级，则剩下跳法是f(n-2)
所以f(n)=f(n-1)+f(n-2)+...+f(1)
因为f(n-1)=f(n-2)+f(n-3)+...+f(1)
所以f(n)=2*f(n-1)

```python
class Solution:
    def jumpFloor2(self, number):
    if number <= 0:
        return -1
    elif number == 1:
        return 1
    else:
        return 2*self.jumpFloor2(number-1)


```

## 剑10-矩形覆盖
我们可以用2*1的小矩形横着或者竖着去覆盖更大的矩形。请问用n个2*1的小矩形无重叠地覆盖一个2*n的大矩形，总共有多少种方法？

分析：
![](http://p3nyp7kdl.bkt.clouddn.com/b.png)

逆向分析
应为可以横着放或竖着放，多以f(n)可以是2*(n-1)的矩形加一个竖着放的2*1的矩形或2*(n-2)的矩形加2横着放的，即f(n)=f(n-1)+f(n-2)
当到了最后，f(1)=1,f(2)=2

```python
class Solution:
    def rectCover(self, number):
    if number < 0:
        return -1
    elif number <= 2:
        return number
    else:
        a,b = 1,2
        for i in range(2,number)：
        a,b = b,a+b
    return b
```

## 剑11-二进制中1的个数
输入一个整数，输出该数二进制表示中1的个数。其中负数用补码表示。

//超级简单容易理解                            //&(与)
// 把这个数逐次 右移 然后和1 与,
//就得到最低位的情况,其他位都为0,
//如果最低位是0和1与 之后依旧 是0，如果是1，与之后还是1。
//对于32位的整数 这样移动32次 就记录了这个数二进制中1的个数了

```python
class Solution:
    def NumberOf1(self,n):
    count = 0
    for i in range(32):
        count += (n >> i)&1
    return count

```

## 剑12-数值整数次方
给定一个double类型的浮点数base和int类型的整数exponent。求base的exponent次方。

```python
class Solution:
    def Power(self,base,exponent):
    if base == 0:
        return 0
    elif base == 1:
        return 1
    elif exponent == 0:
        return 1
    elif exponent == 1:
        return base
    else:
        return pow(base,exponent)
```

## 剑13-调整数组顺序使奇数位于偶数前面
输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有的奇数位于数组的前半部分，所有的偶数位于位于数组的后半部分，并保证奇数和奇数，偶数和偶数之间的相对位置不变。

 * 1.要想保证原有次序，则只能顺次移动或相邻交换。
 * 2.i从左向右遍历，找到第一个偶数。
 * 3.j从i+1开始向后找，直到找到第一个奇数。
 * 4.将[i,...,j-1]的元素整体后移一位，最后将找到的奇数放入i位置，然后i++。
 * 5.終止條件：j向後遍歷查找失敗。
```python
class Solution:
    def reOrderArray(self,array):
        odd = []
        even = []
        for i in array:
            if i%2 == 1:
                odd.append(i)
            else:
                even.append(i)
        return odd+even

```


