inp1 = double((imread(['1.png'])));
inp2 = double((imread(['141.png'])));

% IETR dataset parameters
lam_1 = 5.4100;
lam_2 = 3.1100;
gam = 600;

 score = puir(inp1, inp2, lam_1, lam_2, gam)