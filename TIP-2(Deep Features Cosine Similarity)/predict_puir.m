inp1 = double((imread(['syn.png'])));
inp2 = double((imread(['org.png'])));
inp1=rgb2ycbcr(inp1);
inp2=rgb2ycbcr(inp2);
 [m,n]=size(inp1);
 v=abs(inp1-inp2);
 tip=v;
se = strel('square',5);
v = imerode(v,se);

se = strel('square',5);
v=imdilate(v,se);
blur=log(255^2*(mean2(v.^2)/mean2(inp2)));
inp3=inp1;
inp4=inp2;
count = 0;
for i=1:m
    for j=1:n/3
        if v(i,j,1) >25 || v(i,j,2) >25 || v(i,j,3) >25
            count=count+1;
        end
    end
end

% IETR dataset parameters
ii = 5.4100;
iii = 3.1100;
tt = 600;
if count> abs((m*n)/tt)
    score=blur*ii;
 else  
    score=blur*iii;
end

 score