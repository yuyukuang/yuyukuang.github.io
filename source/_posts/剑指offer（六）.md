---
title: 剑指offer（六）：19-23 #标题
categories: 剑指offer #分类，可多个；若单个去掉括号
tags: [查找, 替换空格, 打印链表] #标签，可多个；若单个去掉括号
mathjax: true #是否引用公式
kewords: #本文关键词
description: #本文描述，若为空就自动全文前150字)
copyright: true #是否需要版权申明，默认有
reward: true #是否需要打赏，默认有
toc: true #是否需要目录，默认有
password: #是否加密，为空不加密
date: 2018-2-14 10:09:02 #日期
---


## 剑19-包含min函数的栈
定义栈的数据结构，请在该类型中实现一个能够得到栈最小元素的min函数。
```python
class Solution:
    def __init__(self):
        self.stack = []
    def push(self,node):#当前栈压入
        self.stack.append(node)
    def pop(self): #当前栈、辅助栈全部要弹出
        self.stack.pop()
    def top(self):#返回当前栈的栈顶元素
        return self.stack[0]
    def min(self):#返回辅助栈的栈顶元素
        return min(self.stack)
        
```

## 剑20-栈的压入弹出序列
输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如序列1,2,3,4,5是某栈的压入顺序，序列4，5,3,2,1是该压栈序列对应的一个弹出序列，但4,3,5,1,2就不可能是该压栈序列的弹出序列。（注意：这两个序列的长度是相等的）

思路：
举例：
        *入栈1,2,3,4,5
        *出栈4,5,3,2,1
        *首先1入辅助栈，此时栈顶1≠4，继续入栈2
        *此时栈顶2≠4，继续入栈3#
        *此时栈顶3≠4，继续入栈4
        *此时栈顶3≠4，继续入栈4
        *此时栈顶4＝4，出栈4，弹出序列向后一位，此时为5，,辅助栈里面是1,2,3
        *此时栈顶3≠5，继续入栈5
        *此时栈顶5=5，出栈5,弹出序列向后一位，此时为3，,辅助栈里面是1,2,3



```python 

class Solution:
    def IsPopOrder(self, pushV,popV):
        stack = []
        for i in pushV:
            stack.append(i)
            while(len(stack) and stack[-1] == popV[0]):
                stack.pop()
                popV.pop(0)
            else:
                continue
        if len(stack):
            return False
        return True


```


## 剑21-从上往下打印二叉树
从上往下打印出二叉树的每个节点，同层节点从左至右打印。


```python
class Solution:
    def PrintFromTopToBottom(self, root):
        # write code here
        result = []
        if not root:
            return []
        stack = [root]
        while stack:
            current = stack.pop(0)
            result.append(current.val)
            if current.left:
                stack.append(current.left)
            if current.right:
                stack.append(current.right)
        return result
    


```

## 剑22-二叉搜索树的后序遍历序列
题目描述
输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。如果是则输出Yes,否则输出No。假设输入的数组的任意两个数字都互不相同。

```python
# Python 简单解法，找到第一个比根节点大的整数的坐标，左边肯定都比根小，不需要再进一步判断
# 继续遍历坐标右边，如果有比根小的数说明不是搜索树
 
# -*- coding:utf-8 -*-
class Solution:
    def VerifySquenceOfBST(self, sequence):
        # write code here
        if not sequence:
            return False
        root = sequence[-1]
        index = 0
        while sequence[index] < root:
            index += 1
        for i in sequence[index:]:
            if i < root:
                return False
        return True
```

python:后序遍历 的序列中，最后一个数字是树的根节点 ，数组中前面的数字可以分为两部分：第一部分是左子树节点 的值，都比根节点的值小；第二部分 是右子树 节点的值，都比 根 节点 的值大，后面用递归分别判断前后两部分 是否 符合以上原则
```python

class Solution:
    def VerifySquenceOfBST(self, sequence):
        # write code here
        if sequence==None or len(sequence)==0:
            return False
        length=len(sequence)
        root=sequence[length-1]
        # 在二叉搜索 树中 左子树节点小于根节点
        for i in range(length):
            if sequence[i]>root:
                break
        # 二叉搜索树中右子树的节点都大于根节点
        for j  in range(i,length):
            if sequence[j]<root:
                return False
        # 判断左子树是否为二叉树
        left=True
        if  i>0:
            left=self.VerifySquenceOfBST(sequence[0:i])
        # 判断 右子树是否为二叉树
        right=True
        if i<length-1:
            right=self.VerifySquenceOfBST(sequence[i:-1])
        return left and right
```
另外一种解法
```python

class Solution:
    def VerifySquenceOfBST(self, sequence):
        # write code here
        #数组的最后一个元素是根元素
        #从右向左找到第一个小于根节点的元素node
        #把数组分成两部分，node左边表示左子树、node右边表示右子树，
        #检查node左边子树的点是否小于根（右边不需要在检查），如果是,递归处理左、右子树，否则返回false
         
        if not sequence:
            return False
        length=len(sequence)
        if length<3:
            return True
        root=length-1
        right=length-2
        left=-1
        for i in range(length-1,-1,-1):
            if sequence[i]<sequence[root]:
                left=i
                break
        if left>-1:
            for i in range(0,left+1):
                if sequence[i]>sequence[root]:
                    return False
        if left<0:
            if right-left<2:
                return True
            return self.VerifySquenceOfBST(sequence[left+1:right+1])
        else:
            if left<2 or right-left<2:
                return True
            return self.VerifySquenceOfBST(sequence[:left+1])  and self.VerifySquenceOfBST(sequence[left+1:right+1])
```
## 剑23-二叉树中和为某一值得路径
输入一颗二叉树和一个整数，打印出二叉树中结点值的和为输入整数的所有路径。路径定义为从树的根结点开始往下一直到叶结点所经过的结点形成一条路径。


```python
    
class Solution:
    # 返回二维列表，内部每个列表表示找到的路径
    def FindPath(self, root, expectNumber):
        # write code here
        if not root:
            return []
        if not root.left and not root.right:
            if root.val == expectNumber:
                return [[root.val]]
            else:
                return []
        lpath, rpath = [], []
        if root.left:
            lpath = self.FindPath(root.left, expectNumber - root.val)
        if root.right:
            rpath = self.FindPath(root.right, expectNumber - root.val)
        res = lpath + rpath
        for p in res:
            p.insert(0, root.val)
        return res
  ```



