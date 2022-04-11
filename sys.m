function [p, sigma] = sys(t,y)
  m = length(t);
  a=zeros(m);
  
  for i=1:m
    for k=0:m-2
      a(i,k+1)=t(i)^(m-2-k);
    endfor
    a(i,m)=(-1)^i;
  endfor
  
  [i,k]= size(y)
  if i<k, y=y'; end
  p=a\y;
  sigma=p(m);
  p(m)=[];
  p=p';
  
