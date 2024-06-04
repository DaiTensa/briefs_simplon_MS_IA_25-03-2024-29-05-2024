###########################################Import des Librairies#####################################

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#####################################################################################################
csv_file_name = "q4_2_months_years_tendance_mobilite_FR_GR.csv"
path = "/home/dai/Documents/Python_Projects/sql/tp2_bigquery/data/data_tp2/"
data_mobility_mois_fr_ge = pd.read_csv(path + csv_file_name)

# les données
data_mobility_mois_fr_ge.head()

# Convertir les colonnes year et month en une colonne de date
data_mobility_mois_fr_ge['date'] = pd.to_datetime(data_mobility_mois_fr_ge[['year', 'month']].assign(day=1))

places = ["avg_retail_recreation", "avg_grocery_pharmacy", "avg_transit_stations", "avg_parks", "avg_workplaces", "avg_residential"]
# Mise en forme des données pour seaborn

# Création du graphique avec Seaborn

for place in places:
    plt.figure(figsize=(15, 7))
    sns.lineplot(data=data_mobility_mois_fr_ge, x='date', y=place, hue='country_region', marker='o')

    # Ajout du titre et des labels
    plt.title(f'{place} Trends France and Germany ')
    plt.xlabel('Date')
    plt.ylabel(f'{place}')

    # Ajout d'une grille
    plt.grid(True)
    plt.savefig(f"{place}", transparent=None, dpi='figure', format=None,
        metadata=None, bbox_inches=None, pad_inches=0.1,
        facecolor='auto', edgecolor='auto', backend=None
       )

    # Affichage du graphique
    plt.show()

#### Comment les déplacements dans les parcs ont-ils varié entre l'été et l'hiver ?

csv_file_name = "q4_2_season_parks_avg_tendance_mobilite_FR_GR.csv"
path = "/home/dai/Documents/Python_Projects/sql/tp2_bigquery/data/data_tp2/"
data_mobility_parks_fr_ge = pd.read_csv(path + csv_file_name)

# Les données
data_mobility_parks_fr_ge.head()

# Création du graphique avec Seaborn
plt.figure(figsize=(10, 6))
sns.barplot(data=data_mobility_parks_fr_ge, x='season', y='avg_parks_change', hue='country_region')

# Ajout du titre et des labels
plt.title('Average Change in Parks Mobility During Summer and Winter')
plt.xlabel('Season')
plt.ylabel('Average Change (%)')

# Ajout de la légende
plt.legend(title='Country')

# Ajout d'une grille
plt.grid(True)
plt.savefig("Changement de mobilité dans les parcs pendant l'Été et l'Hiver", transparent=None, dpi='figure', format=None,
        metadata=None, bbox_inches=None, pad_inches=0.1,
        facecolor='auto', edgecolor='auto', backend=None
       )

# Affichage du graphique
plt.show()

#### Impact sur le télé travail 
csv_file_name = "q4_3_period_workplace_avg_tendance_mobilite_FR_GR.csv"
path = "/home/dai/Documents/Python_Projects/sql/tp2_bigquery/data/data_tp2/"
data_mobility_workplace_fr_ge = pd.read_csv(path + csv_file_name)

# Les données
data_mobility_workplace_fr_ge.head()

# Création du graphique avec Seaborn
plt.figure(figsize=(10, 6))
sns.barplot(data=data_mobility_workplace_fr_ge, x='period', y='avg_workplaces_change', hue='country')

# Ajout du titre et des labels
plt.title('Average Change in Work places Mobility During First Second and Third Lockdown')
plt.xlabel('Season')
plt.ylabel('Average Change (%)')

# Ajout de la légende
plt.legend(title='Country')

# Ajout d'une grille
plt.grid(True)
plt.savefig("Changement de mobilité- périodes de confinement", transparent=None, dpi='figure', format=None,
        metadata=None, bbox_inches=None, pad_inches=0.1,
        facecolor='auto', edgecolor='auto', backend=None
       )

# Affichage du graphique
plt.show()

