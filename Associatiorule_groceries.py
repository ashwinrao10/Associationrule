# -*- coding: utf-8 -*- b
"""
Created on Tue May 12 12:19:27 2020

@author: Ashwin
"""


import pandas as pd
pip install mlxtend
from mlxtend.frequent_patterns import apriori,association_rules
 groceries=[]
 with open("C:\\Users\\Ashwin\\Desktop\\Assignments\\Association_rule\\groceries.csv") as g:
       groceries=g.read()
       
       
#Splitting data as seperate transaction
groceries=groceries.split("\n")
groceries[0]      

groceries_list=[]
for i in groceries:
    groceries_list.append(i.split(","))
    groceries_list[0]

all_groceries_list=[i for item in groceries_list for i in item] 
all_groceries_list   
from collections import Counter

item_frequencies=Counter(all_groceries_list)
item_frequencies=sorted(item_frequencies.items(),key= lambda x:x[1])
print(item_frequencies)

frequencies=list(reversed([i[1] for i in item_frequencies]))

import matplotlib.pyplot as plt
plt.bar(height=frequencies[0:11],left=list(range(0,11)),color='rgbkymc');plt.xticks(list(range(0,11)),items[0:11]);plt.xlabel("items")
plt.ylabel("Count")

groceries_series=pd.DataFrame(pd.Series(groceries_list))
print(groceries_series)
groceries_series=groceries_series.iloc[:9835,:]

groceries_series.columns=["transactions"]
X=groceries_series['transactions'].str.join(sep='*').str.get_dummies(sep='*')

frequent_itemsets=apriori(X, min_support=0.005, max_len=3,use_colnames=True)
plt.bar(left=list(range(1,11)),height=frequent_itemsets.support[1:11],color='rgmyk');plt.xticks(list(range(1,11))frequent_itemsets.itemsets[1:11])
plt.xlabel('item-sets');plt.ylabel('support')

rules=association_rules(frequent_itemsets,metric='lift',min_threshold=1)
rules.sort_values('lift',ascending=False,inplace=True )
rules.head(20)

















