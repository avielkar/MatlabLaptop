function [ tcpObject ] = TcpCommunicator()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


displayString = ['InitServerPort ' num2str(7090)];
display (displayString);

tcpServerPort = tcpip('localhost' , 7090 , 'NetworkRole' , 'Server');
fopen(tcpServerPort);

displayString = ['Connected to ' num2str(7090)];
display (displayString);



displayString = ['InitServerPort ' num2str(8090)];
display (displayString);

tcpServerPort = tcpip('localhost' , 8090 , 'NetworkRole' , 'Server');
fopen(tcpServerPort);
displayString = ['Connected to ' num2str(8090)];
display (displayString);

end
