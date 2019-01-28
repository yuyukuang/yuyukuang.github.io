---
title: 剑指offer（二）:栈，队，数组 #标题
categories: 剑指offer #分类，可多个；若单个去掉括号
tags: [查找, 替换空格, 打印链表] #标签，可多个；若单个去掉括号
mathjax: true #是否引用公式
kewords: #本文关键词
description: #本文描述，若为空就自动全文前150字)
copyright: true #是否需要版权申明，默认有
reward: true #是否需要打赏，默认有
toc: true #是否需要目录，默认有
password: #是否加密，为空不加密
date: 2018-1-30 15:09:02 #日期
---


# 用两个栈来实现一个队列
用两个栈来实现一个队列，完成队列的Push和Pop操作。 队列中的元素为int类型

<分析>：

入队：将元素进栈A

出队：判断栈B是否为空，如果为空，则将栈A中所有元素pop，并push进栈B，栈B出栈；

 如果不为空，栈B直接出栈。

用两个队列实现一个栈的功能?要求给出算法和思路!

<分析>：

入栈：将元素进队列A

出栈：判断队列A中元素的个数是否为1，如果等于1，则出队列，否则将队列A中的元素   以此出队列并放入队列B，直到队列A中的元素留下一个，然后队列A出队列，再把   队列B中的元素出队列以此放入队列A中。
```C++
class Solution
{
public:
     void push(int node){
        stack1.push(node);
     }
     int pop(){
        int a;
        if(stack2.empty()){
            while(!stack1.empty()){
                a=stack1.top();
                stack2.push(a);
                stack1.pop();
            }
        }
        a=stack2.top();
        stack2.pop();
        return a;
     }
private:
    stack<int> stack1;
    stack<int> stack2;
    };
```

算法思路：

栈A用来作入队列
栈B用来出队列，当栈B为空时，栈A全部出栈到栈B,栈B再出栈（即出队列）
```python
# -*- coding:utf-8 -*-
class Solution:
    def __init__(self):
        self.stack1=[]
        self.stack2=[]
    def push(self,node):
        self.stack1.append(node)
    def pop(self,node):
        if self.stack2==[]:
            while self.stack1:
                self.stack2.append(self.stack1,pop())
            return stack2.pop()
        return stack2.pop()

```

# 旋转数组的最小数字
把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。 输入一个非递减排序的数组的一个旋转，输出旋转数组的最小元素。 例如数组{3,4,5,1,2}为{1,2,3,4,5}的一个旋转，该数组的最小值为1。 NOTE：给出的所有元素都大于0，若数组大小为0，请返回0。
```python
# -*- coding:utf-8 -*-
class Solution:
    def minNumberInRotateArray(self, rotateArray):
        # write code here
        if len(rotateArray) == 0:
            return 0
 
        ret = rotateArray[0]
        if len(rotateArray) == 1:
            return ret
 
        for i in range(1,len(rotateArray)):
            now = rotateArray[i]
            if now < ret:
                ret = now
                break
 
 
        return ret
```

剑指Offer中有这道题目的分析。这是一道二分查找的变形的题目。


旋转之后的数组实际上可以划分成两个有序的子数组：前面子数组的大小都大于后面子数组中的元素

注意到实际上最小的元素就是两个子数组的分界线。本题目给出的数组一定程度上是排序的，因此我们试着用二分查找法寻找这个最小的元素。

思路：

（1）我们用两个指针left,right分别指向数组的第一个元素和最后一个元素。按照题目的旋转的规则，第一个元素应该是大于最后一个元素的（没有重复的元素）。

但是如果不是旋转，第一个元素肯定小于最后一个元素。

（2）找到数组的中间元素。

中间元素大于第一个元素，则中间元素位于前面的递增子数组，此时最小元素位于中间元素的后面。我们可以让第一个指针left指向中间元素。

移动之后，第一个指针仍然位于前面的递增数组中。

中间元素小于第一个元素，则中间元素位于后面的递增子数组，此时最小元素位于中间元素的前面。我们可以让第二个指针right指向中间元素。

移动之后，第二个指针仍然位于后面的递增数组中。

这样可以缩小寻找的范围。

（3）按照以上思路，第一个指针left总是指向前面递增数组的元素，第二个指针right总是指向后面递增的数组元素。

最终第一个指针将指向前面数组的最后一个元素，第二个指针指向后面数组中的第一个元素。

也就是说他们将指向两个相邻的元素，而第二个指针指向的刚好是最小的元素，这就是循环的结束条件。

到目前为止以上思路很耗的解决了没有重复数字的情况，这一道题目添加上了这一要求，有了重复数字。

因此这一道题目比上一道题目多了些特殊情况：

我们看一组例子：｛1，0，1，1，1｝ 和 ｛1，1， 1，0，1｝ 都可以看成是递增排序数组｛0，1，1，1，1｝的旋转。

这种情况下我们无法继续用上一道题目的解法，去解决这道题目。因为在这两个数组中，第一个数字，最后一个数字，中间数字都是1。

第一种情况下，中间数字位于后面的子数组，第二种情况，中间数字位于前面的子数组。

因此当两个指针指向的数字和中间数字相同的时候，我们无法确定中间数字1是属于前面的子数组（绿色表示）还是属于后面的子数组（紫色表示）。

也就无法移动指针来缩小查找的范围。
```c
#include <iostream>
#include <vector>
#include <string>
#include <stack>
#include <algorithm>
using namespace std;
 
class Solution {
public:
    int minNumberInRotateArray(vector<int> rotateArray) {
        int size = rotateArray.size();
        if(size == 0){
            return 0;
        }//if
        int left = 0,right = size - 1;
        int mid = 0;
        // rotateArray[left] >= rotateArray[right] 确保旋转
        while(rotateArray[left] >= rotateArray[right]){
            // 分界点
            if(right - left == 1){
                mid = right;
                break;
            }//if
            mid = left + (right - left) / 2;
            // rotateArray[left] rotateArray[right] rotateArray[mid]三者相等
            // 无法确定中间元素是属于前面还是后面的递增子数组
            // 只能顺序查找
            if(rotateArray[left] == rotateArray[right] && rotateArray[left] == rotateArray[mid]){
                return MinOrder(rotateArray,left,right);
            }//if
            // 中间元素位于前面的递增子数组
            // 此时最小元素位于中间元素的后面
            if(rotateArray[mid] >= rotateArray[left]){
                left = mid;
            }//if
            // 中间元素位于后面的递增子数组
            // 此时最小元素位于中间元素的前面
            else{
                right = mid;
            }//else
        }//while
        return rotateArray[mid];
    }
private:
    // 顺序寻找最小值
    int MinOrder(vector<int> &num,int left,int right){
        int result = num[left];
        for(int i = left + 1;i < right;++i){
            if(num[i] < result){
                result = num[i];
            }//if
        }//for
        return result;
    }
};
 
int main(){
    Solution s;
    //vector<int> num = {0,1,2,3,4,5};
    //vector<int> num = {4,5,6,7,1,2,3};
    vector<int> num = {2,2,2,2,1,2};
    int result = s.minNumberInRotateArray(num);
    // 输出
    cout<<result<<endl;
    return 0;
}
```
