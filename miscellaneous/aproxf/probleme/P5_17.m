%P5_17
x=[0.1:0.1:0.9]';
y=[0,2.212,3.0244,3.2568,3.1399,2.8579,2.514,2.1369,1.8358]';
n=length(x);
A=[ones(n,1),x,sin(pi*x),sin(2*pi*x)];
c=A\y;
t=linspace(min(x),max(x),100);
approx=c(1)*ones(size(t))+c(2)*t+c(3)*sin(pi*t)+...
    c(4)*sin(2*pi*t);
plot(x,y,'o',t,approx)