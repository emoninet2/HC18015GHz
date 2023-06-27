function output = DC_Gen_Ctrl(dc1,dc2,v1,v2,v3,v4, a1,a2,a3,a4, s1,s2,s3, s4)
    writeline(dc1," OUTP "+ num2str(s1)+", (@1)")
    writeline(dc1," OUTP "+ num2str(s2)+", (@2)")
    writeline(dc1," OUTP "+ num2str(s3)+", (@3)")
    writeline(dc2," OUTP "+ num2str(s4))

    writeline(dc1,"INST CH1")
    writeline(dc1,"SOUR1:VOLT " + num2str(v1))
    writeline(dc1,"SOUR1:CURR " + num2str(a1))
    
    writeline(dc1,"INST CH2")
    writeline(dc1,"SOUR1:VOLT " + num2str(v2))
    writeline(dc1,"SOUR1:CURR " + num2str(a2))
    
    writeline(dc1,"INST CH3")
    writeline(dc1,"SOUR1:VOLT " + num2str(v3))
    writeline(dc1,"SOUR1:CURR " + num2str(a3))

    %writeline(dc2,"INST CH1")
    writeline(dc2,"SOUR1:VOLT " + num2str(v4))
    writeline(dc2,"SOUR1:CURR " + num2str(a4))

end