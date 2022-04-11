[p, sigma] = sys(t,f(t));
ra = f(t) - polyval(p, t);
r = f(tt) - polyval(p, tt);
[rmax, i] = max(abs(r));
tmax = tt(i);
rmax = r(i);
acc = 1 - abs(sigma/rmax);
after =  sum(t<tmax);
step = step+1;

plot(tt,r,'k',...
     t,ra,'ko',t,t*0,'x',...
     tmax, rmax, '*', tmax, 0, 'x')
grid on
title(sprintf('%d: \\sigma = %g, rmax = %g, acc = %g (i>%d)',...
 step, abs(sigma), abs(rmax), acc, after))

res = [res; [step, sigma, rmax, acc, after]];

after
ra0 = [0,ra,0];
disp('ra(after), rmax, ra(after+1)')
[ra0(after+1), rmax, ra0(after+2)]
