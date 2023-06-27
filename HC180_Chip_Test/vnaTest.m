% 
% %%
% vna.Timeout = 65;
% writeline(vna,"SYST:DISP:UPD ON");

%% LINEAR SWEEP FREQ
fstart = "1 GHz";
fstop = "20 GHz";
points = 501;
power = 0;

% % Configure the sweeping parameters
% % writeline(vna,"*RST"); % Reset VNA.
% writeline(vna,"*CLS");
% writeline(vna,"CONF:CHAN1:STAT ON");
% writeline(vna,"SENSE1:FREQ:STAR "+fstart);
% writeline(vna,"SENSE1:FREQ:STOP "+fstop);
% writeline(vna,"SENSE1:SWEEP:POINTS "+points);
% writeline(vna,"SOUR1:POW "+power);
% 
% % Define Traces and plot in Windows
% writeline(vna,"CALC1:PARAMETER:SDEFINE 'Trc1','S11'");
% writeline(vna,"CALC2:PARAMETER:SDEFINE 'Trc2','S21'");
% writeline(vna,"DISP:WIND1:STATE ON");
% writeline(vna,"DISP:WIND2:STATE ON");
% writeline(vna,"DISP:WIND1:TRAC1:FEED 'Trc1'");
% writeline(vna,"DISP:WIND2:TRAC1:FEED 'Trc2'");
%%
for c = 1:1
    scpi = "CONF:CHAN" + num2str(c) + ":STAT OFF" ;
    disp(scpi);
    writeline(vna,scpi)
end

%%
SParam = ["S11","S12","S13","S14","S21","S22","S23","S24", "S31","S32","S33","S34", "S41","S42","S43","S44"];
Channels = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
for c = 1:16
    scpi = "CALC" + Channels(c) + ":PAR:SDEF 'Trc" + num2str(c) + "', '" + SParam(c) + "'";
    disp(scpi);
    writeline(vna,scpi);
end




%%
writeline(vna,"DISP:WIND1:STATE ON");
for c = 1:16
    scpi = "DISP:WIND1:TRAC" + num2str(c) + ":FEED 'Trc" + num2str(c) + "'";
    disp(scpi);
    writeline(vna,scpi);
end


%% Measure
writeline(vna,":INIT1:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT2:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT3:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT4:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT5:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT6:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT7:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT8:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT9:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT10:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT11:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT12:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT13:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT14:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT15:CONT OFF"); % Sets continuous mode OFF
writeline(vna,":INIT16:CONT OFF"); % Sets continuous mode OFF


%%
writeline(vna,":INIT1;*WAI"); % Triggers Channel 1 and waits until it is completed.
data1 = writeread(vna,"CALC1:DATA:NSW:FIRS? SDATA,1") % Retrieves all traces from 
%writeline(vna,":INIT2;*WAI");
%data2 = writeread(vna,"CALC2:DATA:NSW:FIRS? SDATA,1")


%%
data = [];
for c = 1:4
    scpi = "INIT" + num2str(c) + ":CONT OFF";
    disp(scpi)
    writeline(vna,scpi); % Sets continuous mode OFF
    scpi = ":INIT" + num2str(c) + ";*WAI";
    disp(scpi);
    writeline(vna,scpi); % Triggers Channel 1 and waits until it is completed.
    scpi = "CALC" + num2str(c) + ":DATA:NSW:FIRS? SDATA,1";
    disp(scpi);
    data(c) = writeread(vna,scpi) % Retrieves all traces from 
    scpi = "INIT" + num2str(c) + ":CONT ON";
    disp(scpi)
    writeline(vna,scpi); % Sets continuous mode ON
end
%%

writeline(vna,":INIT1:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT2:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT3:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT4:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT5:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT6:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT7:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT8:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT9:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT10:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT11:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT12:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT13:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT14:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT15:CONT ON"); % Sets continuous mode OFF
writeline(vna,":INIT16:CONT ON"); % Sets continuous mode OFF

