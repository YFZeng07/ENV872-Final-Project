# ENV872-Final-Project-

## Summary
This repository is the working space for Cheney Gardner and Yingfan Zeng's final project for Environmental Data Analytics (ENV 872) at Duke University, Spring 2021. This project studies the dam removal trend in North Carolina and takes the Falls Lake Dam as an example to explore the hydrological effects of a dam. The repository contains data, R codes for analysis, and output tables and plots and the final report for this project. 

## Investigators
Cheney Gardner, Nicholas School of the Environment, Duke University, cheney.gardner@duke.edu

Yingfan Zeng, Nicholas School of the Environment, Duke University, yingfan.zeng@duke.edu

## Keywords
Dams, Hydrology, Discharge, North Carolina

## Database Information
Dam Removal Spatial Data:
Data were collected from the American Rivers Dam Removal Database (https://figshare.com/articles/dataset/American_Rivers_Dam_Removal_Database/5234068) on 4/5/2021. 

River Discharge Data:
Original data were collected from USGS National Water Information System (https://waterdata.usgs.gov/nwis) on 4/4/2021.Discharge data from 4 gages were collected: Falls Lake (02087183), Clayton (02087500), Goldsboro (02089000), and Kinston (02089500). Wrangled data were saved in the folder Data/Processed. 

## Folder structure, file formats, and naming conventions 
There are 4 folders in this repository:

1. Data

There are 2 subfolders in this folder: Raw and Processed. The Raw subfolder contains all the raw data downloaded from sources as descriped in the section of Database Information. THe Processed folder has all the datasets after wrangling.
* Raw discharge data are in the formats of txt or csv, with a naming conventions of ID_Name_daily.txt or .csv.  
* Processed discharge datasets are in the format of csv, and named as Name_processed.csv.

2. Code

All the analysis R codes, in both Rmd and R formats, are in this folder. They are named by their contents. 

3. Output

The Output folder has all the resulted outputs from the analysis.
* Maps: gage station location and dam removal in NC.
* Plots: plots for the overview of discharge, time series analysis, and GLMs.
* Tables: the table of t-test results

4. Gardner_Zeng_ENV872_Project_files

This is the folder for all plots generated when knitting the final report. They are all PDFs and named by their contents.


## Metadata

All the data are in the Data folder.
* Raw
  + 02087183_FallsLake_daily.csv: Daily discharge data from USGS Falls Lake gage
  + 02087500_Clayton_daily.csv: Daily discharge data from USGS Clayton gage
  + 02089000_Goldsboro_daily.csv: Daily discharge data from USGS Goldsboro gage
  + 02089500_Kinston_daily.csv: Daily discharge data from USGS Kinston gage
  + ARDamRemovalList_Figshare_Feb2021.csv: Dam removal data
  + falls_lake.csv: Geospatial location of the Falls Lake
  + gage_data_dam_new.csv: Geospatial location of the 4 gages
  + spatial_nc: shapefiles for NC
* Processed
  + FallsLake_processed.csv: Falls Lake discharge after wrangling
  + Clayton_processed.csv: Clayton discharge after wrangling
  + Goldsboro_processed.csv: Goldsboro discharge after wrangling
  + Kinston_processed.csv: Kinston discharge after wrangling

## Scripts and code

All the scripts and codes are in the Code folder.
* dam_map_shared.Rmd: creating the dam removal map in NC
* gage_map_shared.Rmd: creating the gage location map 
* Gardner_HTML_maps: creating HTML maps for the above 2 maps
* Data wrangling.R: data wrangling for the discharge data
* Discharge_analysis.R: data analysis for the discharge data

## Quality assurance/quality control
The data is the latest obtained from reliable sources. NAs and outliers are omitted in the process of wrangling. The collaboration and version control are via GitHub.
