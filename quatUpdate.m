function [next] = quatUpdate(p,q,r,orig)
next=0.5*[0 -p -q -r;
          p  0  r -q;
          q -r  0  p;
          r  q -p  0];
next=next*orig;
end