#### Analyse des jours de la semaine
csv_file_name = "q4_4_days_workplace_recreation_avg_tendance_mobilite_FR_GR.csv"
path = "/home/dai/Documents/Python_Projects/sql/tp2_bigquery/data/data_tp2/"
data_mobility_days_workplace_recreation_fr_ge = pd.read_csv(path + csv_file_name)


# Les données
data_mobility_days_workplace_recreation_fr_ge.info()


# data_mobility_days_workplace_recreation_fr_ge 
workplaces_df = data_mobility_days_workplace_recreation_fr_ge[['country_region', 'day_of_week', 'period', 'avg_workplaces']]
retail_recreation_df = data_mobility_days_workplace_recreation_fr_ge[['country_region', 'day_of_week', 'period', 'avg_retail_recreation']]

# Création des graphiques
fig, axes = plt.subplots(nrows=2, ncols=2, figsize=(15, 10), sharey=True)

for idx, country in enumerate(['France', 'Germany']):
    subset_workplaces = workplaces_df[workplaces_df['country_region'] == country]
    subset_retail = retail_recreation_df[retail_recreation_df['country_region'] == country]

    sns.barplot(ax=axes[0, idx], data=subset_workplaces[subset_workplaces['period'] == 'before_pandemic'],
                x='day_of_week', y='avg_workplaces', color='blue', alpha=0.6, label='Before Pandemic')
    sns.barplot(ax=axes[0, idx], data=subset_workplaces[subset_workplaces['period'] == 'after_pandemic'],
                x='day_of_week', y='avg_workplaces', color='red', alpha=0.6, label='After Pandemic')
    axes[0, idx].set_title(f'Workplaces Mobility in {country}')
    axes[0, idx].set_xlabel('Day of the Week')
    axes[0, idx].set_ylabel('Avg Change (%)')
    axes[0, idx].legend()

    sns.barplot(ax=axes[1, idx], data=subset_retail[subset_retail['period'] == 'before_pandemic'],
                x='day_of_week', y='avg_retail_recreation', color='blue', alpha=0.6, label='Before Pandemic')
    sns.barplot(ax=axes[1, idx], data=subset_retail[subset_retail['period'] == 'after_pandemic'],
                x='day_of_week', y='avg_retail_recreation', color='red', alpha=0.6, label='After Pandemic')
    axes[1, idx].set_title(f'Retail & Recreation Mobility in {country}')
    axes[1, idx].set_xlabel('Day of the Week')
    axes[1, idx].set_ylabel('Avg Change (%)')
    axes[1, idx].legend()


plt.savefig("Workplaces - Mobility FR GE", transparent=None, dpi='figure', format=None,
        metadata=None, bbox_inches=None, pad_inches=0.1,
        facecolor='auto', edgecolor='auto', backend=None
       )
plt.tight_layout()
plt.show()


##### Méthode 2

csv_file_name = "q4_4_days_workplace_recreation_avg_tendance_mobilite_FR_GR_2.csv"
path = "/home/dai/Documents/Python_Projects/sql/tp2_bigquery/data/data_tp2/"
data_mobility_days_workplace_recreation_fr_ge_2 = pd.read_csv(path + csv_file_name)

data_mobility_days_workplace_recreation_fr_ge_2 = data_mobility_days_workplace_recreation_fr_ge_2.sort_values(by="day_of_week")

# data_mobility_days_workplace_recreation_fr_ge
workplaces_df = data_mobility_days_workplace_recreation_fr_ge_2[['country_region', 'name_day_of_week', 'period', 'avg_workplaces']]
retail_recreation_df = data_mobility_days_workplace_recreation_fr_ge_2[['country_region', 'name_day_of_week', 'period', 'avg_retail_recreation']]

# Création des graphiques
fig, axes = plt.subplots(nrows=2, ncols=2, figsize=(15, 10), sharey=True)

