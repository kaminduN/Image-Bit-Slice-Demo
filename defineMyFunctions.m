%Image processing function Testing file
function funs = defineMyFunctions
  funs.loadimage=@loadimage;
  funs.fun2=@fun2;
  funs.slicer=@slicer;
end

function im=loadimage(path)
  im=imread(path);
end

function z=fun2
  z=1;
end

%{
actual slising of the image
input -
val ,contents = witch image to slice 
    eg: b1 => least significan bit 
im = grayscale image , 

logic 

121 = 1111001
b1 => i=1
1 =mod(121 ,2) %last bit is taken
60 =floor(121/(2*i))
60=> 111100 %last bit is removed

b2=> i=2
%}
function bit1=slicer(val,contents,im)
switch contents{val}
    case 'b1'
        bit1 = mod(im,2);
     
    case 'b2'
        bit1=mod(floor(im/2),2);
    case 'b3'
        bit1=mod(floor(im/4),2);
       % disp('positive 3');
    case 'b4'
        bit1=mod(floor(im/8),2);
        %disp('positive 4')
    case 'b5'
        bit1=mod(floor(im/16),2);        
        %disp('positive 5')
    case 'b6'
        bit1=mod(floor(im/32),2);
        %disp('positive 6')
    case 'b7'
        bit1=mod(floor(im/64),2);
       % disp('positive 7')
    case 'b8'
        bit1=mod(floor(im/128),2);
        
    otherwise
        %disp('other value')
        bit1=im;
end

end