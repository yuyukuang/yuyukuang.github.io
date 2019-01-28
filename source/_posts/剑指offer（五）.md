---
title: 剑指offer（五）：14-18 #标题
categories: 剑指offer #分类，可多个；若单个去掉括号
tags: [查找, 替换空格, 打印链表] #标签，可多个；若单个去掉括号
mathjax: true #是否引用公式
kewords: #本文关键词
description: #本文描述，若为空就自动全文前150字)
copyright: true #是否需要版权申明，默认有
reward: true #是否需要打赏，默认有
toc: true #是否需要目录，默认有
password: #是否加密，为空不加密
date: 2018-2-13 10:09:02 #日期
---


## 剑14-反转链表
输入一个链表，反转链表后，输出链表的所有元素。
```python
class ListNode:
    def_init_(self,x):
        self.val = x
        self.next = None
class Solution:
    def ReverseList(self,pHead):
        #判断指针是否为空
        if pHead == None or pHead.next == None:
            return pHead
        #反转链表
        last = Nonep
        while pHead != None:
            tmp = pHead.next
            pHead.next = last
            last = pHead
            pHead = tmp
        return last
        
```

## 剑15-合并两个排序的链表
输入两个单调递增的链表，输出两个链表合成后的链表，当然我们需要合成后的链表满足单调不减规则。

思路：
*比较两个链表的首结点，哪个小的的结点则合并到第三个链表尾结点，并向前移动一个结点。
*步骤一结果会有一个链表先遍历结束，或者没有
*第三个链表尾结点指向剩余未遍历结束的链表
*返回第三个链表首结点

分析：
![](https://uploadfiles.nowcoder.net/images/20170119/3111850_1484789893742_6903DA8DDE03E5B02CCB5F97FC3E53C2)

```python 
class ListNode:
    def __init__(self,x):
        self.val = x
        self.next = None
class Solution:
    def Merge(self, pHead1,pHead2):
        new = ListNode(1)
        last = new
        while pHead1 and pHead2:
            if pHead1.val <= pHead2.val:
                new.next = pHead1
                pHead1 = pHead1.next
            else:
                new.next = pHead2
                pHead2 = pHead2.next
            new = new.next
        if pHead1:
            new.next = pHead1
        else:
            new.next = pHead2
        return last.next
```


## 剑16-树的子结构
输入两棵二叉树A，B，判断B是不是A的子结构。（ps：我们约定空树不是任意一个树的子结构）
分析：


```python
class Solution:
    def HasSubtree(self, pRoot1, pRoot2):
        # write code here
        if not pRoot1 or not pRoot2:
            return False
        return self.is_subtree(pRoot1, pRoot2) or self.HasSubtree(pRoot1.left, pRoot2) or self.HasSubtree(pRoot1.right, pRoot2)
    def is_subtree(self, A, B):
        if not B:
            return True
        if not A or A.val != B.val:
            return False
        return self.is_subtree(A.left,B.left) and self.is_subtree(A.right, B.right)


```

## 剑17-二叉树的镜像
题目描述
操作给定的二叉树，将其变换为源二叉树的镜像。
输入描述:
二叉树的镜像定义：源二叉树 
            8
           /  \
          6   10
         / \  / \
        5  7 9 11
        镜像二叉树
            8
           /  \
          10   6
         / \  / \
        11 9 7  5

```python
# -*- coding:utf-8 -*-
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
class Solution:
    # 返回镜像树的根节点
    def Mirror(self,root):
        if root != None:
            root.left,root.right=root.right,root.left
            self.Mirror(root.left)
            self.Mirroe(root.right)
```

## 剑18-顺时针打印矩阵
输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字，例如，如果输入如下矩阵： 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 则依次打印出数字1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10.

```python
def printMatrix(self, matrix):
        if not matrix:
            return []
        if len(matrix)==1:
            return matrix[0]
        target = []
        while (1):
            target.extend(matrix[0])
            del matrix[0]
            if len(matrix)==0:
                break
            tmp=[]
            for j in range(1,len(matrix[0])+1):
                tmp.append([m[-j] for m in matrix])
            matrix=tmp
        return target

```
我觉得下面这个比较好理解一些：
 可以模拟魔方逆时针旋转的方法，一直做取出第一行的操作
例如 
1 2 3
4 5 6
7 8 9
输出并删除第一行后，再进行一次逆时针旋转，就变成：
6 9
5 8
4 7
继续重复上述操作即可。
Python代码如下
```python
	
class Solution:
    # matrix类型为二维列表，需要返回列表
    def printMatrix(self, matrix):
        # write code here
        result = []
        while(matrix):
            result+=matrix.pop(0)
            if not matrix or not matrix[0]:
                break
            matrix = self.turn(matrix)
        return result
    def turn(self,matrix):
        num_r = len(matrix)
        num_c = len(matrix[0])
        newmat = []
        for i in range(num_c):
            newmat2 = []
            for j in range(num_r):
                newmat2.append(matrix[j][i])
            newmat.append(newmat2)
        newmat.reverse()
        return newmat
  ```



