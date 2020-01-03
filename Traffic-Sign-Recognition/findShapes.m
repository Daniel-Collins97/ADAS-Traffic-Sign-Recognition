rgbImage = imread('sampleSign.png');
% Get the dimensions of the image.
[rows, columns, numberOfColorChannels] = size(rgbImage);
% Display the original color image.
imshow(rgbImage);
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0, 1, 1]);
% Get the color of the background from the upper left pixel
backgroundRGB = impixel(rgbImage, 1,1);
% Get a binary image so that we just need to worry about shapes, not colors.
binaryImage = im2bw(rgbImage, 0.5);
% Display the binary image.
imshowpair(binaryImage,rgbImage,'montage')
hold on;
boundaries = bwboundaries(binaryImage);
numberOfBoundaries = size(boundaries, 1);
for k = 1 : numberOfBoundaries
	thisBoundary = boundaries{k};
	plot(thisBoundary(:,2), thisBoundary(:,1), 'g', 'LineWidth', 2);
end
