function [an, bn, cn] = ascending(a,b,c)

if(a<=b && b <=c)
    an = a;
    bn = b;
    cn = c;
elseif(a<=c && c <=b)
    an = a;
    bn = c;
    cn = b;
elseif(b<=a && a <=c)
    an = b;
    bn = a;
    cn = c;
elseif(b<=c && c <=a)
    an = b;
    bn = c;
    cn = a;
elseif(c<=a && a <=b)
    an = c;
    bn = a;
    cn = b;
elseif(c<=b && b <=a)
    an = c;
    bn = b;
    cn = a;
end
