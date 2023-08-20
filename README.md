# hilbert_curve_public
### Draw 2D Hilbert Curve in Processing

### How to Run
Fire it up in [processing](https://processing.org/), and use mousescroll up or down. Fairly simple. An illustration:

![demo](https://github.com/DogtorDoggo/hilbert_curve_public/assets/5264031/b3b5dbd7-d5dc-44cf-aaf3-768e616a9003)



### Notes

1. You can change canvas size in `size()` under `setup()` function. But canvas size must be set as $2^n \times 2^n$. At the same time, max order of Hilbert Curve that could be drawn is $n-1$. For example, if canvas is $512 \times 512$, we can draw HC upto $8$-th order, and up to $10$-th order if canvas is $2048 \times 2048$.

2. Standard Hilbert Curve starts from a **C** shape, but I suggest you try others like A, B, D. You can change the start type in `displayHC()` under `draw()`.


### Reference(s)

1. https://en.wikipedia.org/wiki/Hilbert_curve
