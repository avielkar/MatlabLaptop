tcpServer = TcpCommunicator();
tcpServer.StartPorts();
val = tcpServer.ReadDouble(PortsDef.FIRSTPORTB)
tcpServer.WriteNum(PortsDef.FIRSTPORTB, 12345678);
tcpServer.WriteString(PortsDef.FIRSTPORTA , 'abcdfg');


