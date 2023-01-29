import pandas as pd
import numpy as np
import pickle

grocery = pd.read_csv("./Groceries_dataset.csv")
grocery.info()


grocery["InvoiceNo"] = grocery["Member_number"].astype(str) + "_" + grocery["Date"]

grocery_pivot = grocery.groupby(["InvoiceNo", "itemDescription"])["itemDescription"].count().unstack(). \
fillna(0)

grocery_pivot = grocery_pivot.applymap(lambda x: True if x>0 else False)

from mlxtend.frequent_patterns import apriori, association_rules
frequent_itemsets = apriori(grocery_pivot, min_support=0.01, use_colnames=True)
rules = association_rules(frequent_itemsets, metric="support", min_threshold=0.01)
rules = rules.sort_values("lift", ascending=False).reset_index(drop=True) 
rules.to_csv("rules.csv")
pickle.dump(rules, open('model.pkl', 'wb'))

def product_rec(dataframe, product, stop_num = 3):
    counter = 0
    rec_list = []
    for index, row in enumerate(dataframe["antecedents"]):        
        for item in list(row):
            if item == product:
                rec_list.append(list(dataframe["consequents"][index])[0])
                counter += 1
                if counter == stop_num:
                    break
    return rec_list
print(product_rec(rules, "yogurt"))
