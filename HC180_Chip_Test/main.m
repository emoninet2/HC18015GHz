clear all
close all

sparamFiles = dataLoader();
fileCount = size(sparamFiles);


figure(1)
hold on
figure(2)
hold on
figure(3)
hold on

freqOfInterest = 15E9;

for i = 1:fileCount(2)
    disp(sparamFiles(i).FileName);

    if(sparamFiles(i).Vbias == "0mV"  && sparamFiles(i).V2 == "0mV" )
        
        disp("HORRA")

        figure(1)
        sobj = sparameters(sparamFiles(i).FileName);
        frobj = rfparam(sobj, 1, 2);
        %plot(sobj.Frequencies,mag2db(abs(frobj)));
        plot(sobj.Frequencies,(rad2deg(angle(frobj))))
    
    
        figure(2)
        frobj = rfparam(sobj, 1, 3);
        plot(sobj.Frequencies,(rad2deg(angle(frobj))))
    
    
        figure(3)
        frobj = rfparam(sobj, 4, 3);
        plot(sobj.Frequencies,(rad2deg(angle(frobj))))


    end
    
    
    
end



return

sobj = sparameters("s2_BEST_n300mV_n182mV_462mV.s4p")
disp(sobj)

figure(1)
rfplot(sobj)

frobj = rfparam(sobj, 1, 4)

figure(2)
plot(sobj.Frequencies,mag2db(abs(frobj)))

figure(3)
plot(sobj.Frequencies,(angle(frobj)))