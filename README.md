# Monochrome-and-Pixelated-Image-Converter
A program that creates a data type that stores a b&amp;w image and pixelated image

# Monochrome-and-Pixelated-Image-Converter
A program that creates a data type that stores a b&amp;w image and pixelated image

The algorithm:

- call create_image with the width and height of the image
- call set_pixel for every pixel in the image to make them monochrome
- call get_pixel for every pixel to read the monochrome value and save it
- call destroy_image to free the allocated memory

How to execute the program:
```
./blocky sparty.png sparty-m.png
```
The original image:
![sparty](https://user-images.githubusercontent.com/102822796/227120665-b32a5e9e-72ce-4ac3-b116-f4ae5f6139e1.png)
The black and white image produced:
![bw](https://user-images.githubusercontent.com/102822796/227119668-201b5e71-ea54-4756-9ae7-780c24538970.png)
The pixelated image produced:
<img width="539" alt="Screenshot 2023-03-23 at 2 16 01 AM" src="https://user-images.githubusercontent.com/102822796/227119490-d60e1598-f8a6-4c97-bbf9-e2ecc64c338e.png">
