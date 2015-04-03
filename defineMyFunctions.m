%Image processing function Testing file
function funs = defineMyFunctions
  funs.loadimage=@loadimage;
  funs.fun2=@fun2;
  funs.slicer=@slicer;
  funs.sliceView=@sliceView;
end

function im=loadimage(path)
  im=imread(path);
end

function z=fun2
  z=1;
end

%{

input -
val ,contents = witch image to slice 
    eg: b1 => least significan bit 
im = grayscale image , 

logic 

121 = 1111001
b1 => i=1
1 =mod(121 ,2) %last bit is taken
60 =floor(121/(2.^i))
60=> 111100 %last bit is removed

b2=> i=2
%}
function bit1=slicer(val,contents,im)
switch contents{val}
    case 'b1'
        %bit1 = mod(im,2);
     bit1=sliceimage(im,0);
    case 'b2'
        %bit1=mod(floor(im/2),2);
        bit1=sliceimage(im,1);
    case 'b3'
       bit1=sliceimage(im,2);
    case 'b4'
        bit1=sliceimage(im,3);
    case 'b5'
        bit1=sliceimage(im,4);
    case 'b6'
        bit1=sliceimage(im,5);
    case 'b7'
        bit1=sliceimage(im,6);
    case 'b8'
        %bit1=mod(floor(im/128),2);
        bit1=sliceimage(im,7);
    otherwise
        %disp('other value')
        bit1=im;
end
end

%{
actual slising of the image
%}
function simg= sliceimage(im,i)
    if(i>=0)
        simg=mod(floor(im/(2.^i)),2);
    else
        simg=im
    end
end


function sliceView(im)

figure(1),title('Bit slice'),
    
        subplot(331),
        imshow(sliceimage(im,0),[]),title('least significant bit');
        subplot(332),
        imshow(sliceimage(im,1),[]);
        subplot(333),
        imshow(sliceimage(im,2),[]);
        subplot(334),
        imshow(sliceimage(im,3),[]);
        subplot(335),
        imshow(sliceimage(im,4),[]);
        subplot(336),
        imshow(sliceimage(im,5),[]);
        subplot(337)
        imshow(sliceimage(im,6),[]);
        subplot(338),
        imshow(sliceimage(im,7),[]),title('most significant bit');
        
end