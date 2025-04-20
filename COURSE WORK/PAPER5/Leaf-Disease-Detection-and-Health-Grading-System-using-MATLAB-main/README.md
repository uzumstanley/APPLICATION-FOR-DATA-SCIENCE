# Leaf Disease Detection and Health Grading System

## **Objective:**

Developed an algorithm using deep learning, Image Processing and Fuzzy Inference system that allows the user to identify a disease caused by a particular micro-organism that is infested on the leaf of a plant and also successfully shows estimated health severity of the leaf based on how much of a leaf is infected.

>*You can click [here](https://youtu.be/N7Jr5pAZFg8) to get redirected to the youtube video of this Project.*

[![flow chart](https://user-images.githubusercontent.com/73630123/119841897-d5ffbe00-bf23-11eb-8b50-85d662d42d7a.jpg)](https://youtu.be/N7Jr5pAZFg8)

## **Methodology:**

### I. Neural Network Classifier

The deep learning algorithm studies the different dataset images and classifies into one of the 5 categories: Bacteria, Fungi, Virus, Nematode and Normal Leaf (Not infected at all)

![img1](https://user-images.githubusercontent.com/73630123/119844591-3132b000-bf26-11eb-8151-0c4dc690b854.png)

After classifying feature extraction of the infected leaf has been done using Digital Image Processing technique.

### II. Image processing

Studied the images in the dataset and understanding the different patterns in which the organisms infect the leaf. Thus, the main objective of the technique of image processing is to extract the infected area of the leaf and isolating the background and the green part of the leaf. This would help us to highlight the only the infected area.

![img2](https://user-images.githubusercontent.com/73630123/119844877-6ccd7a00-bf26-11eb-94ed-bf3a323f05ee.jpg)

### III. Fuzzy Rule Base System

Finally after the feature extraction , to determine the health severity of the leaf in terms of percentage, a set of rules have been aggregated by using Fuzzy Inference System in MATLAB

![img3](https://user-images.githubusercontent.com/73630123/119845058-95ee0a80-bf26-11eb-93ee-cfed52f258bd.jpg)

## **Result:**

![result discussion img1](https://user-images.githubusercontent.com/73630123/119840931-04c96480-bf23-11eb-957d-14e49c01d3d9.jpg)
