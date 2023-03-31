# Collaboration in the Field of Evolutionary Game Theory
> This project investigates infuential publications and their connections within the field of evolutionary game theory.

## Table of Contents
* [General Info](#general-information)
* [Notebooks](#notebooks)
* [Data](#data)
* [Planned Improvement](#planned-improvement)
* [Contact](#contact)


## General Information
This project investigates infuential scientific publications and their connections within the field of evolutionary game theory. Existing subfields shall be identified. A connection is defined as two publications being cited by a third publication.

## Notebooks
Pt 1 Overview of Scopus and WoS data sets evolgath:
Here, we are generating a descriptive overview on Scopus and Web of Science data sets that had been achieved with the keyword "evolutionary game theory".

Pt 2 Creating dictionaries and cleaning item_id_cited:
To later be able to generate connections between the publications, we are creating a dictionary that allows us to track the internal publication IDs.
Manual cleaning of internal IDs is done for duplicates that could not be dealt with automatically.

Pt 3 Creating networks:
The network is finally created, taking into account the calculation of a CoCit-value and the weighting of edges based on the frequency of two publications being cited by a third publication. Louvain clusters are generated. Most influential publications within clusters are identified.

## Data
The data sets for the project had been collected from the "Kompetenzzentrum Bibliometrie" and must not be shared publicly.
Any original or generated files should be stored in the same directory as the notebooks.

## Planned Improvement
Please note that the current versions might not always be up to date at this point, the project in progress and it is being extended and revised.

Currently working on: 
Layout and cleaning of existing notebooks

To do in the future:
Random seed for comparable results in clusters

## Contact
You can contact the [DYNOSOB](http://web.evolbio.mpg.de/social-behaviour/people/) - Group for more information.