for idx, country in enumerate(['France', 'Germany']):
    subset_workplaces = workplaces_df[workplaces_df['country_region'] == country]
    subset_retail = retail_recreation_df[retail_recreation_df['country_region'] == country]

    sns.barplot(ax=axes[0, idx], data=subset_workplaces[subset_workplaces['period'] == 'before_pandemic'],
                x='name_day_of_week', y='avg_workplaces', color='blue', alpha=0.6, label='Before Pandemic')
    sns.barplot(ax=axes[0, idx], data=subset_workplaces[subset_workplaces['period'] == 'after_pandemic'],
                x='name_day_of_week', y='avg_workplaces', color='red', alpha=0.6, label='After Pandemic')
    axes[0, idx].set_title(f'Workplaces Mobility in {country}')
    axes[0, idx].set_xlabel('Day of the Week')
    axes[0, idx].set_ylabel('Avg Change (%)')
    axes[0, idx].legend()

    sns.barplot(ax=axes[1, idx], data=subset_retail[subset_retail['period'] == 'before_pandemic'],
                x='name_day_of_week', y='avg_retail_recreation', color='blue', alpha=0.6, label='Before Pandemic')
    sns.barplot(ax=axes[1, idx], data=subset_retail[subset_retail['period'] == 'after_pandemic'],
                x='name_day_of_week', y='avg_retail_recreation', color='red', alpha=0.6, label='After Pandemic')
    axes[1, idx].set_title(f'Retail & Recreation Mobility in {country}')
    axes[1, idx].set_xlabel('Day of the Week')
    axes[1, idx].set_ylabel('Avg Change (%)')
    axes[1, idx].legend()


plt.savefig("Workplaces - Mobility FR GE _2", transparent=None, dpi='figure', format=None,
        metadata=None, bbox_inches=None, pad_inches=0.1,
        facecolor='auto', edgecolor='auto', backend=None
       )
plt.tight_layout()
plt.show()


#### Y a-t-il des variations saisonnières dans les tendances de mobilité ?

csv_file_name = "q4_5_season_avg_tendance_mobilite_FR_GR.csv"
path = "/home/dai/Documents/Python_Projects/sql/tp2_bigquery/data/data_tp2/"
data_mobility_season_avg_fr_ge = pd.read_csv(path + csv_file_name)

# Les données
data_mobility_season_avg_fr_ge.head()


metrics = ['avg_retail_recreation', 'avg_grocery_pharmacy', 'avg_parks',
           'avg_transit_stations', 'avg_workplaces', 'avg_residential']

titles = ['Retail & Recreation', 'Grocery & Pharmacy', 'Parks', 'Transit Stations', 'Workplaces', 'Residential']

# Création des graphiques
fig, axes = plt.subplots(nrows=3, ncols=2, figsize=(15, 15), sharey=True)
fig.suptitle('Seasonal Mobility Changes in France and Germany')

for i, ax in enumerate(axes.flat):
    metric = metrics[i]
    sns.barplot(data=data_mobility_season_avg_fr_ge, x='season', y=metric, hue='country_region', ax=ax)
    ax.set_title(titles[i])
    ax.set_xlabel('Season')
    ax.set_ylabel('Avg Change (%)')

plt.savefig("Seasonal Mobility Changes in France and Germany", transparent=None, dpi='figure', format=None,
        metadata=None, bbox_inches=None, pad_inches=0.1,
        facecolor='auto', edgecolor='auto', backend=None
       )
plt.tight_layout(rect=[0, 0.03, 1, 0.95])
plt.show()


# Création des graphiques avec lineplot
fig, axes = plt.subplots(nrows=3, ncols=2, figsize=(15, 15), sharey=True)
fig.suptitle('Seasonal Mobility Changes in France and Germany')

for i, ax in enumerate(axes.flat):
    metric = metrics[i]
    sns.lineplot(data=data_mobility_season_avg_fr_ge, x='season', y=metric, hue='country_region', ax=ax)
    ax.set_title(titles[i])
    ax.set_xlabel('Season')
    ax.set_ylabel('Avg Change (%)')

plt.savefig("Seasonal Mobility Changes in France and Germany _ 2", transparent=None, dpi='figure', format=None,
        metadata=None, bbox_inches=None, pad_inches=0.1,
        facecolor='auto', edgecolor='auto', backend=None
       )

plt.tight_layout(rect=[0, 0.03, 1, 0.95])
plt.show()


### Analyse approfondie
#### Mobilité par région

