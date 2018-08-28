[FileName,PathName] = uigetfile('*.jpg;*.png;*.gif;*.tif','Select an image');
i=imread(strcat(PathName,FileName));
i1=rgb2gray(i)
figure(1)
imshow(i1)
t=graythresh(i1)
i2=im2bw(i1,t)
figure(2)
imshow(i2)
i3=medfilt2(i2)
figure(3)
imshow(i3)
SE=strel('rectangle',[3,3])
i4=imdilate(i3,SE)
figure(4)
imshow(i4)
i5=imerode(i3,SE)
figure(5)
imshow(i5)
i6=imsubtract(i4,i5)
figure(6)
imshow(i6)
i7=imclearborder(i6)
figure(7)
imshow(i7)
i8=imfill(i7,'holes')
figure(8)
imshow(i8)
i9=bwareaopen(i8,50,8)
figure(9)
imshow(i9)
i10=bwmorph(i9,'thin')
figure(10)
imshow(i10)
st = regionprops(i10, 'BoundingBox')
figure(11)
imshow(i10)
for k = 1 : length(st)
BB = st(k).BoundingBox
rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','g','LineWidth',2 )
end
A1 = imread('P:\VIT\MINE\SEMESTER 3\Image Processing\J Component\template.JPG');
B1 = i10
A = A1(:,:,1);
B = B1(:,:,1);
figure,imagesc(B1);title('Target Image');colormap(gray);axis image
grayA = rgb2gray(A1);
Res = A;
Res(:,:,1)=grayA;
Res(:,:,2)=grayA;
Res(:,:,3)=grayA;
figure,imagesc(Res);
winopen('carnum.txt')
