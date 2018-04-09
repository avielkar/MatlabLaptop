classdef TcpCommunicator < handle
   
    properties
      TcpServerPortMap
    end
    
    methods
       function  StartPorts(obj)
        obj.TcpServerPortMap(PortsDef.FIRSTPORTA) =  InitServerPort(PortsDef.FIRSTPORTA);
        obj.TcpServerPortMap(PortsDef.SECONDPORTA) =  InitServerPort(PortsDef.SECONDPORTA);
        obj.TcpServerPortMap(PortsDef.FIRSTPORTB) =  InitServerPort(PortsDef.FIRSTPORTB);
        obj.TcpServerPortMap(PortsDef.SECONDPORTB) =  InitServerPort(PortsDef.SECONDPORTB);
        obj.TcpServerPortMap(PortsDef.FIRSTPORTCH) =  InitServerPort(PortsDef.FIRSTPORTCH);
        obj.TcpServerPortMap(PortsDef.FIRSTPORTCL) =  InitServerPort(PortsDef.FIRSTPORTCL);
        obj.TcpServerPortMap(PortsDef.SECONDPORTCH) =  InitServerPort(PortsDef.SECONDPORTCH);
        obj.TcpServerPortMap(PortsDef.SECONDPORTCL) =  InitServerPort(PortsDef.SECONDPORTCL);
       end
       
        function WriteString(obj , portNum , val)
            fwrite(obj.TcpServerPortMap(portNum) , val , 'char');
            fwrite(obj.TcpServerPortMap(portNum) , 10 , 'char');    
        end
        
        function WriteNum(obj , portNum , val)
            fwrite(obj.TcpServerPortMap(portNum) , val , 'double');
        end
        
        function val = ReadDouble(obj , portNum)
           val = fread(obj.TcpServerPortMap(portNum) , 1 , 'double');
        end
        
       function  obj  = TcpCommunicator()
        obj.TcpServerPortMap = containers.Map('KeyType' , 'int32' , 'ValueType' , 'any');
       end
    end
    
end