tcpServer = TcpCommunicator();
tcpServer.StartPorts();
tcpServer.WriteNum(PortsDef.FIRSTPORTB, 12345678);
tcpServer.WriteString(PortsDef.FIRSTPORTA , 'abcdfg');


