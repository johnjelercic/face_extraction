## face_extraction

### Docker is a prerequisite and needs to be installed:
 ```
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
 ```

Build with:

  `docker build -t facext .`

### Once the build completes you can test it with:
`docker run --rm -ti -v /path/to/where/you/want/output/images:/Create-Face-Data-from-Images/faces facext`

### It should complete successfully with something like this:

…
```
Image path: images/kk49_up_sad_sunglasses.jpg
Image kk49_up_sad_sunglasses.jpg converted successfully
Image path: images/ch4f_right_neutral_sunglasses.jpg
Image ch4f_right_neutral_sunglasses.jpg converted successfully
Image path: images/ch4f_up_neutral_sunglasses_4.jpg
Image ch4f_up_neutral_sunglasses_4.jpg converted successfully
Image path: images/saavik_up_sad_sunglasses.jpg
Image saavik_up_sad_sunglasses.jpg converted successfully
Extracted 1419 faces from all images
```
### Then go look in your /path/to/where/you/want/output/images for the results.
 
### When you are ready to play with it by hand then run it interactively with /bin/bash:
 
    `docker run --rm -ti -v /path/to/where/you/want/output/images:/Create-Face-Data-from-Images/faces facext /bin/bash`
 
### You will be dropped into the dir and be ready to go.
 
### If you want to process your own images then add another volume pointed to your source images:

    `docker run --rm -ti -v /path/to/source/images:/Create-Face-Data-from-Images/images -v /path/to/where/you/want/output/images:/Create-Face-Data-from-Images/faces facext /bin/bash`
