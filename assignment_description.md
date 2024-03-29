## Assignment 3

In assignment 3 you have to analyze real world data using Bayesian models of cognition. You can apply the models we discussed during the lectures, but you need to adjust them to reflect the specific setup.

The data comes from the social conformity experiment (https://pubmed.ncbi.nlm.nih.gov/30700729/), where cogsci students (in dataset 1) and schizophrenia patients + controls (dataset 2) combine their own intuition of trustworthiness of given faces to social information.

Your task is to

* implement 2 models (at least): simple Bayes vs weighted Bayes. N.B. you'll need to adapt from what we have done in class.
* simulate data from the model to assess whether the models can be fit.
N.B. multilevel and model and parameter recovery are optional for the purpose of the assignment.
* fit them to one dataset (don't forget to explore the data first!)
* check model quality
* do model comparison
* report (v minimal description of research question, v minimal description of data, description of models, model quality checks, report of results)
* [optional]: parameter/model recovery

The datasets are:

* The data from the article cited above (nb. patients are IDs < 200): https://www.dropbox.com/s/khvbkuc0wh1i6et/Simonsen_clean.csv?dl=0
* The data from cogsci students pre pandemic: https://www.dropbox.com/s/v67yrvh03bec0n1/cogsci_clean.csv?dl=0
* The data from cogsci students during the pandemic: https://www.dropbox.com/s/ec80rsa945dlj1y/sc_df_clean.csv?dl=0

<br>

*ID*: an identifier of the participant

*FaceID*: an identifier of the specific face rated

*FirstRating*: the trustworthiness rating (1-8) given by the participant BEFORE seeing other ratings   

*GroupRating*: the trustworthiness rating (1-8) given by others

*SecondRating*: the trustworthiness rating (1-8) given after seeing the others (at second exposure)