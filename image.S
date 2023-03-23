
.data


.equ    image_width, 0
.equ    image_height, 4
.equ    image_array, 8
.equ    image_size, 16
.equ    value, 0
.equ    size, 8
.text
 
.global create_image
//
// void *create_image(int wid, int hit)
// Create an image ADT and return it.
//
create_image:
    stp x29, x30, [sp, #-16]!
    stp x19, x20, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    
    
    
    
    
    mov w19, w0// width
    mov w20, w1 // height
    mov w0, #1
    mov w1, #image_size
    bl calloc //allocating memory 

    str w19, [x0, #image_width] //set initial width
    str w20, [x0, #image_height] // set init height

    mov x21, x0 // image ptr
    mul w0, w19, w20 // w*h
    mov w1, #size
    bl calloc // allocating memory
    str x0, [x21, #image_array]
    mov x0, x21
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
                
    ret
    
    
.global destroy_image   
//
// void destroy_image(void *image)
// Destroy image, freeing memory
//
destroy_image:
    stp x29, x30, [sp, #-16]!
    stp x19, x20, [sp, #-16]!
    //same as in tictac destroy game
    mov x19, x0

    ldr x0, [x19,#image_array]
    bl free
    mov x0, x19
    bl free
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret
    
    
.global get_width
//
// int get_width(void *image)
// Get the width of the image
//
get_width:
    ldr w0,[x0,#image_width]
    ret
    
.global get_height
//
// int get_height(void *image)
// Get the height of the image
//
get_height:
    ldr w0, [x0, #image_height]
    ret
    
        
.global set_pixel
//
// void set_pixel(void *image, int row, int col, double value)
//
set_pixel:
//called to set every pixel to gray value
//eceives the first three parameters in x0, w1, and w2 and the value in d0
  ldr w3,[x0,#image_width]
  ldr x4,[x0,#image_array] //pointing to the start
  mul w3,w1,w3 
  add w3,w3,w2
  mov w5,#size
  mul w3, w3, w5
  add x4, x4, w3, uxtw 
  str d0,[x4,#value]


  ret

.global get_pixel
//
// double get_pixel(void *image, int row, int col)
//
get_pixel:
	ldr d0, =0
  ldr w3,[x0, #image_width]
  ldr x4,[x0, #image_array]
  mul w3,w3,w1
  add w3,w2,w3
  mov w5,#size
  mul w3,w5,w3
  add x4, x4, w3,uxtw
  ldr d0,[x4,#value]
    ret
