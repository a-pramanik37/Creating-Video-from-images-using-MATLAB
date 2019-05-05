%Create Video with Image Sequence
clear all;
clc;
%Make the Below path as the Current Folder
cd('D:\4-2 4-2 4-2\Thesis Works\videoMaking\images');

%Obtain all the JPEG format files in the current folder
Files = dir('*.png');


%Find the total number of JPEG files in the Current Folder
NumFiles= size(Files,1);

%Preallocate a 4-D matrix to store the Image Sequence
%Matrix Format : [Height Width 3 Number_Of_Images]
Megamind_Images = uint8(zeros([613 1366 3 NumFiles*5]));

%To write Video File
VideoObj = VideoWriter('Create_Video.avi');
%Number of Frames per Second
VideoObj.FrameRate = 5; 
%Define the Video Quality [ 0 to 100 ]
VideoObj.Quality   = 80;  


count=1;

for i = 1 : NumFiles
  
   %Read the Images in the Current Folder one by one using For Loop
   I = imread(Files(i).name);
 
   %for extracting date and time from image name
   d =  Files(i).name(1:10);
   t =  Files(i).name(12:22);
   
   %setting date and time as text onto the image
  J = insertText(I, [20 50],d, 'FontSize',30, 'TextColor','red');
  J = insertText(J, [20 110],t, 'FontSize',30, 'TextColor','green');
  
   %The Size of the Images are made same
   ResizeImg = imresize(J,[613 1366]);
  
    
  
   %Each Image is copied 5 times so that in a second 1 image can be viewed
   for j = 1 : 5
     Megamind_Images(:,:,:,count)=ResizeImg;
     count = count + 1;
   end
 
end

%Open the File 'Create_Video.avi'
open(VideoObj);


%Write the Images into the File 'Create_Video.avi'
writeVideo(VideoObj, Megamind_Images);


%Close the file 'Create_Video.avi'
close(VideoObj);
'end'
