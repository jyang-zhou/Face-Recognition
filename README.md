# Face-Recognition

I used PCA to do this project. The process includes training
face database, finding mean, making all samples subtract mean, calculating variance matrix,
finding eigenvalues and eigenvectors, lowering dimensional training sets, lowering dimensional
testing set, and doing face recognition.

# Sample Dataset

## Training Set - Faces

There is a face image library from [Yale University](https://www.yale.edu/), including 15 people with 4 faces per person, and each image has 128x128 pixels (Picture II). This
image library is unable to be used directly, because each image is a 2-dimensional matrix and is
hard to address. All images should be transferred into a 1x(128x128) 1-dimensional array. To
calculate the mean (Picture III), all images' arrays are added up and then divided by 60, which
is the total number of images (15 people x 4 faces).

![train](https://user-images.githubusercontent.com/95513386/147622925-7ff5cbbc-8686-4df6-9a10-eb9224958689.jpg)

## Test Set - Faces

![testface](https://user-images.githubusercontent.com/95513386/147622948-355ef951-6350-4311-8315-4d57ffdeb864.jpg)


# Accuracy

The accuracy reaches 97.78% in this simple sample dataset.

Sample output is shown as follows, where in the left are the testing faces, in the right are the recognized faces.


<div align=center><img width="200" height="150" src="https://user-images.githubusercontent.com/95513386/147623240-f7f4433f-7c66-44a0-887a-ad18c23536cc.jpg"/>
<img width="200" height="150" src="https://user-images.githubusercontent.com/95513386/147623244-bc1cea66-3c95-4f7a-a89e-23653124c5d8.jpg"/>
<img width="200" height="150" src="https://user-images.githubusercontent.com/95513386/147623249-35bbfdaf-c082-4e70-8662-190dda95debf.jpg"/>
<img width="200" height="150" src="https://user-images.githubusercontent.com/95513386/147623252-ba3cef39-32b6-4b60-bea7-6f13aed0d5d8.jpg"/>
<img width="200" height="150" src="https://user-images.githubusercontent.com/95513386/147623255-92bbebbd-2500-41c3-a26f-f4c82ba70c2d.jpg"/>
<img width="200" height="150" src="https://user-images.githubusercontent.com/95513386/147623595-f9a840a3-e359-4c77-b980-57ff67328f9a.jpg"/>
<img width="200" height="150" src="https://user-images.githubusercontent.com/95513386/147623598-6118dad9-edb4-43a3-a81b-58cfafbbdb7d.jpg"/>
<img width="200" height="150" src="https://user-images.githubusercontent.com/95513386/147623608-78c7ac7a-a2cc-4576-b183-8f51245d2169.jpg"/></div>

# Reference
1. Powell, Victor. \Principal Component Analysis Explained Visually."Principal Component
Analysis, setosa.io/ev/principal-component-analysis/.
2. Kaur, Ramandeep, and Er. Himanshi. \Face Recognition Using Principal Component Analy-
sis." 2015 IEEE International Advance Computing Conference (IACC), 2015, doi:10.1109/iadcc.2015.7154774.

