function Q = quaddbl(F,xmin,xmax,ymin,ymax,tol,...
    quadm,varargin)
%QUADDBL - aproximeaza o integrala dubla
%Parametrii
%F - functia de integrat
%xmin,xmax,ymin,ymax - limitele de integrare
%tol -precizia, implicit 1e-6
%iintm - metoda de integrare interioara 
%quadm - metoda de integrare,  implicit adquad
if nargin < 5, error('Necesita minim 5 argumente'); end
if nargin < 6 | isempty(tol), tol = 1.e-6; end
if nargin < 7 | isempty(quadm), quadm = @adquad; end
F = fcnchk(F);

Q = quadm(@innerint, ymin, ymax, tol, F, ...
           xmin, xmax, tol, quadm, varargin{:});

%---------
function Q = innerint(y, F, xmin, xmax, tol, quadm, varargin)
%INNERINT - utilizata de QUADDBL pentru integrala interioara.
%
% quadm determina formula de cuadratura ce va fi utilizata
% Evalueaza integrala interioara pentru fiecare valoare
%  a variabilei exterioare

Q = zeros(size(y));
for i = 1:length(y)
    Q(i) = quadm(F, xmin, xmax, tol, y(i), varargin{:});
end
