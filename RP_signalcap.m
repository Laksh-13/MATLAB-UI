function RP_signalcap(freq, decfactor, avg, gain,tcpipObj,appObj)
% global tcpipObj;
% global appObj;
%flushinput(tcpipObj);
%flushouptut(tcpipObj);
message = jsonencode(struct('Running',true,'Frequency',freq,'Decimation',decfactor,'Gain',gain,'Averaging',avg));
fwrite(tcpipObj,length(message)+1,'uint32');
fprintf(tcpipObj,message);
pause(1);
%reading data from buffer
signal_num=fread(tcpipObj,4096/2,'int16');
% Only if% First character in string is “{“
% and 2 latest are empty spaces and last is “}”.
signal_i =signal_num(1:2:4096/2);  %I stream
signal_q =signal_num(2:2:4096/2);  %Q stream
signal_c = signal_i + signal_q * 1i;
%liveplotting
% h=animatedline;
% for k = 1:length(signal_c)
%     
%     addpoints(h,k,singal_c);
%     drawnow limitrate
% end
% 
% drawnow
%plotting
plot(appObj.UIAxes,signal_c)
% hold on
% plot(app.UIAxes,signal_num_2,'r')

plot(appObj.UIAxes_2,abs(fft(signal_c)))
% hold on
% plot(app.UIAxes_2,fft(signal_num_2),'r')




