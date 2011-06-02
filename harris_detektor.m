% Mike Schreiber, tum.mike@googlemail.com, Matrikelnummer: 3021909
% Philipp Tiefenbacher, philtief@googlemail.com, Matrikelnummer:
% Clemens Horch, ch@tum.de, Matrikelnummer: 3013692
% Kinan Mahdi, kinan.mahdi@tum.de, Matrikelnummer:

%HARRIS_DETEKTOR
function Merkmale=harris_detektor(Bild, W, k, tau, do_plot)
%function Merkmale=harris_detektor(Bild, W, k, tau, tile_size, N, min_dist, do_plot)
if size(Bild,3) == 3
    Bild = rgb_to_gray(Bild);
end

[Fx,Fy]=sobel_xy(Bild);

G=zeros(2,2);
windowX=zeros(W,W);
windowY=zeros(W,W);
windowXY=zeros(W,W);
i=1;

Fx2=Fx.^2;
Fy2=Fy.^2;
FxFy=Fx.*Fy;

W=(W-1)/2;

for r=W+1:size(Bild,1)-W
    for c=W+1:size(Bild,2)-W
        windowX=Fx2(r-W:r+W,c-W:c+W);
        windowY=Fy2(r-W:r+W,c-W:c+W);
        windowXY=FxFy(r-W:r+W,c-W:c+W);
        G(1,1)=sum(windowX(:));
        G(1,2)=sum(windowXY(:));
        G(2,1)=G(1,2);
        G(2,2)=sum(windowY(:));

        % Option 1:
        d=eig(G);
        C=sqrt(min(d(:)));        
        
        % Option 2:
        %C=det(G)-k*(trace(G))^2;
        
        if C > tau
            Merkmale(i,:)=[r c];
            i=i+1;
        end
    end
end

% for r=W+1:size(Bild,1)-W
%     for c=W+1:size(Bild,2)-W
%         windowX=Fx(r-W:r+W,c-W:c+W);
%         windowY=Fy(r-W:r+W,c-W:c+W);
%         G(1,1)=sum(sum(windowX*windowX));
%         G(1,2)=sum(sum(windowX*windowY));
%         G(2,1)=G(1,2);
%         G(2,2)=sum(sum(windowY*windowY));
%
%         C=det(G)-k*trace(G)^2;
%         if C > tau
%            Merkmale(i,:)=[r c];
%            i=i+1;
%         end
%         sigma2(i)=C;
%         i=i+1;


%         d=eig(G);
%         v=sqrt(min(d(:)));
%         if v > tau
%             sigma2(i)=v;
%             Merkmale(i,:)=[r c];
%             i=i+1;
%         end

% end
% end



if do_plot==1
    %     min(sigma2(:))
    %     max(sigma2(:))
    %     mean(sigma2(:))
    %     size(sigma2)
    size(Merkmale)

    imshow(Bild)
    hold on

    x=Merkmale(:,2);
    y=Merkmale(:,1);
    
    plot(x,y,'bx');
    

    hold off

end

end