#Build an image starting with the scipy-notebook image
FROM jupyter/scipy-notebook 
#Set the working directory to /home/jovyan/repo
WORKDIR /home/jovyan/repo
#Set the user to root the amdin user.
USER root
#install and upfate files
RUN sudo apt update && sudo apt -y upgrade && sudo apt -y install git
RUN apt update && apt -y upgrade && apt -y install git
#set back to standard jupyter user.
USER jovyan
#copy requirements.txt and install the Python dependencies.
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
#Add metadata to the image to describe that the container is listening on port 8888
EXPOSE 8888
