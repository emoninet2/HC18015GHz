function output = SetVoltages(dc1,dc2, v1,v2,v3)

    DC_Gen_Ctrl(dc1,dc2,0,0,0,0, 0,0,0,0, 0,0,0,0);

    DC_Gen_Voff = 5;
    DC_Gen_V1 = DC_Gen_Voff + v1;
    DC_Gen_V2 = DC_Gen_Voff + v2;
    DC_Gen_V3 = DC_Gen_Voff + v3;

    DC_Gen_Ctrl(dc1,dc2,DC_Gen_V1,DC_Gen_V2,DC_Gen_V3,DC_Gen_Voff, 0.2,0.2,0.2,0.2, 1,1,1,1);


end