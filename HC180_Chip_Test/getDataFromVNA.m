function SParam = getDataFromVNA(vna)
    startFreq = 1e9;
    stopFreq = 20e9;
    numOfPoints = 501;
    freq = linspace(startFreq,stopFreq,numOfPoints);


    writeline(vna,":INIT1:CONT OFF"); % Sets continuous mode OFF
    writeline(vna,":INIT1;*WAI"); % Triggers Channel 1 and waits until it is completed.
    %data = writeread(vna,"CALC1:DATA:NSW:FIRS? SDATA,1") % Retrieves all traces from 
    data = writeread(vna,"CALC1:DATA:ALL? SDAT "); % Retrieves all traces from 
    writeline(vna,":INIT1:CONT ON"); % Sets continuous mode OFF
    
    
    
    data_split = split(data,",");
    data_split_num = str2double(data_split);
    
    
    %%
    data_split_num = str2double(data_split);
    
    for c = 1:16
        dataHead = (c-1)*numOfPoints*2 + 1;
        dataTail = c*numOfPoints*2;
        %disp(num2str(dataHead) + " : " + num2str(dataTail) + " --> " + num2str( dataTail - dataHead ));
        SParam{c} = data_split_num(dataHead:2:dataTail)+j*data_split_num(dataHead+1:2:dataTail);
        %disp(data_split_num(dataHead:2:dataTail)+j*data_split_num(dataHead+1:2:dataTail));
    end

    
end