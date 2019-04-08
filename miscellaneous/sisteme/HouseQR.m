function [R,Q]=HouseQR(A)
%HouseQR - descompunere QR a lui A cu reflexii Househoulder
%apel [R,Q]=descQR(A)
%A matrice mxn, R triunghiulara superior, Q ortogonala

[m,n]=size(A);
u=zeros(m,n); %vectorii de reflexie
%obtine R
for k=1:n
    x=A(k:m,k);
    x(1)=mysign(x(1))*norm(x)+x(1);
    u(k:m,k)=x/norm(x);
    A(k:m,k:n)=A(k:m,k:n)-2*u(k:m,k)*(u(k:m,k)'*A(k:m,k:n));
end
R=triu(A(1:n,:));
if nargout==2 %se doreste Q
    Q=eye(m,n);
    for j=1:n
        for k=n:-1:1
            Q(k:m,j)=Q(k:m,j)-2*u(k:m,k)*(u(k:m,k)'*Q(k:m,j));
        end
    end
end

