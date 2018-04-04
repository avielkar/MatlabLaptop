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
            %swap the bytes beacause c++ is big endian and matlab is little
            %endian encoding.
            fwrite(obj.TcpServerPortMap(portNum) , swapbytes(val) , 'double');
        end
        
       function  obj  = TcpCommunicator()
        obj.TcpServerPortMap = containers.Map('KeyType' , 'int32' , 'ValueType' , 'any');
       end
    end
    
end