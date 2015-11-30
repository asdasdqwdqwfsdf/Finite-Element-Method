clc;clear
load Ke4beam.mat
Hc=1/3;Hf=1/3;Ef=6.9e10;Ec=Ef*10^(-3);v=0.3;G=Ec/2*(1+v);b=1;
n=200;l=50/n;
Ke=subs(Ke);
K=zeros(3*(n+1),3*(n+1));
F=zeros(3*(n+1),1);
%%%%%%%%%%%%%%%��������նȾ���
for i=1:n
    K((3*i-2):(3*i+3),(3*i-2):(3*i+3))=Ke+K((3*i-2):(3*i+3),(3*i-2):(3*i+3));
end
%%%%%%%%%%%%%%%%����λ�Ʊ߽�����
K(1,1)=1;
K(1,2:3*(n+1))=0;
K(2:3*(n+1),1)=0;
K(3*n+1,3*n+1)=1;
for i=1:3*(n+1)
    if i~=3*n+1
        K(3*n+1,i)=0;
        K(i,3*n+1)=0;
    end
end
%%%%%%%%%%%%%%%%%����Ӧ���߽�����
F(3*(n/2+1)-2,1)=-100;
u=K\F;
x=linspace(0,50,n+1);
w=u(1:3:3*n+1);
%plot(x,w,'b','linewidth',1.5)
max1=max(abs(w));