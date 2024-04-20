import numpy as np
import matplotlib.pyplot as plt
from skimage.io import imread                         
from skimage.exposure import cumulative_distribution
def getCDF(image):
    cdf, bins = cumulative_distribution(image)
    cdf = np.insert(cdf, 0, [0]*bins[0])
    cdf = np.append(cdf, [1]*(255-bins[-1]))
    return cdf

# histogram matching
def histMatch(cdfInput, cdfTemplate, imageInput):
    pixelValues = np.arange(256)
    new_pixels = np.interp(cdfInput, cdfTemplate, pixels)
    imageMatch = (np.reshape(new_pixels[imageInput.ravel()], imageInput.shape)).astype(np.uint8)
    return imageMatch

# Preview the result
def plotResult(imInput, imTemplate, imResult):
    plt.figure(figsize=(10,7))
    plt.subplot(1,3,1)
    plt.title('Input Image')
    plt.imshow(imInput)
    plt.axis('off')
    plt.subplot(1,3,2)
    plt.title('Template Image')
    plt.imshow(imTemplate)
    plt.axis('off')
    plt.subplot(1,3,3)
    plt.title('Result')
    plt.imshow(imResult)
    plt.axis('off')
    plt.show()

# read/load the input and template image
image = imread('Slike/lena.png').astype(np.uint8)
imageTemplate = imread('Slike/sunset.png').astype(np.uint8)
pixels = np.arange(256)
# create a matrix for result
imageResult = np.zeros((image.shape)).astype(np.uint8)

# cdf and histogram
for channel in range(3):
    cdfInput = getCDF(image[:,:,channel])
    cdfTemplate = getCDF(imageTemplate[:,:,channel])
    imageResult[:,:,channel] = histMatch(cdfInput, cdfTemplate, image[:,:,channel])

# plot 
plotResult(image, imageTemplate, imageResult)