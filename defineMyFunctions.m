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