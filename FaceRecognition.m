function FaceRecognition
clear  % calc xmean,sigma and its eigen decomposition  
close all
allsamples=[];%all 
alltests=[];
for i=1:15    
    for j=1:4        
        if(i<10)
           a=imread(strcat('E:\Syracuse University\MAT 495\final\test2\train\','00',num2str(i),'0',num2str(j),'.bmp'));     
        else
            a=imread(strcat('E:\Syracuse University\MAT 495\final\test2\train\','0',num2str(i),'0',num2str(j),'.bmp'));  
        end          
        b=a(1:128*128);         
        b=double(b);        
        allsamples=[allsamples; b];  
    end
end

figure(2) %all
for i = 1:60
    subplot(8,8,i);
    imshow(mat2gray(reshape(allsamples(i,:),128,128)));
    hold on;
end

samplemean=mean(allsamples);   
figure %mean
imshow(mat2gray(reshape(samplemean,128,128)));
for i=1:60 
    xmean(i,:)=allsamples(i,:)-samplemean;
end   
figure(3)%all-mean
for i = 1:60
    subplot(8,8,i);
    imshow(mat2gray(reshape(xmean(i,:),128,128)));
    hold on;
end
sigma=xmean*xmean';  
[v,d]=eig(sigma);
d1=diag(d); 
[d2,index]=sort(d1); 
cols=size(v,2);

for i=1:cols      
    vsort(:,i) = v(:, index(cols-i+1) );
    dsort(i)   = d1( index(cols-i+1) );   
end 
dsum = sum(dsort);     
dsum_extract = 0;   
p = 0;     
while( dsum_extract/dsum < 0.9)       
    p = p + 1;          
    dsum_extract = sum(dsort(1:p));     
end
a=1:60;
for i=1:60
y(i)=sum(dsort(a(1:i)) );
end

i=1;
while (i<=p && dsort(i)>0)      
    base(:,i) = dsort(i)^(-1/2) * xmean' * vsort(:,i);   
      i = i + 1; 
end  
% 

figure %average
for i=1:20
  subplot(4,5,i);
  b=reshape(base(:,i)',128,128);%
  imshow(mat2gray(b));
end

allcoor = allsamples * base; accu = 0;   

for i=1:15     
    for j=8:10          
         if(i<10)
            if(j<10)
             a=imread(strcat('E:\Syracuse University\MAT 495\final\test2\test\00',num2str(i),'0',num2str(j),'.bmp'));     
            else
             a=imread(strcat('E:\Syracuse University\MAT 495\final\test2\test\00',num2str(i),num2str(j),'.bmp'));     
            end
         else
             if(j<10)
             a=imread(strcat('E:\Syracuse University\MAT 495\final\test2\test\0',num2str(i),'0',num2str(j),'.bmp'));     
            else
             a=imread(strcat('E:\Syracuse University\MAT 495\final\test2\test\0',num2str(i),num2str(j),'.bmp'));     
             end
        end      
        b=a(1:128*128);        
        b=double(b);        
        alltests=[alltests;b];
        tcoor= b * base; 
        for k=1:60                 
            mdist(k)=norm(tcoor-allcoor(k,:));        
        end     
        [dist,index2]=sort(mdist);          
        class1=ceil(index2(1)/4); 
        class=class1;
        figure
        subplot(1,2,1)
        imshow(mat2gray(reshape(a,128,128)));
        title("Test Face")
        subplot(1,2,2)
        imshow(mat2gray(reshape(allsamples(index2(1),:),128,128)));
        title("Recognized Face")
        if class==i      
            accu=accu+1;        
        end  
    end
end
figure %all
for i = 1:45
    subplot(7,7,i);
    imshow(mat2gray(reshape(alltests(i,:),128,128)));
    hold on;
end
accuracy=accu/45 