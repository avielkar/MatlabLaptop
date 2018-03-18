function [tcpServerPort] =  InitServerPort(port)

displayString = ['InitServerPort ' num2str(port)];
display (displayString);

tcpServerPort = tcpip('localhost' , port , 'NetworkRole' , 'Server');
fopen(tcpServerPort);

displayString = ['Connected to ' num2str(port)];
display (displayString);

% fclose(tcpServerPort);
end