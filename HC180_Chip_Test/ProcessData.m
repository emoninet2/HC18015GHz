function output = ProcessData(freqOfInterest, freqRange, SParam)


    S11 = SParam{1};
    S12 = SParam{2};
    S13 = SParam{3};
    S14 = SParam{4};
    S21 = SParam{5};
    S22 = SParam{6};
    S23 = SParam{7};
    S24 = SParam{8};
    S31 = SParam{9};
    S32 = SParam{10};
    S33 = SParam{11};
    S34 = SParam{12};
    S41 = SParam{13};
    S42 = SParam{14};
    S43 = SParam{15};
    S44 = SParam{16};




    [c index] = min(abs(freqRange-freqOfInterest));
      

    plot(freqRange,mag2db(abs(S11)));
    %plot(freqRange,rad2deg( angle((S12))));
    CM_Phase_Diff = (rad2deg( angle((S24))) - rad2deg( angle((S34))));
    DM_Phase_Diff = 180 - (rad2deg( angle((S21))) - rad2deg( angle((S31))));
    CM_Amp_Imb = abs(mag2db(abs(S24)) - mag2db(abs(S34)));
    DM_Amp_Imb = abs(mag2db(abs(S21)) - mag2db(abs(S31)));
    %InsertionLoss = 4;


    
    Reflections = [ mag2db(abs(S11(index))),mag2db(abs(S22(index))),mag2db(abs(S33(index))),mag2db(abs(S44(index))) ];
    Isolations = [ mag2db(abs(S41(index))),mag2db(abs(S32(index))),mag2db(abs(S23(index))),mag2db(abs(S14(index))) ];
    InsertionLosses = [ mag2db(abs(S13(index))),mag2db(abs(S43(index))),mag2db(abs(S21(index))),mag2db(abs(S31(index))) ];


    maxReflection = max(Reflections);
    maxIsolation = max(Isolations);
    maxInsertionLoss = min(InsertionLosses) + 3;

 

    output = {CM_Phase_Diff(index),DM_Phase_Diff(index),CM_Amp_Imb(index),DM_Amp_Imb(index),maxReflection,maxIsolation,maxInsertionLoss};


end