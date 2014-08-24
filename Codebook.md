<h1> Codebook </h1>

<h2> The Data </h2>

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

[](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

<h2> The Variables </h2>

stest - subject test data
strain - subject train data

xtest - x test data
xtrain - x train data

ytest - y test data
ytrain - y train data

features - feature data
activitylabel - the labels of the activities

xtrain.test - combination of xtrain and xtest data
ytrain.test - combination of ytrain and ytest data
sstrain.test - combination of subject train and test data

meanstd - greps only the mean and std data
xtrain.test.mean.std - filters train test data for x by mean and std
ytrain.test.activity - filters train test data for y by activity
datamerge - combines the filtered data for subject, x, y 
datamelt - melts data into a molten data frame with descriptive colnames
data.average - takes average of each variable for each activity

<h2> The Transformations </h2>


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

