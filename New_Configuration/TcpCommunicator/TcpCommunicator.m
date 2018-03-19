classdef TcpCommunicator
   properties
      TcpServerPortMap
   end
   methods (Static)
       function StartPorts
         obj.TcpServerPortMap = containers.Map('KeyType' , 'int32' , 'ValueType' , 'any');

        obj.TcpServerPortMap(PortsDef.FIRSTPORTA) =  InitServerPort(PortsDef.FIRSTPORTA);
        obj.TcpServerPortMap( PortsDef.SECONDPORTA) =  InitServerPort(PortsDef.SECONDPORTA);
        obj.TcpServerPortMap(PortsDef.FIRSTPORTB) =  InitServerPort(PortsDef.FIRSTPORTB);
        obj.TcpServerPortMap(PortsDef.SECONDPORTB) =  InitServerPort(PortsDef.SECONDPORTB);
        obj.TcpServerPortMap(PortsDef.FIRSTPORTCH) =  InitServerPort(PortsDef.FIRSTPORTCH);
        obj.TcpServerPortMap(PortsDef.FIRSTPORTCL) =  InitServerPort(PortsDef.FIRSTPORTCL);
        obj.TcpServerPortMap(PortsDef.SECONDPORTCH) =  InitServerPort(PortsDef.SECONDPORTCH);
        obj.TcpServerPortMap(PortsDef.SECONDPORTCL) =  InitServerPort(PortsDef.SECONDPORTCL);
       end
       
       function WriteString(portNum , string)
           fwrite(tcpServerPortMap(portNum) , string , 'char');`
           fwrite(tcpServerPortMap(portNum) , 10 , 'char');    
       end
   end
   methods
   end
end