function rp_object()   
global tcpipObj;
IP= '192.168.178.111';                %Change the IP value
port = 8080;                           %Port value
tcpipObj = tcpip(IP, port);
tcpipObj.InputBufferSize = 16384*32;   %Change the Buffer Size

fopen(tcpipObj);      %Opening connection with RP
tcpipObj.Terminator = 0;

end