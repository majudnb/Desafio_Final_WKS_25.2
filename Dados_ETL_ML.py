import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv("academia_redfit.csv")
df

df['sexo'] = df['sexo'].str.strip().str.capitalize()
df['estado'] = df['estado'].str.strip().str.capitalize()
df['tipo_atividade'] = df['tipo_atividade'].str.strip().str.capitalize()
df

df['evolucao_PGC'] = df['primeiro_PGC'] - df['ultimo_PGC']
df

df.to_csv("dados_redfit_limpo.csv")
print("Dados tratados salvos em 'dados_redfit_limpo' com sucesso!")

import matplotlib.pyplot as plt
estado_contagem = df['estado'].value_counts()
plt.bar(estado_contagem.index, estado_contagem.values, color=['pink', 'purple'])
plt.title('Clientes por Estado (Ativo vs Sedentário)')
plt.xlabel('Estado do Cliente')
plt.ylabel('Número de Clientes')
plt.show()

clientes_sexo = df['sexo'].value_counts()
plt.figure(figsize=(8, 8))
plt.pie(clientes_sexo.values, labels=clientes_sexo.index, colors=['blue', 'purple', 'pink'])
plt.title('Distribuição de Clientes por Sexo')
plt.show()

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report
df = pd.read_csv("dados_redfit_limpo.csv")
df

from sklearn.metrics import classification_report, confusion_matrix, accuracy_score
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
clf = RandomForestClassifier(n_estimators=200, random_state=42)
clf.fit(X_train, y_train)
y_pred = clf.predict(X_test)
print("Acurácia:", accuracy_score(y_test,y_pred))
df

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
df

modelo = RandomForestClassifier(random_state=42, n_estimators=100)
modelo

