function [imsaliency, imgrey, imblend] = demo_saliency(imfile, do_plot_maximum)
%--------------------------------------------------------------------------
%
% Copyright (c) 2014 Jeffrey Byrne 
%
%--------------------------------------------------------------------------

if nargin == 0 || isempty(imfile)
    imfile = 'cameraman.tif';
end
if nargin < 2
    do_plot_maximum = false;
end

imgrey = nsd.util.im2gray(imfile);
%imgrey = imresize(imgrey, 128/min(size(imgrey)));
imsaliency = nsd.saliency(imgrey);
imsaliency_rgb = ind2rgb(round(255*mat2gray(imsaliency)), jet(256));
imgrey_rgb = ind2rgb(round(255*imgrey), gray(256));
imblend = 0.25*imgrey_rgb + 0.75*imsaliency_rgb;

if nargout == 0
  figure(1); clf; imagesc(imblend); axis equal; axis off;
  if do_plot_maximum
    [v,ij] = nsd.util.max2d(imsaliency); hold on; plot(ij(2),ij(1),'k+','MarkerSize',20,'LineWidth',5);
  end
end


%% Also try
% >> demo_saliency(nsd.util.impattern('itti_koch_salient_orientation'), 1);
% >> demo_saliency('http://www.infovis.net/imagenes/T1_N179_A1063_Concavo.gif', 1);
% >> demo_saliency('http://de.academic.ru/pictures/dewiki/80/Popout.png', 1);
% >> demo_saliency('http://www.svcl.ucsd.edu/projects/discsalbu/demoimages/nonlinearity/popout_orient45.jpg', 1)
% >> demo_saliency('http://www.svcl.ucsd.edu/projects/discsalbu/demoimages/featuresearch/popout_color_bg0_3.jpg',1);
% >> demo_saliency('http://images.scholarpedia.org/w/images/1/1f/VisualSalience_OrientationPopout.png',1);
% >> demo_saliency('http://ww1.prweb.com/prfiles/2012/12/10/10221964/brand_identity.jpg',1);