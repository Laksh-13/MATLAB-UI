function RP_stop(tcpipObj,appObj) 
uiwait(appObj); %blocks program execution and waits to resume
fwrite(tcpipObj, jsonencode(struct('running',false)));
flushinput(tcpipObj); 
fclose(tcpipObj);

end 
