%Defining the transfere function of G(S) and H(S)
%defining numerator of G(S)
G_num = [1];
%defining denominator of G(S) 
G_deno = [1 1 0];
%Generating the transfer function
G = tf(G_num, G_deno);
%defining H(S)
H = 1;

%Plotting in a new figure the step response of G(S)
figure
step(G)
%Calculating the feedback to get the closed loop transfer function
sys_closed_loop = feedback(G, H)
%Plotting the step response of the closed loop
figure
step(sys_closed_loop)

%Getting the data of the function as peak, settling time, ... 
% stepinfo(sys_closed_loop);

%plotting the poles and zeros of the closed loop transfer function
figure
pzmap(sys_closed_loop)

%Claculating error steady state of the closed loop transfer function
% ess = abs(1-CL_step(end))

%Calculating then plotting the step response of the ramp of the closed loop
%and comparing it with a normal ramp input (1/s)
%defining 's' to be used as a transfer function for ramp
S=tf('s');
%Start anew figure
figure
%Using subplot to illustrat to graphs in the same figure
subplot(1,2,1);
%getting the step response of the ramp of the closed loop
step(sys_closed_loop.*1/S)
%Using hold on to insert the other response of the ramp
hold on 
%getting the step response of the ramp (1/s)
step(1/S)
subplot(1,2,2);
step(sys_closed_loop.*1/S)
hold on 
step(1/S)
%adding legends to know every line stands for which function
legend('CL Ramp','Ramp(1/S)')
%Calculating bode plot
figure
margin (G*H)