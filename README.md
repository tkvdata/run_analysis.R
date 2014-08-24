<h1>run_analysis.R</h1>
==============

Course Project for Getting and Cleaning Data Coursera Course

<h2>Introduction</h2>

<p>This README goes over the script run_analysis.R created for Coursera.  The one R script will calculate means per activity, per subject of the mean and Standard deviation of the Human Activity Recognition Using Smartphones Dataset Version 1.0 [1]. This dataset should be [downloaded](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) and extracted directly into the smartphone_data directory.</p>

<h2> Packages Used </h2>

<p>reshape2</p>

<h2>Code Summary</h2>

<ul>
<li>Read and unzip the file "getdata_projectfiles_UCI HAR Dataset.zip" into the "smartphone_data" sub directory.</li>
<li>Read following files into seperate Data Tables:</li>
<ul>
	<li>stest.txt</li>
	<li>strain.txt</li>
	<li>xtest.txt</li>
	<li>xtrain.txt</li>
	<li>ytest.txt</li>
	<li>ytrain.txt</li>
	<li>features.txt</li>
	<li>activitylabels.txt</li>
</ul>
<li>Row Bind all the test and train data into single data table </li>
<li>Rename xtrain.test column names with data recieve in features datatable.</li>
<li>Subset xtrain.test to contain column name having "mean" and "std" into new data table </li>
<li>Merge ytrain.test with activity lables to use the Activity Label names instead of Activity ID in ytrain.test</li>
<li>Merge xtrain.test.mean.std, ytrain.test.activity and strain.test into mergedata</li>
<li>Create new datatable averagedata by grouping them into Subject/Activity and taking average of each feature variable.</li>
<li>Save the averagedata Data Table into "TidyData.txt".</li>
</ul>