%% 
% writeline(vna,"CONF:CHAN2:STAT ON");
% 
% writeline(vna,"SOUR1:FREQ:CW "+fcw);
% writeline(vna,"SOUR2:FREQ:CW "+fcw); 
% writeline(vna,"SOUR1:POW "+power);
% writeline(vna,"SOUR2:POW "+power);

% writeline(vna,"SENSE2:FREQ:STAR "+fstart);
% 
% writeline(vna,"SENSE2:FREQ:STOP "+fstop);
% 
% 
% writeline(vna,"SENSE2:SWEEP:POINTS "+points);
% writeline(vna,"SENSE1:SWE:TIME "+time);
% writeline(vna,"SENSE2:SWE:TIME "+time);


%% CALC TRACES
% writeline(vna,"CALC:PAR:DEL:ALL");
% 
% writeline(vna,"CALC1:PARAMETER:SDEFINE 'Trc1','S11'");
% writeline(vna,"CALC1:PARAMETER:SELECT 'Trc1'");
% writeline(vna,"DISP:WIND1:STATE ON");
% writeline(vna,"DISP:WIND1:TRAC1:FEED 'Trc1'");
% 
% writeline(vna,"CALC2:PARAMETER:SDEFINE 'Trc2','S21'");
% writeline(vna,"CALC2:PARAMETER:SELECT 'Trc2'");
% 
% writeline(vna,"DISP:WIND1:TRACE2:FEED 'Trc2'");
% %%
% 
% 
% writeline(vna,"INIT1:CONT OFF") % Activate single sweep mode for all channels.
% writeline(vna,"INIT2:CONT OFF")
% 
% writeline(vna,"INIT1:SCOPE SINGLE")
% writeline(vna,"INIT2:SCOPE SINGLE")
% 
% writeline(vna,"SENSE1:SWEEP:COUNT 1")
% writeline(vna,"SENSE2:SWEEP:COUNT 1")
% 
% %%
% % writeline(vna,"SYST:DISP:UPD OFF");
% 
% writeline(vna,":INIT1;*WAI");
% data1 = writeread(vna,"CALC1:DATA:NSW:FIRS? SDATA,1")
% %%
% 
% writeline(vna,":INIT2;*WAI");
% data2 = writeread(vna,"CALC2:DATA:NSW:FIRS? SDATA,1")
% 
% data = data1+","+data2
% %%
% [s11,s21] = arrange_sparam(data);
% 
% %% Remove errors
% writeline(vna,"*CLS")
% 
% %% FUNCTIONS
% function [s11,s21] = arrange_sparam(data)
%     newdata = split(data,",");
%     count = 0;
%     n = length(newdata)
%     for i=1:2:floor(n/2)
%         count = count+1;
%         re_s11(count) = newdata(i);
%         im_s11(count) = newdata(i+1);
%     end
% 
%     count=0;
%     for i=floor(n/2)+1:2:n
%         count = count+1;
%         re_s21(count) = newdata(i);
%         im_s21(count) = newdata(i+1);
%     end
% 
%     s11 = str2double(re_s11)+1j*str2double(im_s11);
%     s21 = str2double(re_s21)+1j*str2double(im_s21);
% end
% function plot_sparam(freq,s11,s21,type)
%     if type=="RI"
%         figure;
%             yyaxis left; plot(freq,real(s11)); ylabel("Real S_{11}");
%             yyaxis right; plot(freq,imag(s11)); ylabel("Imag S_{11}");
%         figure;
%             yyaxis left; plot(freq,real(s21)); ylabel("Real S_{21}");
%             yyaxis right; plot(freq,imag(s21)); ylabel("Imag S_{21}");
% 
%     elseif type=="polar"
%         figure;
%             yyaxis left; plot(freq,mag2db(abs(s11))); ylabel("dB S_{11}");
%             yyaxis right; plot(freq,rad2deg(phase(s11))); ylabel("< S_{11}");
%         figure;
%             yyaxis left; plot(freq,mag2db(abs(s21))); ylabel("dB S_{21}");
%             yyaxis right; plot(freq,rad2deg(phase(s21))); ylabel("< S_{21}");
%     else
%     fprintf("Accepted types:\n RI (Real-Imaginary)\n polar\n");
%     end

% end