clear all
close all

%%
% dev = ividev("AgE36xx","")
dc = visadev('TCPIP0::192.168.1.68::5025::SOCKET');
vna = visadev('TCPIP0::192.168.1.67');

%%
writeline(dc," OUTP 0, (@1)")
writeline(dc," OUTP 0, (@2)")
writeline(dc," OUTP 0, (@3)")

writeline(dc,"INST CH1")
writeline(dc,"SOUR1:VOLT 0")
writeline(dc,"SOUR1:CURR 0.2")

writeline(dc,"INST CH2")
writeline(dc,"SOUR1:VOLT 0")
writeline(dc,"SOUR1:CURR 0.2")

writeline(dc,"INST CH3")
writeline(dc,"SOUR1:VOLT 0")
writeline(dc,"SOUR1:CURR 0.2")

%%
writeline(dc," OUTP 1, (@1)")
writeline(dc," OUTP 1, (@2)")
writeline(dc," OUTP 1, (@3)")
%%
writeline(dc,"INST CH2")
writeline(dc,"SOUR1:VOLT 1.5")
writeline(dc," OUTP 1, (@1)")