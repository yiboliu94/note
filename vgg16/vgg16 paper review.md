## This is the review of VGG16 network

[The VGG16 official site]( spectrum.net/selfinstall)

[The VGG16 network paper link](spectrum.net/selfinstall)

(Chinese) [A good reference to understand what's happening in VGG16](https://zhuanlan.zhihu.com/p/41423739)

### About fileter field replacement
![Image1](https://github.com/yiboliu94/note/blob/master/vgg16/figs/Figure1.jpg)

Mentioned that: a 7X7 convolution filter can be replaced by three 3X3 filter, a 5X5 filter can be replaced by two 3X3 filter. Here is my understanding:\

I think 'one 7X7 filter equals to three 3X3 filters' is because of the padding=valid. 7x7 filter convolution will lose 6 pixel width in output dimension. The 3X3 filter will lose 2 pixel width in output dimension, hence we use 3X3 filter to do convolution three times will lose 3X2=6 pixels in the width of output feature map.  That's the 'Equivalent'.\

The benefit of replace big filter with multiple small filters:\
1. Reduce computation load: Besides the feature's marginal pixel, only think about the majority pixels in the center of feature map(white pixels in Figure2). A feature map pixels will be used for K^2 times， K is the filter width(Think about GPU class convolution).\ 
![Image2](https://github.com/yiboliu94/note/blob/master/vgg16/figs/Figure2.jpg)\
A output pixel needs  K^2=49 Mul operations. But with 3 times of small filter convolution, A output pixels needs 3XK'^2=3X3^2=27 Mul operations.\
Possible drawback: More I/0 operations. More intermediate data layers.\
2. Based on paper, higher accuracy?




