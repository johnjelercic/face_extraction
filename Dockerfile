FROM python:3.7.2-slim-stretch

RUN apt -y update && apt -y install curl git libsm6 libxext6 libglib2.0-0 libfontconfig1 libxrender1 imagemagick
RUN curl -o face.tar.gz https://archive.ics.uci.edu/ml/machine-learning-databases/faces-mld/faces.tar.gz
RUN git clone https://github.com/johnjelercic/Create-Face-Data-from-Images
RUN mkdir Create-Face-Data-from-Images/images
RUN tar zxvf face.tar.gz
RUN find faces -type f -exec cp {} Create-Face-Data-from-Images/images/ \;
RUN rm -rf faces face.tar.gz
WORKDIR /Create-Face-Data-from-Images/images/
RUN mogrify -format jpg *.pgm
RUN rm *.pgm
WORKDIR /Create-Face-Data-from-Images
RUN pip install -r requirements.txt
CMD python data_generator.py && python face_extractor.py
