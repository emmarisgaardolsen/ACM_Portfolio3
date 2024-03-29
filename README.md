# ACM Portfolio 3
Study Group 6 - Portfolio 3, Advanced Cognitive Modeling 

### Experiment description

The data comes from the social conformity experiment where a participant is asked to rate the trustworthiness of a face. Immediately after having given a rating, the participant is then shown the ratings of the same face by a group of people. After an hour, the participant is asked to rate the face again. The experiment is repeated for a number of faces. The data is collected from cognitive science students during the pandemic.

### Data description
The data comes from the social conformity experiment (https://pubmed.ncbi.nlm.nih.gov/30700729/), where cogsci students combine their own intuition of trustworthiness of given faces to social information.

The important variables in the data are the following:

| Variable | Description |
|----------|----------|
| FaceID        | Number representing faces [INT]     |
| FirstRating   | Initial trustworthiness rating given by participant [INT]    |
| GroupRating   | Mean trustworthiness rating given by group [INT]    |
| SecondRating  | Second trustworthiness rating given by participant [INT]    |
| Feedback      | Difference between first rating and group rating [INT]    |
| Change        | Difference between first and second rating by participant [INT]    |