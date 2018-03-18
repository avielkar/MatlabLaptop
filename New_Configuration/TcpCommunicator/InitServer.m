function [ tcpServerPortMap ] = InitServer( ports )
%UNTITLED start listening to ports connection request by order.
%   The server listen to a echo port and after connecting listens to other
%   one by a specific order.

tcpServerPortMap = containers.Map('KeyType' , 'int32' , 'ValueType' , 'any');


tcpServerPortMap(PortsDef.FIRSTPORTA) =  InitServerPort(PortsDef.FIRSTPORTA);
tcpServerPortMap( PortsDef.SECONDPORTA) =  InitServerPort(PortsDef.SECONDPORTA);
tcpServerPortMap(PortsDef.FIRSTPORTB) =  InitServerPort(PortsDef.FIRSTPORTB);
tcpServerPortMap(PortsDef.SECONDPORTB) =  InitServerPort(PortsDef.SECONDPORTB);
tcpServerPortMap(PortsDef.FIRSTPORTCH) =  InitServerPort(PortsDef.FIRSTPORTCH);
tcpServerPortMap(PortsDef.FIRSTPORTCL) =  InitServerPort(PortsDef.FIRSTPORTCL);
tcpServerPortMap(PortsDef.SECONDPORTCH) =  InitServerPort(PortsDef.SECONDPORTCH);
tcpServerPortMap(PortsDef.SECONDPORTCL) =  InitServerPort(PortsDef.SECONDPORTCL);

fwrite(tcpServerPortMap(PortsDef.FIRSTPORTA) , 'abcdefghijklmnop' , 'char');
fwrite(tcpServerPortMap(PortsDef.FIRSTPORTA) , 10 , 'char');

end