csv_file_name = "analyse_app_mobility_region_FR_GE.csv"
path = "/home/dai/Documents/Python_Projects/sql/tp2_bigquery/data/data_tp2/"
data_mobility_regions_FR_GE = pd.read_csv(path + csv_file_name)

# Les données
data_mobility_regions_FR_GE.info()

retail_recreation_df = data_mobility_regions_FR_GE.groupby(['sub_region_1', 'country_region']).agg({'avg_retail_recreation': 'mean'}).reset_index()
retail_recreation_df = retail_recreation_df.pivot(index='sub_region_1',columns= 'country_region', values='avg_retail_recreation').reset_index()

work_places_df = data_mobility_regions_FR_GE.groupby(['sub_region_1', 'country_region']).agg({'avg_workplaces': 'mean'}).reset_index()
work_places_df = work_places_df.pivot(index='sub_region_1',columns= 'country_region', values='avg_workplaces').reset_index()

# Création des graphiques
fig, axes = plt.subplots(nrows=2, ncols=1, figsize=(12, 12))

# Graphique pour Retail & Recreation
retail_recreation_df.plot(kind='bar', x='sub_region_1', ax=axes[0], color=['skyblue', 'salmon'])
axes[0].set_title('Changes in Retail & Recreation Mobility on Holidays')
axes[0].set_xlabel('Holiday')
axes[0].set_ylabel('Avg Change (%)')
axes[0].legend(title='Period')

# Graphique pour Workplaces
work_places_df.plot(kind='bar', x='sub_region_1', ax=axes[1], color=['skyblue', 'salmon'])
axes[1].set_title('Changes in Workplaces Mobility on Holidays')
axes[1].set_xlabel('Holiday')
axes[1].set_ylabel('Avg Change (%)')
axes[1].legend(title='Period')

plt.savefig("Changes_in_Retail_and_Recreation_Mobility_Sub_Region", transparent=None, dpi='figure', format=None,
        metadata=None, bbox_inches=None, pad_inches=0.1,
        facecolor='auto', edgecolor='auto', backend=None
       )

plt.tight_layout()
plt.show()

#### Impact jours fériés 

csv_file_name = "analyse_app_mobility_region__jours_feries_FR_GE.csv"
path = "/home/dai/Documents/Python_Projects/sql/tp2_bigquery/data/data_tp2/"
data_mobility_jours_feries_fr_ge = pd.read_csv(path + csv_file_name)

# Agrégation des doublons en prenant la moyenne
retail_recreation_df = data_mobility_jours_feries_fr_ge.groupby(['holiday_name', 'period']).agg({'avg_retail_recreation': 'mean'}).reset_index()
retail_recreation_df = retail_recreation_df.pivot(index='holiday_name', columns='period', values='avg_retail_recreation').reset_index()


workplaces_df = data_mobility_jours_feries_fr_ge.groupby(['holiday_name', 'period']).agg({'avg_workplaces': 'mean'}).reset_index()
workplaces_df = workplaces_df.pivot(index='holiday_name', columns='period', values='avg_workplaces').reset_index()

# Création des graphiques
fig, axes = plt.subplots(nrows=2, ncols=1, figsize=(12, 12))

# Graphique pour Retail & Recreation
retail_recreation_df.plot(kind='bar', x='holiday_name', ax=axes[0], color=['skyblue', 'salmon'])
axes[0].set_title('Changes in Retail & Recreation Mobility on Holidays')
axes[0].set_xlabel('Holiday')
axes[0].set_ylabel('Avg Change (%)')
axes[0].legend(title='Period')

# Graphique pour Workplaces
workplaces_df.plot(kind='bar', x='holiday_name', ax=axes[1], color=['skyblue', 'salmon'])
axes[1].set_title('Changes in Workplaces Mobility on Holidays')
axes[1].set_xlabel('Holiday')
axes[1].set_ylabel('Avg Change (%)')
axes[1].legend(title='Period')

plt.savefig("Changes_in_Retail_and_Recreation_Mobility_On_Holidays", transparent=None, dpi='figure', format=None,
        metadata=None, bbox_inches=None, pad_inches=0.1,
        facecolor='auto', edgecolor='auto', backend=None
       )

plt.tight_layout()
plt.show()

