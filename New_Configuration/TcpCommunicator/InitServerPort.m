function [tcpServerPort] =  InitServerPort(port)

displayString = ['InitServerPort ' num2str(port)];
display (displayString);

%swap the bytes beacause c++ is big endian and matlab is little
%endian encoding.
tcpServerPort = tcpip('localhost' , port , 'NetworkRole' , 'Server' ,...
    'ByteOrder' , 'littleEndian',...
    'InputBufferSize' ,  20000);            
fopen(tcpServerPort);

displayString = ['Connected to ' num2str(port)];
display (displayString);

% fclose(tcpServerPort);
end