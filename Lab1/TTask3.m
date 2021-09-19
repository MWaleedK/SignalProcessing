someVar=VideoReader('Video.mp4');
i=someVar.NumberOfFrames;
disp('Playing The Video')
while hasFrame(someVar)
     frame=readFrame(someVar);
     imshow(frame)
end

disp('Playing The Video in reverse')
for j=i:-1:1 
    frame=read(someVar,j);
    imshow(frame)
end