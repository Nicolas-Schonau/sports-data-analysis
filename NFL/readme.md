# National Football League 

## Data source

All the data for these analysis come from the [nflfastR](https://github.com/mrcaseb/nflfastR?) source. A tutorial on how to use it with Python can be found [here](https://github.com/maxbolger/nflfastR-Python-Tutorial/blob/main/nflfastR_python_tutorial.ipynb).

## Publication
The majority of the visualisations produced by the code here can be found on [skillalytics.com](http://skillalytics.com/stats/nfl-quarterbacks/).

## [Win Probability added](https://github.com/Nicolas-Schonau/sports-data-analysis/tree/master/NFL/WPA)
WPA "is a metric that measures how much more likely a team is to win a game after a given play"([source](https://medium.com/@hajimealabanza/did-the-new-orleans-saints-add-the-missing-piece-to-their-offense-fe9bb2f37116)). In other words, each action impacts the probabilities to win the game, either positively or negatively. This impact is quantified and recorded as "WPA", "Win Probability Added". 

WPA is "context-sensitive": a TD on the 1st possession of the game versus a TD  with 5 seconds remaining while trailing less than 6 will have totally different impacts on the Win Probability. 

#### [QB ranking](https://github.com/Nicolas-Schonau/sports-data-analysis/blob/master/NFL/WPA/QB_ranking_by_WPA_all_season.ipynb)
The first notebook in this folder presents a global table with the average WPA of each passing play for QBs that have at least 25 pass attempts on the season. 

### [Heatmaps per pass type](https://github.com/Nicolas-Schonau/sports-data-analysis/blob/master/NFL/WPA/Heatmap_all_qb_wpa.ipynb)
The second one displays the WPA for a combination of passe distances (short or deep) and locations (deep, middle or right) on heatmaps. This gives a direct understanding of the most impactful passes of the QB. 

### [Rookies](https://github.com/Nicolas-Schonau/sports-data-analysis/blob/master/NFL/WPA/impact_rookie_qbs_2020.ipynb)
An additional notebook focus on the results of 3 rookies QB, i.e.: Joe Burrow, Tua Tagovailoa and Justin Herbert.

## [Expected Points Added](https://github.com/Nicolas-Schonau/sports-data-analysis/tree/master/NFL/EPA)
EPA is a metric that calculates the difference between the points that a team is expected to score based on their down-and-distance info (plus other parameters) at a given moment, and the expected points after an action occurred. Offenses get positive EPA if they perform well, while defenses get negative EPA if they can block the other team. 

Unlike WPA, EPA is not sensitive to context: a 1st-and-goal on the 2 yards line of your opponent endzone will give you the same expected points, wether it be at the beginning of the game or at the end.

The first notebook in this folder presents a global table with the average EPA of each passing play for QBs that have at least 25 pass attempts on the season. The second one displays the EPA for a combination of passe distances (short or deep) and locations (deep, middle or right) on heatmaps. This gives a direct understanding of the most impactful passes of the QB.
