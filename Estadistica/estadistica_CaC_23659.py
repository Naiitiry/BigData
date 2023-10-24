# ---------------------- ESTADÍSTICA DESCRIPTIVA ----------------------

# URL: https://deepnote.com/workspace/c23670-08ec59da-9b4d-4516-b567-42fc9fa37c23/project/c23659-b74eb0b1-8887-43de-a9ad-9eb3e6abec48/notebook/1%20-%20Estadística-9d8d012cdfed466689ae51e07c64e682?

'''
La estadística descriptiva se divide en 2 formas:

    I - analítica

    II - visualizaciones

'''
import pandas as pd
# hay que instalar el módulo matplotlib con 'pip install matplotlib'
import matplotlib.pyplot as plot
import seaborn as sns

df = pd.read_csv('Estadistica/data/cars_depurado.csv')
# PROMEDIO de precios
# print('Promedio de precios: ',df['price_usd'].mean())
# MEDIANA de precios
# print('Mediana de precios: ',df['price_usd'].median())

# MODA/FRECUENCIA DE PRECIOS
# df['price_usd'].plot.hist(bins=20)
# para mostrar el gráfico usamos:
# plot.show() 

# --------------------- SEABORN ---------------------

# Sirve para visualización con un enfoque estadístico
# Importamos SEABORN ya que funciona como mathplotlib pero es mas versátil
# import seaborn as sns
# crear hitograma de precios x marca
sns.displot(df,x='price_usd',hue="manufacturer_name")
plot.show()
