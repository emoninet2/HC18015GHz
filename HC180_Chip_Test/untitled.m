
weights = [];
for c = 1:729
    a = abs(DATA(c).CM_Phase_Diff);
    b = abs(DATA(c).DM_Phase_Diff);
    weights(c) = a + b;
end


[minVal ind] = min(weights);