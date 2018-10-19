function [val] = vlimit(tbl,in)
if in<tbl(1)
    val=tbl(1);
elseif in>tbl(end)
    val=tbl(end);
else
    val=in;
end  
end

