import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

pd.options.display.max_rows = 10
df_authors = pd.read_csv(r'.\authors_full.csv', index_col=None)
df_refs = pd.read_csv(r'.\references.csv', index_col=None)
df_titles = pd.read_csv(r'.\titles.csv', index_col=None)

#print(df_authors.loc[1])
#print(df_authors.iloc[1])
#print(df_authors.head(3))
#print(df_authors.tail(2))

#plt.hist(df_titles["PUBYEAR"])
#df_titles.plot.hist(column=["PUBYEAR"], figsize=(10, 8))
#plt.show()
#df_titles.groupby('PUBYEAR').count().plot()
#plt.show()

plt.hist(df_titles['PUBYEAR'], color = 'blue', edgecolor = 'black',
         bins = int(180/5))

plt.show()

sns.distplot(df_titles['PUBYEAR'], hist=True, kde=False, color = 'blue', rug = True,
             hist_kws={'edgecolor':'black'})
plt.title('Number of publications per year')
plt.xlabel('Year')
plt.ylabel('Number of publications')
plt.show()

