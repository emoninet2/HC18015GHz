
clear all

DATA = {};
dc = visadev('TCPIP0::192.168.1.68::5025::SOCKET');
dc2 = visadev('TCPIP0::192.168.1.69::inst0::INSTR');
vna = visadev('TCPIP0::192.168.1.67');

startFreq = 1e9;
stopFreq = 20e9;
numOfPoints = 501;
freq = linspace(startFreq,stopFreq,numOfPoints);

%%

%SParam = getDataFromVNA(vna);

%%
%DC_Gen_Ctrl(dc, dc2, 1.2,3.7,2,.5,0.15,0.25,0.35,0.45,0,0,0,0);

%%
%SetVoltages(dc,dc2,-.25,-0.55,-0.55)


%%
Vbias = [ -0.8 , -0.6 , -0.4 , -0.2 , 0 , 0.2 , 0.4 , 0.6, 0.8 ];
VVarOffset = [-0.8, -0.6 , -0.4 , -0.2,   0.0,  0.2, 0.4, 0.6, 0.8 ];

% Vbias = [ 0.0 ];
% VVarOffset = [ 0.0 ];

totalRuns = length(Vbias) * length(VVarOffset) * length(VVarOffset);

runID = 1;

for i = 1:length(Vbias)
    
    for j = 1:length(VVarOffset)

        for k = 1:length(VVarOffset)
            %disp(num2str(Vbias(i)) + " , "  + num2str(VVarOffset(j)) + " , "  + num2str(VVarOffset(k)  )) ;
        
            xVbias = Vbias(i);
            xV1 = xVbias + VVarOffset(k);
            xV2 = xVbias + VVarOffset(j);
        
            
            disp("Progress: " + num2str(runID) + "/" + num2str(totalRuns));
            disp("RunID: " + runID);
            disp("Varactor 1 Voltage: " + xV1);
            disp("Varactor 2 Voltage: " + xV2);
            disp("Bias Voltage: " + xVbias);

            %disp(runID + " : " + xV1 + " , "  + xV2 + " , "  + xVbias  ) ;
            
            DATA(runID).runID = runID;
            DATA(runID).Freq = freq;
            DATA(runID).V1 = xV1;
            DATA(runID).V2 = xV2;
            DATA(runID).VBias = xVbias;

            SetVoltages(dc,dc2,xV1,xV2,xVbias);

            DATA(runID).SParam = getDataFromVNA(vna);
            procData = ProcessData(15e9, DATA(runID).Freq, DATA(runID).SParam);
            DATA(runID).CM_Phase_Diff = procData{1};
            DATA(runID).DM_Phase_Diff = procData{2};
            DATA(runID).CM_Amp_Imb = procData{3};
            DATA(runID).DM_Amp_Imb = procData{4};
            DATA(runID).Reflection = procData{5};
            DATA(runID).Isolation = procData{6};
            DATA(runID).maxInsertionLoss = procData{7};
            
           

            runID = runID + 1;
        end
    end
end

DC_Gen_Ctrl(dc, dc2, 0,0,0,0,0,0,0,0,0,0,0,0);

%%
