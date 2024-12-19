clc;
close all;
clear all;
warning off
c=webcam;
load myNet1;
x=0;
y=0;
height=500;
width=500;
bboxes=[x y height width];
while true
   e=c.snapshot;
   Ifaces = insertObjectAnnotation(e,'rectangle',bboxes,'Processing Area');
es=imcrop(e,bboxes);
   es=imresize(es,[227 227]);
   label=classify(myNet1,es);
   imshow(Ifaces);
   title(char(label));
   drawnow;
end